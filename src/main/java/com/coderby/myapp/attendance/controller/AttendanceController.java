package com.coderby.myapp.attendance.controller;

import java.nio.charset.Charset;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coderby.myapp.attendance.model.AttendStat;
import com.coderby.myapp.attendance.model.AttendanceVO;
import com.coderby.myapp.attendance.model.ReportsVO;
import com.coderby.myapp.attendance.service.IAttendanceService;
import com.coderby.myapp.attendance.service.IReportsService;
import com.coderby.myapp.classes.service.IClassService;
import com.coderby.myapp.file.model.FileVO;
import com.coderby.myapp.file.service.IFileService;

@Controller
//@EnableScheduling
public class AttendanceController {

	@Autowired
	IAttendanceService attendanceService;

	@Autowired
	IReportsService reportsService;

	@Autowired
	IFileService fileService;

	@Autowired
	IClassService classService;

	@RequestMapping("/attend/today")
	public String attendToday(HttpSession session, Model model) {
		AttendanceVO attendVO = new AttendanceVO();
		String stdId = (String) session.getAttribute("stdId");
		attendVO = attendanceService.attendToday(stdId);
		if (attendVO != null) {
			if (attendVO.getOutTime() != null) {
			}
			model.addAttribute("attendVO", attendVO);
		} else {
			return "attendance/attend";
		}
		System.out.println("VO:  " + attendVO.toString());
		return "attendance/attend";
	}

	// 출석버튼 click
	@RequestMapping("/attend/in")
	public String attendIn(HttpSession session, Model model) {
		Date nowDate = new Date(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		String stdId = (String) session.getAttribute("stdId");
		String now =  format.format(nowDate);
		attendanceService.attendIn(stdId, now);
		return "redirect:/attend/today";
	}

	// 퇴근버튼 click
	@RequestMapping("/attend/out")
	public String attendOut(HttpSession session, Model model) {
		String stdId = (String) session.getAttribute("stdId");
		attendanceService.attendOut(stdId);
		return "redirect:/attend/today";
	}

	// 휴가신청 url get요청
	@RequestMapping(value = "/reports/write", method = RequestMethod.GET)
	public String writeReport() {
		return "attendance/reportsWrite";
	}

	// 휴가 신청
	@RequestMapping(value = "/reports/write", method = RequestMethod.POST)
	public String writeReport(ReportsVO reports, RedirectAttributes redirectAttr, HttpSession session, Model model) {
		Date now = new Date(System.currentTimeMillis());
		// 내가 원하는 format으로 바꾸기
		// SimpleDateFormat transFormat = new SimpleDateFormat("yyy-MM-dd HH:mm:ss");
		boolean isFinal = reportsService.insertReports(reports, now);
		try {
			// DB에 게시판에 작성한 내용 등록
			if (isFinal) {
				List<MultipartFile> mfileList = reports.getMultiFile();

				if (mfileList != null && !mfileList.isEmpty()) {
					for (MultipartFile mfile : mfileList) {
						FileVO fileVO = new FileVO();
						fileVO.setFileName(mfile.getOriginalFilename());
						fileVO.setFileType(mfile.getContentType());
						fileVO.setFileSize(mfile.getSize());
						fileVO.setFileData(mfile.getBytes());

						fileService.uploadFile(reports.getRepId(), fileVO);
					}
				}
			}
		} catch (Exception e) {
			redirectAttr.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/attend/studentreportslist";
	}

	// 휴가 취소
	@RequestMapping("/reports/cancle/{repId}")
	public String cancleReport(@PathVariable("repId") int repId, Model model, HttpSession session) {
		Date now = new Date(System.currentTimeMillis());
		reportsService.deleteReprots(repId, now);
		char isManager = (Character) session.getAttribute("isManager");
		//관리자면 
		if(isManager == 'Y') {
			return "redirect:/attend/reportslist";
		}else {
			return "redirect:/attend/studentreportslist";
		}
	}

	// 24시 일때 학생 status추가
	@Scheduled(cron = "0 0 0 * * *")
	@RequestMapping("/attendance/getStatus")
	public void getStudentStatus(ReportsVO reports, HttpSession session, Model model) {
		// reports.getRepDate()의 값을 jsp단에서 hidden으로 주던지 sysdate를 넣어서 데이트를 넣어야함
		// 24시 일때마다 모든학생들을 더 해주어야한다.
		List<String> attend = attendanceService.getAllStd();
		for (String attId : attend) {
			String stdId = attId;
			attendanceService.updateStatus(stdId);
		}
	}

	// 반 휴가 신청 목록
	// classId, year, month, status, reqType
	@RequestMapping(value = "/attend/reportslist", method = RequestMethod.POST)
	public String getReportsList(String classId, String yearParam, String monthParam, String repType, String repStatus,
			Model model) {
		List<ReportsVO> reportsList = reportsService.getReportsList(classId, yearParam, monthParam, repType, repStatus);
		List<Integer> classIdList = classService.getClassIdList();
		model.addAttribute("classIdList", classIdList);
		model.addAttribute("reportsList", reportsList);
		model.addAttribute("selectedClassId", classId);
		model.addAttribute("yearParam", yearParam);
		model.addAttribute("monthParam", monthParam);
		model.addAttribute("repType", repType);
		model.addAttribute("repStatus", repStatus);
		return "attendance/reportsList";
	}

	// 학생의 휴가 신청 목록 조회(학생)
	// year, month, status, reqType
	@RequestMapping(value = "/attend/studentreportslist", method = RequestMethod.POST)
	public String getStudentReportsList(String yearParam, String monthParam, String repType, String repStatus,
			Model model, HttpSession session) {
		String stdId = (String) session.getAttribute("stdId");
		List<ReportsVO> reportsList = reportsService.getStudentReportsList(yearParam, monthParam, repType, repStatus,
				stdId);
		model.addAttribute("reportsList", reportsList);
		// jsp의 selectbox selected값 기억하기 위해서
		model.addAttribute("yearParam", yearParam);
		model.addAttribute("monthParam", monthParam);
		model.addAttribute("repType", repType);
		model.addAttribute("repStatus", repStatus);
		return "attendance/studentReportsList";
	}

	// 학생의 휴가 신청 목록 조회(학생)
	@RequestMapping(value = "/attend/studentreportslist", method = RequestMethod.GET)
	public String getStudentReportsList(Model model, HttpSession session) {
		return getStudentReportsList("2023", "1", "전체", "전체", model, session);
	}

	// 반 휴가 신청 목록
	@RequestMapping(value = "/attend/reportslist", method = RequestMethod.GET)
	public String getReportsList(Model model) {
		return getReportsList("전체", "2023", "1", "전체", "전체", model);
	}

	// 휴가 상세 조회
	@RequestMapping("/attend/reportsdetail/{repId}")
	public String getReportsDetail(@PathVariable("repId") int repId, Model model) {
		ReportsVO reportsVO = reportsService.getReportsDetail(repId);
		DateFormat repDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat inOutTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// Date to String
		String repDateStr = repDateFormat.format(reportsVO.getRepDate());
		String inTimeStr = inOutTimeFormat.format(reportsVO.getInTime());
		String outTimeStr = inOutTimeFormat.format(reportsVO.getOutTime());
		model.addAttribute("reportsVO", reportsVO);
		model.addAttribute("repDateStr", repDateStr);
		model.addAttribute("inTimeStr", inTimeStr);
		model.addAttribute("outTimeStr", outTimeStr);
		return "attendance/reportsDetail";
	}

	// 관리자 status 업데이트
	@RequestMapping(value = "/attend/reportsstatusupdate", method = RequestMethod.POST)
	public String updateReportsStatus(ReportsVO repVO, String updateRepStatus, String repDateStr, String inTimeStr,
			String outTimeStr, Model model, HttpSession session) {
		System.out.println("도착");
		DateFormat repDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat inOutTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// String To Date
		try {
			repVO.setRepDate(repDateFormat.parse(repDateStr));
			repVO.setInTime(inOutTimeFormat.parse(inTimeStr));
			repVO.setOutTime(inOutTimeFormat.parse(outTimeStr));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}

		try {
			reportsService.updateRepStatus(repVO, updateRepStatus);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// 업데이트한 휴가의 상세페이지로 redirect
		return "redirect:/attend/reportsdetail/" + repVO.getRepId();
	}

	// 전체 학생 월간 근태 조회 (관리자 메인)
	@RequestMapping("/attend/getAllAttend")
	public String getAllAttend(String yearParam, String monthParam, Model model, HttpSession session) {
		int classId = (Integer) session.getAttribute("classId");
		List<AttendStat> attendStatList = attendanceService.getAllAttendStat(classId, yearParam, monthParam);
		model.addAttribute("attendStatList", attendStatList);
		model.addAttribute("yearParam", yearParam);
		model.addAttribute("monthParam", monthParam);
		return "attendance/adminMainPage";
	}

	// 특정 학생 월간 근태 조회
	@RequestMapping("/attend/getStudentAttend")
	public String getStudentAttend(String yearParam, String monthParam,
			Model model, HttpSession session) {
		String studentId = (String)session.getAttribute("lookingStdId");
		AttendStat attendStat = attendanceService.getStudentAttendStat(studentId, yearParam, monthParam);
		List<AttendanceVO> attendanceVoList = attendanceService.getStudentAttendList(studentId, yearParam, monthParam);
		model.addAttribute("attendStat", attendStat);
		model.addAttribute("attendanceVoList", attendanceVoList);
		model.addAttribute("yearParam", yearParam);
		model.addAttribute("monthParam", monthParam);
		return "attendance/studentAttend";
	}

	// 전체 학생 월간 근태 조회 (관리자메인, 첫 요청)
	@RequestMapping("/attend/getAllAttend/{classId}")
	public String getAllAttend(@PathVariable("classId") int classId, Model model, HttpSession session) {
		session.setAttribute("classId", classId);
		return getAllAttend("2023", "1", model, session);
	}

	// 특정 학생 월간 근태 조회 (첫 요청)
	@RequestMapping("/attend/getStudentAttend/{studentId}")
	public String getStudentAttend(@PathVariable("studentId") String studentId, Model model, HttpSession session) {
		session.setAttribute("lookingStdId", studentId);
		return getStudentAttend("2023", "1", model, session);
	}

	// 파일 다운로드
	@RequestMapping("/attend/filedownload/{fileId}")
	public ResponseEntity<byte[]> downloadFile(@PathVariable("fileId") int fileId) {
		FileVO file = fileService.downloadFile(fileId);
		System.out.println(file.getFileName());
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = file.getFileType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(file.getFileSize());
		headers.setContentDispositionFormData("attachment", file.getFileName(), Charset.forName("UTF-8"));
		return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
	}

	/*
	 * // String to Date public Date stringToDate(String date, String
	 * toFormatString) { SimpleDateFormat formFormat = new
	 * SimpleDateFormat(toFormatString); Date formDate = null; try { formDate =
	 * formFormat.parse(date); } catch (ParseException e) { formDate = new Date(); }
	 * return formDate; }
	 * 
	 * // Date to String public String dateToString(Date date, String
	 * toFormatString) { SimpleDateFormat formFormat = new
	 * SimpleDateFormat(toFormatString); String dateToStr = formFormat.format(date);
	 * System.out.println("after:" + dateToStr); return dateToStr; }
	 */
}

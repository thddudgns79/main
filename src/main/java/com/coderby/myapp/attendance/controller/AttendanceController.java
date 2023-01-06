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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coderby.myapp.attendance.model.AttendanceVO;
import com.coderby.myapp.attendance.model.ReportsVO;
import com.coderby.myapp.attendance.service.IAttendanceService;
import com.coderby.myapp.attendance.service.IReportsService;
import com.coderby.myapp.classes.service.IClassService;
import com.coderby.myapp.file.model.FileVO;
import com.coderby.myapp.file.service.IFileService;

@Controller
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
		String stdId = (String)session.getAttribute("stdId");
		attendVO = attendanceService.attendToday(stdId);
		if(attendVO!=null) {
			if(attendVO.getOutTime()!=null) {
			}
			model.addAttribute("attendVO", attendVO);
		}else {
			return "attendance/attend";
		}
		System.out.println("VO:  "+attendVO.toString());
		return "attendance/attend";
	}
	
	//출석버튼 click
	@RequestMapping("/attend/in")
	public String attendIn(HttpSession session, Model model) {
		String stdId = (String)session.getAttribute("stdId");
		attendanceService.attendIn(stdId);
		return "redirect:/attend/today";
	}
	
	//퇴근버튼 click
	@RequestMapping("/attend/out")
	public String attendOut(HttpSession session, Model model) {
		String stdId = (String)session.getAttribute("stdId");
		attendanceService.attendOut(stdId);
		return "redirect:/attend/today";
	}
	
	//휴가신청 url get요청
	@RequestMapping(value="/reports/write", method=RequestMethod.GET)
	public String writeReport() {
		return "attendance/reportsWrite";
	}
	
	//휴가 신청
	@RequestMapping(value="/reports/write", method=RequestMethod.POST)
	public String writeReport(ReportsVO reports, BindingResult result, RedirectAttributes redirectAttr,HttpSession session, Model model) {
		Date now = new Date(System.currentTimeMillis());
		//내가 원하는 format으로 바꾸기
		//SimpleDateFormat transFormat = new SimpleDateFormat("yyy-MM-dd HH:mm:ss");
		
		try {
			//DB에 게시판에 작성한 내용 등록
			
			MultipartFile mfile = reports.getFile();

			if(mfile!=null && !mfile.isEmpty()) {
				FileVO fileVO = new FileVO();
				fileVO.setFileName(mfile.getOriginalFilename());
				fileVO.setFileType(mfile.getContentType());
				fileVO.setFileSize(mfile.getSize());
				fileVO.setFileData(mfile.getBytes());
				//휴가 파일 업로드
				reportsService.insertReports(reports, now, fileVO);
			}
		}catch (Exception e) {
			redirectAttr.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:휴가리스트";
	}
	
	//휴가 취소
	@RequestMapping("/reports/cancle/{repId}")
	public String cancleReport(@PathVariable("repId")int repId, Model model ) {
		Date now = new Date(System.currentTimeMillis());
		reportsService.deleteReprots(repId, now);
		return "redirect:휴가리스트";
	}
	
	//휴가 파일 다운로드
	@RequestMapping("/reports/file/{fileId}")
	public ResponseEntity<byte[]> getFileList(@PathVariable("fileId") int fileId, Model model) {
		FileVO file = fileService.downloadFile(fileId);
		
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = file.getFileType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(file.getFileSize());
		headers.setContentDispositionFormData("attachment", file.getFileName(), Charset.forName("UTF-8"));
		
		return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
		
	}
	
	//String to Date
	public Date stringToDate(String date,String toFormatString) {
		SimpleDateFormat formFormat = new SimpleDateFormat(toFormatString);
		Date formDate = null;
		try {
			formDate = formFormat.parse(date);
		}catch(ParseException e) {
			formDate = new Date();
		}
		return formDate;
	}
	
	//Date to String
	public String dateToString(Date date,String toFormatString) {
		SimpleDateFormat formFormat = new SimpleDateFormat(toFormatString);
		String dateToStr = formFormat.format(date);
		System.out.println("after:"+dateToStr);
		return dateToStr;
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
			return "classes/reportsList";
		}

		@RequestMapping(value = "/attend/reportslist", method = RequestMethod.GET)
		public String getReportsList(Model model) {
			return getReportsList("전체", "2022", "12", "전체", "전체", model);
		}

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
			return "classes/reportsDetail";
		}

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
	
}

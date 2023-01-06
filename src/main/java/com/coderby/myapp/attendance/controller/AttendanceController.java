package com.coderby.myapp.attendance.controller;

import java.nio.charset.Charset;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
			
			MultipartFile mfile = reports.getrFile();

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
	
}

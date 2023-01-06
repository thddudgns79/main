package com.coderby.myapp.classes.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coderby.myapp.attendance.model.ReportsVO;
import com.coderby.myapp.classes.service.IClassService;
import com.coderby.myapp.classes.service.IReportsService;
import com.coderby.myapp.file.model.FileVO;
import com.coderby.myapp.file.service.IFileService;

@Controller
public class ReportsController {
	@Autowired
	IReportsService reportsService;

	@Autowired
	IClassService classService;

	@Autowired
	IFileService fileService;

	// 클래스의 섹션 리스트 조회
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

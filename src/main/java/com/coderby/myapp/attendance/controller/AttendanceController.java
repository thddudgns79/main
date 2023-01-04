package com.coderby.myapp.attendance.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coderby.myapp.attendance.model.AttendanceVO;
import com.coderby.myapp.attendance.service.IAttendanceService;

@Controller
public class AttendanceController {
	@Autowired
	IAttendanceService attendanceService;
	
	@RequestMapping("/attend/today")
	public String attendToday(HttpSession session, Model model) {
		AttendanceVO attendVO = new AttendanceVO();
		String stdId = (String)session.getAttribute("stdId");
		attendVO = attendanceService.attendToday(stdId);
		model.addAttribute("attendVO", attendVO);
		return "attendance/attend";
	}
	
	@RequestMapping("/attend/in")
	public String attendIn(HttpSession session, Model model) {
		String stdId = (String)session.getAttribute("stdId");
		attendanceService.attendIn(stdId);
		return "redirect:/attend/today";
	}
	
	@RequestMapping("/attend/out")
	public String attendOut(HttpSession session, Model model) {
		String stdId = (String)session.getAttribute("stdId");
		attendanceService.attendOut(stdId);
		return "redirect:/attend/today";
	}
	
}

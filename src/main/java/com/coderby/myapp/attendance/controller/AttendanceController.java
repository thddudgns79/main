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
		if(attendVO.getInTime()!=null) {
			attendVO = attendanceService.attendToday(stdId);
			model.addAttribute("attendVO", attendVO);
			if(attendVO.getOutTime()!=null) {
				int result = attendVO.getInTime().compareTo(attendVO.getOutTime());
				System.out.println("날짜계산: "+result);
				model.addAttribute("result",result);
			}
		}
//		System.out.println("VO:  "+attendVO.toString());
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
	
}

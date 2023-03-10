package com.coderby.myapp.classes.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coderby.myapp.classes.model.StudentVO;
import com.coderby.myapp.classes.service.IStudentService;

@Controller
public class StudentController {
	
	@Autowired
	IStudentService studentService;
	
	@RequestMapping(value="/student/login", method=RequestMethod.POST)
	public String login(String stdId, String password, HttpSession session, Model model) {
		StudentVO student = studentService.selectStudent(stdId);
		if(student !=null) {
			String dbPassword = student.getStdPassword();
			if(dbPassword==null) {
				//아이디없음
				model.addAttribute("message", "NOT_VALID_USER");
				return "home";
			}else {
				if(dbPassword.equals(password)) {
					//비밀번호 일치
					if(student.getIsManager()=='N') {
						//학생일때
						session.setAttribute("stdId", stdId);
						session.setAttribute("isManager", student.getIsManager());
						session.setAttribute("classId", student.getClassId());
						session.setAttribute("lookingStdId", stdId);
						return "redirect:/attend/today";
					}else {
						//매니저일때
						session.setAttribute("stdId", stdId);
						session.setAttribute("isManager", student.getIsManager());
						return "redirect:/attend/today";
					}
				}else {
					//비밀번호 불일치
					model.addAttribute("message", "WRONG_NOT_PASSWORD");
				}
			}
		}else{
			model.addAttribute("message", "USER_NOT_FOUND");
		}
		return "home";
	}
   
	
	@RequestMapping(value="/student/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();//로그아웃
		return "redirect:/";
	}
}

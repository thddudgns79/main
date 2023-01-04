package com.coderby.myapp.classes.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coderby.myapp.classes.model.ClassVO;
import com.coderby.myapp.classes.service.IClassService;

@Controller
public class ClassController {
	@Autowired
	IClassService classService;
	
	@RequestMapping("/class/classlist")
	public String getClassList(String orgName, String className, Model model) {
		// 검색 키워드 있을 경우
		if(!className.equals("")) {
			className = "%" + className + "%";
		}
		// 검색 키워드 없을 경우
		else {
			className = null;
		}
		List<ClassVO> classList = classService.getClassList(orgName, className);
		for(ClassVO classVo :classList) {
			System.out.println(classVo.getClassName());
		}
		model.addAttribute("classList", classList);
		return "classes/classList";
	}
}

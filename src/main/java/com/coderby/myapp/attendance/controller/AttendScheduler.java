package com.coderby.myapp.attendance.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coderby.myapp.attendance.model.ReportsVO;
import com.coderby.myapp.attendance.service.IAttendanceService;

@Component
public class AttendScheduler {
	
	@Autowired
	IAttendanceService attendanceService;

	// 24시 일때 학생 status추가
	//@Scheduled(cron = "0 0 0 * * *")
	@Scheduled(cron = "0 0 18 * * *")
	public void getStudentStatus(ReportsVO reports, HttpSession session, Model model) {
		// reports.getRepDate()의 값을 jsp단에서 hidden으로 주던지 sysdate를 넣어서 데이트를 넣어야함
		// 24시 일때마다 모든학생들을 더 해주어야한다.
		List<String> attend = attendanceService.getAllStd();
		for (String attId : attend) {
			String stdId = attId;
			attendanceService.updateStatus(stdId);
		}
	}
}

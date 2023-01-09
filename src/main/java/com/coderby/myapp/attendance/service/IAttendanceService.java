package com.coderby.myapp.attendance.service;

import java.util.List;

import com.coderby.myapp.attendance.model.AttendStat;
import com.coderby.myapp.attendance.model.AttendanceVO;

public interface IAttendanceService {
	void attendIn(String stdId);

	void attendOut(String stdId);

	AttendanceVO attendToday(String stdId);
	
	List<String> getAllStd();
	
	void updateStatus(String stdId);

	List<AttendStat> getAllAttendStat(int classId, String yearParam, String monthParam);
	
	AttendStat getStudentAttendStat(String studentId, String yearParam, String monthParam);
		
	List<AttendanceVO> getStudentAttendList(String studentId, String yearParam, String monthParam);

	
}

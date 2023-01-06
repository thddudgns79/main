package com.coderby.myapp.attendance.service;

import com.coderby.myapp.attendance.model.AttendanceVO;

public interface IAttendanceService {
	void attendIn(String stdId);
	void attendOut(String stdId);
	AttendanceVO attendToday(String stdId);
}

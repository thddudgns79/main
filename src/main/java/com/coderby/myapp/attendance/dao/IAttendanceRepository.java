package com.coderby.myapp.attendance.dao;

import com.coderby.myapp.attendance.model.AttendanceVO;

public interface IAttendanceRepository {
	void attendIn(String stdId);
	void attendOut(String stdId);
	AttendanceVO attendToday(String stdId);
}

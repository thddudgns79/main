package com.coderby.myapp.attendance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coderby.myapp.attendance.dao.IAttendanceRepository;
import com.coderby.myapp.attendance.model.AttendanceVO;

@Service
public class AttendanceService implements IAttendanceService {
	@Autowired
	IAttendanceRepository attendanceRepository;

	//현재 상태 출력
	@Override
	public AttendanceVO attendToday(String stdId) {
		return attendanceRepository.attendToday(stdId);
	}
	
	//출근 버튼
	@Override
	public void attendIn(String stdId) {
		attendanceRepository.attendIn(stdId);
	}
	
	//퇴근버튼
	@Override
	public void attendOut(String stdId) {
		attendanceRepository.attendOut(stdId);
	}

	
	
}

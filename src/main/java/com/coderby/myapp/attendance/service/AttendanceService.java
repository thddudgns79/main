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
		AttendanceVO selectAttend = attendanceRepository.attendToday(stdId);
		if(selectAttend == null) {
			attendanceRepository.attendIn(stdId);
		}else {
			//출근한적 있음
		}
		
	}
	
	//퇴근버튼
	@Override
	public void attendOut(String stdId) {
		AttendanceVO selectAttend = attendanceRepository.attendToday(stdId);
		if(selectAttend != null && selectAttend.getInTime()!=null && selectAttend.getOutTime()==null) {
			//출근 기록이 있고 퇴근 기록이 없어야한다.
			attendanceRepository.attendOut(stdId);
		}else {
			//출근을 안했을수도 있고, 
		}
		
	}

}

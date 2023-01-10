package com.coderby.myapp.attendance.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.coderby.myapp.attendance.model.AttendanceVO;

public interface IAttendanceRepository {
	void attendIn(@Param("stdId") String stdId, @Param("now") String now);

	void attendOut(String stdId);
	
	AttendanceVO selectAttend(@Param("date") Date date, @Param("studentId") String studentId);
	
	List<String> getAllStd();

	void updateStatus(@Param("stdId") String stdId, @Param("date") Date date, @Param("status") String status);

	void insertBlank(@Param("stdId") String stdId, @Param("status") String status);

	AttendanceVO attendToday(String stdId);
	
	List<AttendanceVO> attendAll(String stdId);

	List<Map<String, Object>> getStudentAttendStat(@Param("studentId") String studentId,
			@Param("yearParam") String yearParam, @Param("monthParam") String monthParam);

	List<AttendanceVO> getStudentAttendList(@Param("studentId") String studentId, @Param("yearParam") String yearParam,
			@Param("monthParam") String monthParam);

	List<String> getClassStudentIdList(@Param("classId") int classId);
	
	void updateAttendStatus(@Param("attendanceDate") Date attendanceDate, 
			@Param("studentId") String studentId, @Param("updateStatus") String updateStatus);
}

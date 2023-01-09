package com.coderby.myapp.attendance.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.coderby.myapp.attendance.model.AttendanceVO;

public interface IAttendanceRepository {
	void attendIn(String stdId);

	void attendOut(String stdId);

	List<String> getAllStd();

	void updateStatus(@Param("stdId") String stdId, @Param("status") String status);

	void insertBlank(@Param("stdId") String stdId, @Param("status") String status);

	AttendanceVO attendToday(String stdId);

	List<Map<String, Object>> getStudentAttendStat(@Param("studentId") String studentId,
			@Param("yearParam") String yearParam, @Param("monthParam") String monthParam);

	List<AttendanceVO> getStudentAttendList(@Param("studentId") String studentId, @Param("yearParam") String yearParam,
			@Param("monthParam") String monthParam);

	List<String> getClassStudentIdList(@Param("classId") int classId);
}

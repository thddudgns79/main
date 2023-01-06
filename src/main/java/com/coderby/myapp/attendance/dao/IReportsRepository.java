package com.coderby.myapp.attendance.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.coderby.myapp.attendance.model.AttendanceVO;
import com.coderby.myapp.attendance.model.ReportsVO;

public interface IReportsRepository {
	List<ReportsVO> selectReports(ReportsVO reports);

	void insertReports(ReportsVO reports);

	void deleteReports(int repId);

	ReportsVO selectRep(int repId);

	List<ReportsVO> getReportsList(@Param("classId") String classId, @Param("yearParam") String yearParam,
			@Param("monthParam") String monthParam, @Param("repType") String repType,
			@Param("repStatus") String repStatus);

	List<ReportsVO> getStudentReportsList(@Param("yearParam") String yearParam, @Param("monthParam") String monthParam,
			@Param("repType") String repType, @Param("repStatus") String repStatus, @Param("stdId") String stdId);

	ReportsVO getReportsDetail(int repId);

	void updateRepStatus(@Param("repId") int repId, @Param("updateRepStatus") String updateRepStatus);

	void updateOutTime(@Param("repDate") Date repDate, @Param("studentId") String studentId,
			@Param("outTime") Date outTime);

	void insertNineToSixAttendanceRow(AttendanceVO attendanceVO);

	void deleteAttedanceRow(@Param("repDate") Date repDate, @Param("studentId") String studentId);

}

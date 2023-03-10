package com.coderby.myapp.attendance.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.coderby.myapp.attendance.model.AttendanceVO;
import com.coderby.myapp.attendance.model.ReportsVO;
import com.coderby.myapp.util.Pager;

public interface IReportsRepository {
	List<ReportsVO> selectReports(ReportsVO reports);
	List<ReportsVO> selectStdReports(@Param("stdId") String stdId, @Param("date") Date date);
	void insertReports(ReportsVO reports);

	void deleteReports(int repId);

	ReportsVO selectRep(int repId);

	List<ReportsVO> getReportsList(@Param("classId") String classId, @Param("yearParam") String yearParam,
			@Param("monthParam") String monthParam, @Param("repType") String repType,
			@Param("repStatus") String repStatus, @Param("pager") Pager pager);
	
	int getReportsListCount(@Param("classId") String classId, @Param("yearParam") String yearParam,
			@Param("monthParam") String monthParam, @Param("repType") String repType,
			@Param("repStatus") String repStatus);

	List<ReportsVO> getStudentReportsList(@Param("yearParam") String yearParam, @Param("monthParam") String monthParam,
			@Param("repType") String repType, @Param("repStatus") String repStatus, @Param("stdId") String stdId, @Param("pager") Pager pager);

	int getStudentReportsListCount(@Param("yearParam") String yearParam, @Param("monthParam") String monthParam,
			@Param("repType") String repType, @Param("repStatus") String repStatus, @Param("stdId") String stdId);
	
	ReportsVO getReportsDetail(int repId);

	void updateRepStatus(@Param("repId") int repId, @Param("updateRepStatus") String updateRepStatus);

	void updateOutTime(@Param("repDate") Date repDate, @Param("studentId") String studentId,
			@Param("outTime") Date outTime);

	void insertNineToSixAttendanceRow(AttendanceVO attendanceVO);

	void deleteAttedanceRow(@Param("repDate") Date repDate, @Param("studentId") String studentId);

}

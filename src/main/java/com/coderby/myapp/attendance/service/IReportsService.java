package com.coderby.myapp.attendance.service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.coderby.myapp.attendance.model.ReportsVO;
import com.coderby.myapp.util.Pager;

public interface IReportsService {
	String insertReports(ReportsVO reports, Date now);
	
	void deleteReprots(int repId, Date now);

	List<ReportsVO> getReportsList(String classId, String yearParam, String monthParam, String repType,
			String repStatus, Pager pager);

	int getReportsListCount(String classId, String yearParam, String monthParam, String repType, String repStatus);

	List<ReportsVO> getStudentReportsList(String yearParam, String monthParam, String repType, String repStatus,
			String stdId, Pager pager);

	int getStudentReportsListCount(String yearParam, String monthParam, String repType, String repStatus, String stdId);

	ReportsVO getReportsDetail(int repId);

	void updateRepStatus(ReportsVO repVO, String updateRepStatus) throws ParseException;
	
	
}

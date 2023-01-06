package com.coderby.myapp.classes.service;

import java.text.ParseException;
import java.util.List;

import com.coderby.myapp.attendance.model.ReportsVO;

public interface IReportsService {
	List<ReportsVO> getReportsList(String classId, String yearParam, String monthParam, String repType, String repStatus);
	
	ReportsVO getReportsDetail(int repId);

	void updateRepStatus(ReportsVO repVO, String updateRepStatus) throws ParseException;
}

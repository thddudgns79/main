package com.coderby.myapp.attendance.service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.coderby.myapp.attendance.model.ReportsVO;
import com.coderby.myapp.file.model.FileVO;

public interface IReportsService {
	void insertReports(ReportsVO reports, Date now, FileVO fileVO);

	void deleteReprots(int repId, Date now);

	List<ReportsVO> getReportsList(String classId, String yearParam, String monthParam, String repType,
			String repStatus);

	ReportsVO getReportsDetail(int repId);

	void updateRepStatus(ReportsVO repVO, String updateRepStatus) throws ParseException;
}

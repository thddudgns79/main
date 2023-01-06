package com.coderby.myapp.attendance.service;

import java.util.Date;

import com.coderby.myapp.attendance.model.ReportsVO;
import com.coderby.myapp.file.model.FileVO;

public interface IReportsService {
	void insertReports(ReportsVO reports, Date now, FileVO fileVO);
	void deleteReprots(int repId, Date now);
}

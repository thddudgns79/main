package com.coderby.myapp.attendance.dao;

import java.util.List;

import com.coderby.myapp.attendance.model.ReportsVO;

public interface IReportsRepository {
	List<ReportsVO> selectReports(ReportsVO reports);
	void insertReports(ReportsVO reports);
	void deleteReports(int repId);
	ReportsVO selectRep(int repId);
}

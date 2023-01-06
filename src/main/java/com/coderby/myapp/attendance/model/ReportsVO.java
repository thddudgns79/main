package com.coderby.myapp.attendance.model;

import java.util.Date;
import java.util.List;

import com.coderby.myapp.file.model.FileVO;

public class ReportsVO {
	private int repId;
	private Date repDate;
	private String reason;
	private Date inTime;
	private Date outTime;
	private String repStatus;
	private String repType;
	private String studentId;
	private List<FileVO> fileList;
	
	public List<FileVO> getFileList() {
		return fileList;
	}

	public void setFileList(List<FileVO> fileList) {
		this.fileList = fileList;
	}

	public int getRepId() {
		return repId;
	}

	public void setRepId(int repId) {
		this.repId = repId;
	}

	public Date getRepDate() {
		return repDate;
	}

	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getInTime() {
		return inTime;
	}

	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}

	public Date getOutTime() {
		return outTime;
	}

	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}

	public String getRepStatus() {
		return repStatus;
	}

	public void setRepStatus(String repStatus) {
		this.repStatus = repStatus;
	}

	public String getRepType() {
		return repType;
	}

	public void setRepType(String repType) {
		this.repType = repType;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	@Override
	public String toString() {
		return "Reports [repId=" + repId + ", repDate=" + repDate + ", reason=" + reason + ", inTime=" + inTime
				+ ", outTime=" + outTime + ", repStatus=" + repStatus + ", repType=" + repType + ", studentId="
				+ studentId + "]";
	}

}

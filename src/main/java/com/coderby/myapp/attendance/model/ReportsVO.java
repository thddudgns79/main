package com.coderby.myapp.attendance.model;

import java.util.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.coderby.myapp.file.model.FileVO;

public class ReportsVO {
	private int repId;
	private Date repDate;
	private String reason; //사유
	private Date inTime;
	private Date outTime;
	private String repStatus;
	private String repType;	//휴가, 공가 등등
	private String studentId;
	
	private MultipartFile rFile;
	private List<FileVO> rfileList;
	
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
	
	public MultipartFile getrFile() {
		return rFile;
	}
	public void setrFile(MultipartFile rFile) {
		this.rFile = rFile;
	}
	public List<FileVO> getRfileList() {
		return rfileList;
	}
	public void setRfileList(List<FileVO> rfileList) {
		this.rfileList = rfileList;
	}

	
}

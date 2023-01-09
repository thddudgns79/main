package com.coderby.myapp.attendance.model;

import java.util.Date;


public class AttendanceVO {
	private Date attendanceDate;
	private Date inTime;
	private Date outTime;
	private String status;
	private String studentId;
	private int lateCount;			// 지각 횟수
	private int absenceCount;		// 결석 횟수
	private int attendCount;		// 출석 횟수
	
	public Date getAttendanceDate() {
		return attendanceDate;
	}
	public void setAttendanceDate(Date attendanceDate) {
		this.attendanceDate = attendanceDate; 
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public int getLateCount() {
		return lateCount;
	}
	public void setLateCount(int lateCount) {
		this.lateCount = lateCount;
	}
	public int getAbsenceCount() {
		return absenceCount;
	}
	public void setAbsenceCount(int absenceCount) {
		this.absenceCount = absenceCount;
	}
	public int getAttendCount() {
		return attendCount;
	}
	public void setAttendCount(int attendCount) {
		this.attendCount = attendCount;
	}
	

}

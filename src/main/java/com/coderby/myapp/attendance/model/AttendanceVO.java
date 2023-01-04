package com.coderby.myapp.attendance.model;

import java.sql.Date;
import java.sql.Timestamp;

public class AttendanceVO {
	private Date attendanceDate;
	private Timestamp inTime;
	private Timestamp outTime;
	private String status;
	private String studentId;
	
	public Date getAttendanceDate() {
		return attendanceDate;
	}
	public void setAttendanceDate(Date attendanceDate) {
		this.attendanceDate = attendanceDate;
	}
	public Timestamp getInTime() {
		return inTime;
	}
	public void setInTime(Timestamp inTime) {
		this.inTime = inTime;
	}
	public Timestamp getOutTime() {
		return outTime;
	}
	public void setOutTime(Timestamp outTime) {
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
	@Override
	public String toString() {
		return "AttendanceVO [attendanceDate=" + attendanceDate + ", inTime=" + inTime + ", outTime=" + outTime
				+ ", status=" + status + ", studentId=" + studentId + "]";
	}

}

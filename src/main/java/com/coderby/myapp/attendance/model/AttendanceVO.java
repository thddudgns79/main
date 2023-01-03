package com.coderby.myapp.attendance.model;

import java.sql.Date;
import java.sql.Timestamp;

public class AttendanceVO {
	private Date attendanceDate;
	private Timestamp in;
	private Timestamp out;
	private String status;
	private String studentId;

	public Date getAttendanceDate() {
		return attendanceDate;
	}

	public void setAttendanceDate(Date attendanceDate) {
		this.attendanceDate = attendanceDate;
	}

	public Timestamp getIn() {
		return in;
	}

	public void setIn(Timestamp in) {
		this.in = in;
	}

	public Timestamp getOut() {
		return out;
	}

	public void setOut(Timestamp out) {
		this.out = out;
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

}

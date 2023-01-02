package com.coderby.myapp.attendance.model;

import java.sql.Date;
import java.sql.Timestamp;

public class AttendanceVO {
	private Date attendanceDate;
	private Timestamp in;
	private Timestamp out;
	private String status;
	private String studentId;
}

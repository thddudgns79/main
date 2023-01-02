package com.coderby.myapp.attendance.model;

import java.sql.Date;
import java.sql.Timestamp;

public class RequestVO {
	private int reqId;
	private Date reqDate;
	private String reason;
	private Timestamp in;
	private Timestamp out;
	private String reqStatus;
	private String reqType;
	private String studentId;
}

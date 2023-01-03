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

	public int getReqId() {
		return reqId;
	}

	public void setReqId(int reqId) {
		this.reqId = reqId;
	}

	public Date getReqDate() {
		return reqDate;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
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

	public String getReqStatus() {
		return reqStatus;
	}

	public void setReqStatus(String reqStatus) {
		this.reqStatus = reqStatus;
	}

	public String getReqType() {
		return reqType;
	}

	public void setReqType(String reqType) {
		this.reqType = reqType;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
}

package com.coderby.myapp.board.model;

import java.sql.Date;

public class ReplyVO {
	private int replyId;
	private String replyContent;
	private Date createdDate;
	private String calculateTime;
	private int masterId;
	private String studentId;
	private int boardId;

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public int getMasterId() {
		return masterId;
	}

	public void setMasterId(int masterId) {
		this.masterId = masterId;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getCalculateTime() {
		return calculateTime;
	}

	public void setCalculateTime(String calculateTime) {
		this.calculateTime = calculateTime;
	}
	
}

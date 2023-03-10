package com.coderby.myapp.board.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.coderby.myapp.file.model.FileVO;

public class BoardVO {
	private int boardId;
	private String boardCategory;
	private String boardTitle;
	private String boardContent;
	private Date createdDate;
	private String calculateTime;
	private String studentId;
	private int classId;
	private List<ReplyVO> replyList;
	private List<MultipartFile> bFile;
	private List<FileVO> bfileList;

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	
	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public List<ReplyVO> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<ReplyVO> replyList) {
		this.replyList = replyList;
	}

	public List<MultipartFile> getbFile() {
		return bFile;
	}

	public void setbFile(List<MultipartFile> bFile) {
		this.bFile = bFile;
	}

	public List<FileVO> getBfileList() {
		return bfileList;
	}

	public void setBfileList(List<FileVO> bfileList) {
		this.bfileList = bfileList;
	}

	public String getCalculateTime() {
		return calculateTime;
	}

	public void setCalculateTime(String calculateTime) {
		this.calculateTime = calculateTime;
	}
	
}

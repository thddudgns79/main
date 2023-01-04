package com.coderby.myapp.classes.model;

import java.sql.Timestamp;
import java.util.List;

import com.coderby.myapp.file.model.FileVO;

public class SectionVO {
	private int sectionId;
	private String sectionTitle;
	private String sectionDescription;
	private int classId;
	
	public String getSectionDescription() {
		return sectionDescription;
	}

	public void setSectionDescription(String sectionDescription) {
		this.sectionDescription = sectionDescription;
	}

	private List<FileVO> fileList;
	
	public void setFileList(List<FileVO> fileList) {
		this.fileList = fileList;
	}

	public List<FileVO> getFileList() {
		return fileList;
	}
	
	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	private Timestamp createdDate;
	
	public int getSectionId() {
		return sectionId;
	}

	public void setSectionId(int sectionId) {
		this.sectionId = sectionId;
	}

	public String getSectionTitle() {
		return sectionTitle;
	}

	public void setSectionTitle(String sectionTitle) {
		this.sectionTitle = sectionTitle;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}
}

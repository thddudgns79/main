package com.coderby.myapp.classes.model;

import java.sql.Date;

public class ClassVO {
	private int classId;
	private String orgName;
	private String className;
	private Date createdDate;
	private int classHours;
	private Date classStartDate;
	private Date classEndDate;
	
	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public int getClassHours() {
		return classHours;
	}

	public void setClassHours(int classHours) {
		this.classHours = classHours;
	}

	public Date getClassStartDate() {
		return classStartDate;
	}

	public void setClassStartDate(Date classStartDate) {
		this.classStartDate = classStartDate;
	}

	public Date getClassEndDate() {
		return classEndDate;
	}

	public void setClassEndDate(Date classEndDate) {
		this.classEndDate = classEndDate;
	}


}

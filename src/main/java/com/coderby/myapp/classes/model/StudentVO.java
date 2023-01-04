package com.coderby.myapp.classes.model;

import java.sql.Date;

public class StudentVO {
	private String studentId;
	private String email;
	private String stdPassword;
	private Date birth;
	private Date joinDate;
	private int classId;
	// 관리자 여부(Y OR N)
	private char isManager;
	
	public String getEmail() {
		return email;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStdPassword() {
		return stdPassword;
	}
	public void setStdPassword(String stdPassword) {
		this.stdPassword = stdPassword;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public char getIsManager() {
		return isManager;
	}
	public void setIsManager(char isManager) {
		this.isManager = isManager;
	}
	
	
}

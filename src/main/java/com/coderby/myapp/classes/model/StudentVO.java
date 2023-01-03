package com.coderby.myapp.classes.model;

import java.sql.Date;

public class StudentVO {
	private int studentId;
	private String email;
	private String password;
	private Date birth;
	private Date joinDate;
	private int classId;
	// 관리자 여부(Y OR N)
	private char isManager;
	
	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

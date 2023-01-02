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
}

package com.coderby.myapp.classes.service;

import com.coderby.myapp.classes.model.StudentVO;

public interface IStudentService {
	StudentVO selectStudent(String stdId);
	String getPassword(String stdId);
}

package com.coderby.myapp.classes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coderby.myapp.classes.dao.IStudentRepository;
import com.coderby.myapp.classes.model.StudentVO;

@Service
public class StudentService implements IStudentService {
	
	@Autowired
	IStudentRepository studentRepository;

	@Override
	public StudentVO selectStudent(String stdId) {
		
		return studentRepository.selectStudent(stdId);
	}
	
	@Override
	public String getPassword(String stdId) {
		return studentRepository.getPassword(stdId);
	}

}

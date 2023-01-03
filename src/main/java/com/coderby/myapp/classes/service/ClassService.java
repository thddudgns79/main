package com.coderby.myapp.classes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coderby.myapp.classes.dao.IClassRepository;
import com.coderby.myapp.classes.model.ClassVO;

@Service
public class ClassService implements IClassService {
	@Autowired
	IClassRepository classRepository;
	
	@Override
	public List<ClassVO> getClassList(String orgName, String className) {
		return classRepository.getClassList(orgName, className);
	}
	
}

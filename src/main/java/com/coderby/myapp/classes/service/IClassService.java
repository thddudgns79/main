package com.coderby.myapp.classes.service;

import java.util.List;

import com.coderby.myapp.classes.model.ClassVO;

public interface IClassService {
	List<ClassVO> getClassList(String orgName, String className);
}

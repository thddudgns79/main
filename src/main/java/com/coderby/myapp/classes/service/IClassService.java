package com.coderby.myapp.classes.service;

import java.util.List;

import com.coderby.myapp.classes.model.ClassVO;
import com.coderby.myapp.classes.model.SectionVO;

public interface IClassService {
	List<ClassVO> getClassList(String orgName, String className);

	List<SectionVO> getSectionList(int classId);

	void insertSection(int classId, String sectionTitle);

	void updateSection(int sectionId, String sectionTitle);

	void deleteSection(int sectionId);

}

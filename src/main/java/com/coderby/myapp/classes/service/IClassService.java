package com.coderby.myapp.classes.service;

import java.util.List;

import com.coderby.myapp.classes.model.ClassVO;
import com.coderby.myapp.classes.model.SectionVO;

public interface IClassService {
	List<ClassVO> getClassList(String orgName, String className);

	List<SectionVO> getSectionList(int classId);

	boolean insertSection(int classId, String sectionTitle, String sectionDescription);

	boolean updateSectionTitle(int classId, int sectionId, String sectionTitle);

	void updateSectionDescription(int sectionId, String sectionDescription);
	
	void deleteSection(int sectionId);
	
}

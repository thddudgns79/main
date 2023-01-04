package com.coderby.myapp.classes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.coderby.myapp.classes.model.ClassVO;
import com.coderby.myapp.classes.model.SectionVO;

public interface IClassRepository {
	List<ClassVO> getClassList(@Param("orgName") String orgName, @Param("className") String className);

	List<SectionVO> getSectionList(int classId);
	
	void insertSection(@Param("classId") int classId, @Param("sectionTitle") String sectionTitle);

	void updateSection(@Param("sectionId") int sectionId, @Param("sectionTitle") String sectionTitle);

	void deleteSection(int sectionId);
}

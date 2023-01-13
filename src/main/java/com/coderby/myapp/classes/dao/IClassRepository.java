package com.coderby.myapp.classes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.coderby.myapp.classes.model.ClassVO;
import com.coderby.myapp.classes.model.SectionVO;
import com.coderby.myapp.util.Pager;

public interface IClassRepository {
	List<ClassVO> getClassList(@Param("orgName") String orgName, @Param("className") String className, @Param("pager") Pager pager);
	
	int getClassListTotal(@Param("orgName") String orgName, @Param("className") String className);
	List<SectionVO> getSectionList(int classId);
	
	void insertSection(@Param("classId") int classId, @Param("sectionTitle") String sectionTitle, 
			@Param("sectionDescription") String sectionDescription, @Param("thisOrder") int thisOrder);
	
	void updateSectionTitle(@Param("sectionId") int sectionId, @Param("sectionTitle") String sectionTitle);
	
	void updateSectionDescription(@Param("sectionId") int sectionId, @Param("sectionDescription") String sectionDescription);

	void deleteSection(int sectionId);
	
	List<Integer> getClassIdList();
	
	SectionVO getSection(int sectionId);
	
	void updateSectionOrder(int order);
}

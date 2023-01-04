package com.coderby.myapp.classes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coderby.myapp.classes.dao.IClassRepository;
import com.coderby.myapp.classes.model.ClassVO;
import com.coderby.myapp.classes.model.SectionVO;
import com.coderby.myapp.file.dao.IFileRepository;

@Service
public class ClassService implements IClassService {
	@Autowired
	IClassRepository classRepository;
	
	@Autowired
	IFileRepository fileRepository;
	
	@Override
	public List<ClassVO> getClassList(String orgName, String className) {
		return classRepository.getClassList(orgName, className);
	}

	@Override
	@Transactional
	public List<SectionVO> getSectionList(int classId) {
		List<SectionVO> sectionList = classRepository.getSectionList(classId);
		for(SectionVO sectionVO : sectionList) {
			sectionVO.setFileList(fileRepository.getFileList(sectionVO.getSectionId()));
		}
		return sectionList;
	}


	@Override
	public void insertSection(int classId, String sectionTitle) {
		classRepository.insertSection(classId, sectionTitle);
	}

	@Override
	public void updateSection(int sectionId, String sectionTitle) {
		classRepository.updateSection(sectionId, sectionTitle);

	}

	@Override
	public void deleteSection(int sectionId) {
		classRepository.deleteSection(sectionId);

	}

}

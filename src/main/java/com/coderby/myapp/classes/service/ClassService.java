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
	@Transactional
	public boolean insertSection(int classId, String sectionTitle, String sectionDescription) {
		List<SectionVO> sectionList = classRepository.getSectionList(classId);
		// 섹션 리스트에 추가할 섹션의 타이틀과 중복되는 섹션이 존재할 경우
		for(SectionVO sectionVO : sectionList) {
			if(sectionVO.getSectionTitle().equals(sectionTitle)) {
				return false;
			}
		}
		// 중복x
		classRepository.insertSection(classId, sectionTitle, sectionDescription);
		return true;
	}

	@Transactional
	@Override
	public boolean updateSectionTitle(int classId, int sectionId, String sectionTitle) {
		List<SectionVO> sectionList = classRepository.getSectionList(classId);
		// 섹션 리스트에 추가할 섹션의 타이틀과 중복되는 섹션이 존재할 경우
		for(SectionVO sectionVO : sectionList) {
			if(sectionVO.getSectionTitle().equals(sectionTitle)) {
				return false;
			}
		}
		// 중복x
		classRepository.updateSectionTitle(sectionId, sectionTitle);
		return true;

	}
	
	@Override
	public void updateSectionDescription(int sectionId, String sectionDescription) {
		classRepository.updateSectionDescription(sectionId, sectionDescription);
	}

	@Override
	public void deleteSection(int sectionId) {
		classRepository.deleteSection(sectionId);
	}

}

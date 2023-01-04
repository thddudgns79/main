package com.coderby.myapp.file.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.coderby.myapp.file.dao.IFileRepository;
import com.coderby.myapp.file.model.FileVO;

@Service
public class FileService implements IFileService {
	@Autowired
	IFileRepository fileRepository;
	
	@Override
	public FileVO downloadFile(int fileId) {
		return fileRepository.downloadFile(fileId);
	}
	
	@Override
	public List<FileVO> getFileList(int entityId) {
		return fileRepository.getFileList(entityId);
	}
	
	
	@Override
	public void uploadFile(int entityId, MultipartFile file) {
		fileRepository.uploadFile(entityId, file);
		
	}

	@Override
	public void deleteFile(int fileId) {
		fileRepository.deleteFile(fileId);
		
	}

}

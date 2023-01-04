package com.coderby.myapp.file.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.coderby.myapp.file.model.FileVO;


public interface IFileService {
	List<FileVO> getFileList(int entityId);
	
	FileVO downloadFile(int fileId);
	
	void uploadFile(int entityId, FileVO file);
	
	void deleteFile(int fileId);
}

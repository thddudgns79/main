package com.coderby.myapp.file.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.coderby.myapp.file.model.FileVO;

public interface IFileRepository {
	List<FileVO> getFileList(int entityId);
	
	FileVO downloadFile(int fileId);
	
	void uploadFile(@Param("entityId") int entityId, @Param("file") FileVO file);

	void deleteFile(int fileId);

}

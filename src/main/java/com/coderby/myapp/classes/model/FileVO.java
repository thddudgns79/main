package com.coderby.myapp.classes.model;

public class FileVO {
	private int fileId;
	private String fileName;
	private String fileType;
	private int fileSize;
	// board(게시물), request(휴가신청건), section(섹션) 세 테이블의 PK를 참조
	private int entityId;
	private byte[] fileData;
}

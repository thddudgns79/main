package com.coderby.myapp.classes.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coderby.myapp.classes.model.ClassVO;
import com.coderby.myapp.classes.model.SectionVO;
import com.coderby.myapp.classes.service.IClassService;
import com.coderby.myapp.file.model.FileVO;
import com.coderby.myapp.file.service.IFileService;

@Controller
public class ClassController {
	@Autowired
	IClassService classService;

	@Autowired
	IFileService fileService;

	// 클래스 리스트 조회
	@RequestMapping("/class/classlist")
	public String getClassList(String orgName, String className, Model model, HttpSession session) {
		// 테스트 용도 - 지워야 함
		session.setAttribute("classId", 3);
		session.setAttribute("userId", "thddudgns79");
		session.setAttribute("isManager", 'Y');
		model.addAttribute("orgName",orgName);
		model.addAttribute("className",className);
		// 검색 키워드 있을 경우
		if (!className.equals("")) {
			className = "%" + className + "%";
		}
		// 검색 키워드 없을 경우
		else {
			className = null;
		}
		List<ClassVO> classList = classService.getClassList(orgName, className);
		model.addAttribute("classList", classList);
		return "classes/classList";
	}

	// 클래스의 섹션 리스트 조회
	@RequestMapping("/class/sectionlist")
	public String getSectionList(Model model, HttpSession session) {
		List<SectionVO> sectionList = classService.getSectionList((Integer) session.getAttribute("classId"));
		model.addAttribute("sectionList", sectionList);
		return "classes/sectionList";
	}

	// 섹션 추가
	@RequestMapping("/class/sectioninsert")
	public String insertSection(String sectionTitle, String sectionDescription, Model model, HttpSession session) {
		int classId = (Integer) session.getAttribute("classId");
		boolean result = classService.insertSection(classId, sectionTitle, sectionDescription);
		if (!result) {
			System.out.println("섹션 추가 실패");
		} else {
			System.out.println("섹션 추가 성공");
		}
		return "redirect:/class/sectionlist";
	}

	// 섹션 타이틀 수정
	@RequestMapping("/class/sectionupdatetitle")
	public String updateSection(int sectionId, String sectionTitle, Model model, HttpSession session) {
		int classId = (Integer) session.getAttribute("classId");
		boolean result = classService.updateSectionTitle(classId, sectionId, sectionTitle);
		if (!result) {
			System.out.println("섹션 수정 실패");
		} else {
			System.out.println("섹션 수정 성공");
		}
		return "redirect:/class/sectionlist";
	}

	// 섹션 설명글 수정
	@RequestMapping("/class/sectionupdatedescription")
	public String updateSection(int sectionId, String sectionDescription, Model model) {
		classService.updateSectionDescription(sectionId, sectionDescription);
		return "redirect:/class/sectionlist";
	}

	// 섹션 삭제
	@RequestMapping("/class/sectiondelete/{sectionId}")
	public String deleteSection(@PathVariable int sectionId, Model model, RedirectAttributes ra) {
		classService.deleteSection(sectionId);
		return "redirect:/class/sectionlist";
	}

	// 파일 업로드
	@RequestMapping("/class/fileupload")
	public String uploadFile(int sectionId, MultipartFile file, Model model, RedirectAttributes ra) {
		try {
			if (file != null && !file.isEmpty()) {
				FileVO fileVO = new FileVO();
				System.out.println(file.getOriginalFilename());
				System.out.println(file.getContentType());
				System.out.println(file.getSize());
				fileVO.setFileName(file.getOriginalFilename());
				fileVO.setFileType(file.getContentType());
				fileVO.setFileSize(file.getSize());
				fileVO.setFileData(file.getBytes());
				fileService.uploadFile(sectionId, fileVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			ra.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/class/sectionlist";
	}

	// 파일 삭제
	@RequestMapping("/class/filedelete/{fileId}")
	public String deleteFile(@PathVariable int fileId, Model model, RedirectAttributes ra) {
		fileService.deleteFile(fileId);
		return "redirect:/class/sectionlist";
	}

	// 파일 다운로드
	@RequestMapping("/class/filedownload/{fileId}")
	public ResponseEntity<byte[]> getFileList(@PathVariable int fileId, Model model) {
		FileVO file = fileService.downloadFile(fileId);
		System.out.println(file.getFileName());
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = file.getFileType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(file.getFileSize());
		headers.setContentDispositionFormData("attachment", file.getFileName(), Charset.forName("UTF-8"));
		return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
	}

}

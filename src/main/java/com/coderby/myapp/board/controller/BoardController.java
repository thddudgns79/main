package com.coderby.myapp.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coderby.myapp.board.model.BoardVO;
import com.coderby.myapp.board.service.IBoardService;
import com.coderby.myapp.file.model.FileVO;

@Controller
public class BoardController {
	
	@Autowired
	IBoardService boardService;
	
	//[게시글 목록] - 1page
	@RequestMapping("/board/list")
	public String getList(HttpSession session, Model model) {
		return getList(1, session, model);
	}
	
	//[게시글 목록] - 페이징처리
	@RequestMapping("/board/list/{page}")
	public String getList(@PathVariable int page, HttpSession session, Model model) {
		//세션
		session.setAttribute("page", page);
//		int classId = (Integer) session.getAttribute("classId");
		int classId = 3;
		
		//모델
		model.addAttribute("classId", classId);
		//게시판 목록 갖고 오는 서비스 로직 작성
		List<BoardVO> boardList = boardService.selectBoardListByClass(classId, page);
		model.addAttribute("boardList", boardList);
		
		//페이징 처리 
		int bbsCount = boardService.selectTotalBoardCountByClass(classId);
		int totalPage = 0;
		if(bbsCount > 0) {
			totalPage = (int) Math.ceil(bbsCount/10.0);
		}
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("page", page);
		return "board/list";
	}
	
	//[게시글 상세보기]
	@RequestMapping("/board/detail/{boardId}")
	public String getBoardDetail(@PathVariable int boardId, HttpSession session, Model model) {
		BoardVO board = boardService.selectBoard(boardId);
		model.addAttribute("board", board);
		return "board/detail";
	}
	
	//[게시글 추가(작성) - 폼]
	@RequestMapping(value="/board/insert", method=RequestMethod.GET)
	public String writeBoard(Model model) {
		return "board/write";
	}
	
	//[게시글 추가 - DB]
	@RequestMapping(value="board/insert", method=RequestMethod.POST)
	public String writeBoard(BoardVO board, BindingResult result, RedirectAttributes redirectAttr) {
		//파일첨부
		MultipartFile mfile = board.getbFile();
		
		if(mfile!=null && !mfile.isEmpty()) {
			FileVO file = new FileVO();
			file.setFileName(mfile.getName());
			file.setFileType(mfile.getContentType());
		}
		
		boardService.insertBoard(board);
		
		
		return "redirect:/board/list";
	}
	
	//[댓글 작성]
//	@RequestMapping(value="/board/reply", method=RequestMethod.POST)
//	public String writeReply(Model model) {
//		
//	}
	
	
	
	
	
	
	
	
}

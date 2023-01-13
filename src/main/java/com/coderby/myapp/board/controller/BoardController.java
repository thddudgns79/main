package com.coderby.myapp.board.controller;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coderby.myapp.board.model.BoardVO;
import com.coderby.myapp.board.model.ReplyVO;
import com.coderby.myapp.board.service.IBoardService;
import com.coderby.myapp.file.model.FileVO;
import com.coderby.myapp.file.service.IFileService;
import com.coderby.myapp.util.Pager;

@Controller
public class BoardController {
	
	@Autowired
	IBoardService boardService;
	
	@Autowired
	IFileService fileService;
	
	//[게시글 목록] - 1page
	@RequestMapping("/board/list")
	public String getList(HttpSession session, Model model) {
		return getList(null, "전체", "", "", session, model);
	}
	
	//[게시글 목록] - 페이징처리
	@RequestMapping("/board/list/{strPageNo}")
	public String getList(@PathVariable String strPageNo, String selectedCategory, String searchTitle,
			String searchStudentId, HttpSession session, Model model) {
		model.addAttribute("selectedCategory", selectedCategory);
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("searchStudentId", searchStudentId);
		if(strPageNo == null) {
			strPageNo = "1";
		}
		
		if (!searchTitle.equals("")) {
			searchTitle = "%" + searchTitle + "%";
		}
		// 검색 키워드 없을 경우
		else {
			searchTitle = null;
		}

		if (!searchStudentId.equals("")) {
			searchStudentId = "%" + searchStudentId + "%";
		}
		// 검색 키워드 없을 경우
		else {
			searchStudentId = null;
		}
		
		int pagerNo = Integer.parseInt(strPageNo);
		
		int classId = (Integer) session.getAttribute("classId");
		int totalBoardCount = boardService.selectTotalBoardCountByClass(classId, selectedCategory, searchTitle, searchStudentId);

		//Pager 객체
		Pager pager = new Pager(5, 5, totalBoardCount, pagerNo);
		
		List<BoardVO> boardList = boardService.selectBoardListByClass(classId, selectedCategory, searchTitle, searchStudentId, pager);
		model.addAttribute("boardList", boardList);
		
		model.addAttribute("pager", pager);
		
		return "board/boardList";
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
	public String writeBoard(BoardVO board, HttpSession session,BindingResult result, RedirectAttributes redirectAttr) {
		try {
			board.setStudentId(session.getAttribute("stdId").toString());
			board.setClassId((Integer) session.getAttribute("classId"));
			boardService.insertBoard(board);
			
			List<MultipartFile> mfileList = board.getbFile();
			
			if(mfileList!=null && !mfileList.isEmpty()) {
				for(MultipartFile mfile : mfileList) {
					FileVO fileVO = new FileVO();
					fileVO.setFileName(mfile.getOriginalFilename());
					fileVO.setFileType(mfile.getContentType());
					fileVO.setFileSize(mfile.getSize());
					fileVO.setFileData(mfile.getBytes());
					
					fileService.uploadFile(board.getBoardId(), fileVO);
				}
			}
		}catch (Exception e) {
			redirectAttr.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/board/list/1";
	}
	
	//[게시글 - 파일/사진]
	@RequestMapping("/board/file/{fileId}")
	public ResponseEntity<byte[]> getFileList(@PathVariable int fileId, Model model) {
		FileVO file = fileService.downloadFile(fileId);
		
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = file.getFileType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(file.getFileSize());
		headers.setContentDispositionFormData("attachment", file.getFileName(), Charset.forName("UTF-8"));
		
		return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
	}
	
	//[게시글 수정 - 폼]
	@RequestMapping(value="/board/update/{boardId}", method=RequestMethod.GET)
	public String updateBoard(@PathVariable int boardId ,Model model, HttpSession session) {
		BoardVO board = boardService.selectBoard(boardId);
		// 게시글 작성자와 현재 로그인한 유저가 다르면 수정 불가능
		if(!board.getStudentId().equals(session.getAttribute("stdId"))) {
			return "redirect:/board/list";
		}
		model.addAttribute("board", board);
		return "board/update";
	}
	
	//[게시글 수정 - DB]
	@RequestMapping(value="/board/update", method=RequestMethod.POST)
	public String updateBoard(BoardVO board, BindingResult result, RedirectAttributes redirectAttr) {
		try {
			boardService.updateBoard(board);
			
			List<MultipartFile> mfileList = board.getbFile();
			
			if(mfileList!=null && !mfileList.isEmpty()) {
				for(MultipartFile mfile : mfileList) {
					FileVO fileVO = new FileVO();
					fileVO.setFileName(mfile.getOriginalFilename());
					fileVO.setFileType(mfile.getContentType());
					fileVO.setFileSize(mfile.getSize());
					fileVO.setFileData(mfile.getBytes());
								
					fileService.uploadFile(board.getBoardId(), fileVO);
				}
			}
		}catch (Exception e) {
			redirectAttr.addFlashAttribute("message", e.getMessage());
		}
		
		return "redirect:/board/detail/" + board.getBoardId();
	}
	
	//[게시글 수정 - 기존 파일 삭제]
	@RequestMapping(value="/board/file/delete", method=RequestMethod.GET)
	public @ResponseBody int deleteBoardFile(@RequestParam int fileId) {
		try {
			fileService.deleteFile(fileId);
		} catch (Exception e) {
			e.getMessage();
			return 0;
		}
		return 1;
	}
	
	//[게시글 삭제]
	@RequestMapping("board/delete/{boardId}")
	public String deleteBoard(@PathVariable int boardId, HttpSession session) {
		BoardVO board = boardService.selectBoard(boardId);
		// 게시글 작성자와 현재 로그인한 유저가 다르면 수정 불가능
		if(!board.getStudentId().equals(session.getAttribute("stdId"))) {
			return "redirect:/board/list";
		}
		boardService.deleteBoard(boardId);
		return "redirect:/board/list";
	}
	
	//[댓글 작성]
	@RequestMapping(value="/board/reply/insert", method=RequestMethod.POST)
	public String writeReply(ReplyVO reply) {
		boardService.insertReply(reply);
		return "redirect:/board/detail/" + reply.getBoardId();
	}
	
	//[댓글 삭제]
	@RequestMapping("/board/reply/delete")
	public @ResponseBody int deleteReply(@RequestParam int replyId, HttpSession session) {
		try {
			ReplyVO replyVO = boardService.selectReply(replyId);
			// 게시글 작성자와 현재 로그인한 유저가 다르면 수정 불가능
			if(!replyVO.getStudentId().equals(session.getAttribute("stdId"))) {
				return 0;
			}
			boardService.deleteReply(replyId);
		} catch (Exception e) {
			e.getMessage();
			return 0;
		}
		return 1;
	}
	
	//[댓글 수정]
	@RequestMapping("board/reply/update")
	public @ResponseBody int updateReply(ReplyVO reply, HttpSession session) {
		try {
			ReplyVO replyVO = boardService.selectReply(reply.getReplyId());
			// 게시글 작성자와 현재 로그인한 유저가 다르면 수정 불가능
			if(!replyVO.getStudentId().equals(session.getAttribute("stdId"))) {
				return 0;
			}
			boardService.updateReply(reply);
		} catch (Exception e) {
			e.getMessage();
			return 0;
		}
		return 1;
	}
	
	
	//[답글 목록]
	@RequestMapping(value="/board/rereply/list", method=RequestMethod.GET)
	public String reReplyList(@RequestParam int replyId, Model model) {
		List<ReplyVO> reReplyList = boardService.selectReReplyList(replyId);
		model.addAttribute("reReplyList", reReplyList);
		return "board/replyList";
	}
	
	//[답글 추가]
	@RequestMapping(value="/board/rereply/insert", method=RequestMethod.POST)
	public @ResponseBody int writeReReply(ReplyVO reply, Model model) {
		try {
			boardService.insertReReply(reply);
		} catch (Exception e) {
			e.getMessage();
			return 0;
		}
		return 1;
	}
	
}

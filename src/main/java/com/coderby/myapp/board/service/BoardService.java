package com.coderby.myapp.board.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coderby.myapp.board.dao.IBoardRepository;
import com.coderby.myapp.board.dao.IReplyRepository;
import com.coderby.myapp.board.model.BoardVO;
import com.coderby.myapp.board.model.ReplyVO;
import com.coderby.myapp.file.dao.IFileRepository;
import com.coderby.myapp.util.Pager;

@Service
public class BoardService implements IBoardService {
	
	@Autowired
	IBoardRepository boardRepository;
	
	@Autowired
	IReplyRepository replyRepository;
	
	@Autowired
	IFileRepository fileRepository;
	
 	@Override
	public List<BoardVO> selectBoardListByClass(int classId, String selectedCategory, String searchTitle, String searchStudentId, Pager pager) {
 		int pageNo = pager.getPageNo();
 		int rowsPerPage = pager.getRowsPerPage();
 		
		List<BoardVO> boardList = boardRepository.selectBoardListByClass(classId, 
				selectedCategory, searchTitle, searchStudentId, pageNo, rowsPerPage);
		for(BoardVO vo : boardList) {
			vo.setCalculateTime(CalculateBeforeTime(vo.getCreatedDate()));
		}

		return boardList;
	}

	@Override
	public int selectTotalBoardCountByClass(int classId, String selectedCategory, String searchTitle, String searchStudentId) {
		return boardRepository.selectTotalBoardCountByClass(classId, selectedCategory, searchTitle, searchStudentId);
	}
	
	@Transactional
	@Override
	public BoardVO selectBoard(int boardId) {
		BoardVO board = boardRepository.selectBoard(boardId);
		//Board객체 시간
		board.setCalculateTime(CalculateBeforeTime(board.getCreatedDate()));
		
		//Board 객체에 댓글 리스트 넣기
		List<ReplyVO> replyList = replyRepository.selectReplyList(boardId);
		//댓글객체 시간
		for(ReplyVO vo : replyList) {
			vo.setCalculateTime(CalculateBeforeTime(vo.getCreatedDate()));
		}
		board.setReplyList(replyList);
		
		//Board객체에 파일 데이터 넣기
		board.setBfileList(fileRepository.getFileList(boardId));
		return board;
	}
	
	@Override
	public ReplyVO selectReply(int replyId) {
		return replyRepository.selectReply(replyId);
	}
	
	@Override
	public void insertBoard(BoardVO board) {
		boardRepository.insertBoard(board);
	}

	@Override
	public void updateBoard(BoardVO board) {
		boardRepository.updateBoard(board);
	}

	@Override
	public void deleteBoard(int boardId) {
		boardRepository.deleteBoard(boardId);
	}
	
	@Override
	public void insertReply(ReplyVO reply) {
		replyRepository.insertReply(reply);
	}
	
	@Override
	public void updateReply(ReplyVO reply) {
		replyRepository.updateReply(reply);
	}

	@Override
	public void deleteReply(int replyId) {
		replyRepository.deleteReply(replyId);
	}
	
	@Override
	public List<ReplyVO> selectReReplyList(int replyId) {
		List<ReplyVO> replyList = replyRepository.selectReReplyList(replyId);
		
		//댓글객체 시간
		for(ReplyVO vo : replyList) {
			vo.setCalculateTime(CalculateBeforeTime(vo.getCreatedDate()));
		}
		
		return replyList;
	}

	@Override
	public void insertReReply(ReplyVO reply) {
		replyRepository.insertReReply(reply);
	}

 	//★시간 계산★
	private String CalculateBeforeTime(Date createdDate) {
		//현재시간
		long curTime = System.currentTimeMillis();
		long reqTime = createdDate.getTime();
		long diffTime = (curTime - reqTime) / 1000;
		
		String msg = null;
		
		if(diffTime < 60) { //sec
			msg = "방금 전";
		} else if((diffTime /= 60) < 60) { //min
			msg = diffTime + "분 전";
		} else if((diffTime /= 60) < 24) { //hour
			msg = diffTime + "시간 전";
		} else if((diffTime /= 24) < 30) { //day
			msg = diffTime + "일 전";
		} else if((diffTime /= 30) < 12) { //month
			msg = diffTime + "달 전";
		} else {
			msg = diffTime + "년 전";
		}
		
		return msg;
	}


	
}

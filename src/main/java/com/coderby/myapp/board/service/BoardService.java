package com.coderby.myapp.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coderby.myapp.board.dao.IBoardRepository;
import com.coderby.myapp.board.dao.IReplyRepository;
import com.coderby.myapp.board.model.BoardVO;
import com.coderby.myapp.board.model.ReplyVO;
import com.coderby.myapp.file.dao.IFileRepository;

@Service
public class BoardService implements IBoardService {
	
	@Autowired
	IBoardRepository boardRepository;
	
	@Autowired
	IReplyRepository replyRepository;
	
	@Autowired
	IFileRepository fileRepository;
	
 	@Override
	public List<BoardVO> selectBoardListByClass(int classId, int page) {
		int start = ((page-1)*10)-1;
		return boardRepository.selectBoardListByClass(classId, start, start+9);
	}

	@Override
	public int selectTotalBoardCountByClass(int classId) {
		return boardRepository.selectTotalBoardCountByClass(classId);
	}
	
	@Transactional
	@Override
	public BoardVO selectBoard(int boardId) {
		BoardVO board = boardRepository.selectBoard(boardId);
		//Board 객체에 댓글 리스트 넣기
		board.setReplyList(replyRepository.selectReplyList(boardId));
		//Board객체에 파일 데이터 넣기
		board.setBfileList(fileRepository.getFileList(boardId));
		return board;
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
		return replyRepository.selectReReplyList(replyId);
	}

	@Override
	public void insertReReply(ReplyVO reply) {
		replyRepository.insertReReply(reply);
	}

	

	
}

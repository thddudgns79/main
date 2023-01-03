package com.coderby.myapp.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coderby.myapp.board.dao.IBoardRepository;
import com.coderby.myapp.board.dao.IReplyRepository;
import com.coderby.myapp.board.model.BoardVO;

@Service
public class BoardService implements IBoardService {
	
	@Autowired
	IBoardRepository boardRepository;
	
	@Autowired
	IReplyRepository replyRepository;
	
 	@Override
	public List<BoardVO> selectBoardListByClass(int classId, int page) {
		int start = ((page-1)*10)-1;
		return boardRepository.selectBoardListByClass(classId, start, start+9);
	}

	@Override
	public int selectTotalBoardCountByClass(int classId) {
		return boardRepository.selectTotalBoardCountByClass(classId);
	}

	@Override
	public BoardVO selectBoard(int boardId) {
		BoardVO board = boardRepository.selectBoard(boardId);
		//Board 객체에 댓글 리스트 넣기
		board.setReplyList(replyRepository.selectReplyList(boardId));
		//Board객체에 파일 데이터 넣기
		return board;
	}

	@Override
	public void insertBoard(BoardVO board) {
		boardRepository.insertBoard(board);
	}
	
}

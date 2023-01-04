package com.coderby.myapp.board.service;

import java.util.List;

import com.coderby.myapp.board.model.BoardVO;
import com.coderby.myapp.board.model.ReplyVO;

public interface IBoardService {
	List<BoardVO> selectBoardListByClass(int classId, int page);
	int selectTotalBoardCountByClass(int classId);
	BoardVO selectBoard(int boardId);
	void insertBoard(BoardVO board);
	void insertReply(ReplyVO reply);
}


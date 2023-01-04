package com.coderby.myapp.board.service;

import java.util.List;

import com.coderby.myapp.board.model.BoardVO;

public interface IBoardService {
	List<BoardVO> selectBoardListByClass(int classId, int page);
	int selectTotalBoardCountByClass(int classId);
	BoardVO selectBoard(int boardId);
	void insertBoard(BoardVO board);
}


package com.coderby.myapp.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.coderby.myapp.board.model.BoardVO;
import com.coderby.myapp.util.Pager;

public interface IBoardRepository {
	//클래스 게시판 목록 List
	List<BoardVO> selectBoardListByClass(@Param("classId") int classId, @Param("pageNo") int pageNo, @Param("rowsPerPage") int rowsPerPage);
	int selectTotalBoardCountByClass(int classId);
	BoardVO selectBoard(int boardId);
	void insertBoard(BoardVO board);
	void updateBoard(BoardVO board);
	void deleteBoard(int boardId);
}

package com.coderby.myapp.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.coderby.myapp.board.model.ReplyVO;

public interface IReplyRepository {
	List<ReplyVO> selectReplyList(@Param("boardId") int boardId);
}

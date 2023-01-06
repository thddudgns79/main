package com.coderby.myapp.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.coderby.myapp.board.model.ReplyVO;

public interface IReplyRepository {
	List<ReplyVO> selectReplyList(@Param("boardId") int boardId);
	void insertReply(ReplyVO reply);
	List<ReplyVO> selectReReplyList(int replyId);
	void insertReReply(ReplyVO reply);
	void updateReply(ReplyVO reply);
	void deleteReply(int replyId);
}

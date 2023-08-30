package com.ez.gw.comments.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentsDAO {
	int insertQnaReply(CommentsVO vo); // qna 답변 등록 메서드
	List<Map<String, Object>> selectQnaReplys(int boardNo); // 해당 게시글에 답변들 조회 메서드
	int selectCountReply(int boardNo); //해당 게시글 답변 갯수 조회 메서드
	int insertAnonymousReply(CommentsVO vo); // 익명게시판 댓글 등록 메서드
	List<CommentsVO> anonymousAllReply(); // 익명게시판 답변 조회 메서드
	int updateSortNo(CommentsVO vo); // 익명게시판 답글 등록 메서드
	int insertReply(CommentsVO vo); // 익명게시판 답글 등록 메서드
	int updateAnonymousComments(CommentsVO vo); //익명게시판 댓글 수정
	int deleteAnonymousComments(int commentNo); //익명게시판 댓글 삭제
	List<Map<String, Object>> countComment(); //익명게시파 댓글 개수
}

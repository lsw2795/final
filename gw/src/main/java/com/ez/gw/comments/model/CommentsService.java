package com.ez.gw.comments.model;

import java.util.List;
import java.util.Map;

public interface CommentsService {
	int insertQnaReply(CommentsVO vo); // qna 답변 등록 메서드
	List<Map<String, Object>> selectQnaReplys(int boardNo); // 해당 게시글에 답변들 조회 메서드
	int selectCountReply(int boardNo); //해당 게시글 답변 갯수 조회 메서드
	int insertAnonymousReply(CommentsVO vo);
	List<CommentsVO> anonymousAllReply();
	int reply(CommentsVO vo);
	int updateAnonymousComments(CommentsVO vo); //익명게시판 댓글 수정
	int deleteAnonymousComments(int commentNo); //익명게시판 댓글 삭제
	List<Map<String, Object>> countComment();
	Map<String, Object> anonymousCommentByCommentNo(int commentNo);
	int updateCommentReport(int commentNo);
	int insertDeptBoardCM(CommentsVO vo); //부서게시판 댓글 등록
	List<Map<String, Object>> selectDeptBoardCM(CommentsVO vo); //부서게시판 댓글 조회
	int updateDeptBoardCM(CommentsVO vo); //부서게시판 댓글 수정
	int deleteDeptBoardCM(CommentsVO vo); //부서게시판 댓글 삭제
	int reply2(CommentsVO vo); //부서게시판 답글 
}

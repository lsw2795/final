package com.ez.gw.comments.model;

import java.util.List;
import java.util.Map;

import com.ez.gw.common.EmpSearchVO;

public interface CommentsService {
	int insertQnaReply(CommentsVO vo); //Q&A 답변 등록 메서드
	List<Map<String, Object>> selectQnaReplys(int boardNo); //Q&A 게시글 답변 조회 메서드
	int selectCountReply(int boardNo); //Q&A 게시글 답변 개수 조회 메서드
	int insertAnonymousReply(CommentsVO vo);
	List<CommentsVO> anonymousAllReply();
	int reply(CommentsVO vo);
	int updateAnonymousComments(CommentsVO vo); //익명게시판 댓글 수정
	int deleteAnonymousComments(int commentNo); //익명게시판 댓글 삭제
	List<Map<String, Object>> countComment();
	Map<String, Object> anonymousCommentByCommentNo(int commentNo);
	int updateCommentReport(int commentNo);
	int insertDeptBoardCM(CommentsVO vo); //부서게시판 댓글 등록
	List<Map<String, Object>> selectDeptBoardCM(EmpSearchVO searchVo); //부서게시판 댓글 조회
	int updateDeptBoardCM(CommentsVO vo); //부서게시판 댓글 수정
	int deleteDeptBoardCM(CommentsVO vo); //부서게시판 댓글 삭제
	int reply2(CommentsVO vo); //부서게시판 답글
	int selCountDeptBoardReply(int boardNo); //부서게시판 게시글 당 댓글 개수
	int gTRCommentCount(EmpSearchVO searchVo); //댓글 페이징처리 총 레코드
	
	int deleteQnaComment(int commentNo);//Q&A 게시판 답변 삭제 메서드
	int updateQnaComment(CommentsVO commentsVo); //Q&A 게시판 답변 수정 메서드
	
	
}

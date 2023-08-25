package com.ez.gw.board.model;

import java.util.List;
import java.util.Map;

import com.ez.gw.common.EmpSearchVO;
import com.ez.gw.common.SearchVO;

public interface BoardService {
	int insertQna(BoardVO vo); //Qna 글등록 메서드
	List<Map<String, Object>> selectQnaAll(SearchVO searchVo); //Qna 글 리스트 목록 조회 메서드
	List<Map<String, Object>> selectAdminQnaAll(SearchVO searchVo); //Qna 관리자 글 리스트 목록 조회 메서드
	int selectAdminQnaTotalRecord(SearchVO searchVo); // 페이징 처리 위한 qna 관리자 페이지 총 레코드 수 메서드
	Map<String, Object> selectQna(int boardNo); //qna 글 1개 디테일 조회 메서드
	int updateReadcount(int boardNo); //조회수 증가 메서드
	int updateQna(BoardVO vo); //질문 수정 메서드
	int deleteQna(int boardNo); //질문 삭제 메서드
	int insertNotice(BoardVO vo); //관리자 공지사항 글등록 메서드
	List<Map<String, Object>> selectNoticeAll(SearchVO searchVo);//공지사항 글 리스트 목록 조회 메서드
	int gTRSearchNotice(SearchVO searchVo); //공지사항 글 리스트 검색 전체 레코드
	Map<String, Object> selectNotice(int boardNo); //공지사항 글 1개 디테일 조회 메서드
	int updateNotice(BoardVO vo); //관리자 공지사항 글수정 메서드
	int deleteNotice(BoardVO vo); //관리자 공지사항 삭제 메서드
	List<Map<String, Object>> selectByEmpNo(EmpSearchVO searchVo); //사원 - 내가쓴 게시글 목록 조회 메서드
	int gTRSearchBoard(EmpSearchVO searchVo); //사원 - 내가쓴 게시글 검색 전체 레코드
	Map<String, Object> selectPrevNotice(int boardNo); //공지사항 - 이전글 보기
	Map<String, Object> selectNextNotice(int boardNo); //공지사항 - 다음글 보기
	
	//Q&A 게시글 여러개 삭제 메서드
	int deleteMulti(List<BoardVO> list);

}

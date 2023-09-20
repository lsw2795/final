package com.ez.gw.board.model;

import java.util.List;
import java.util.Map;

import com.ez.gw.common.EmpSearchVO;
import com.ez.gw.common.SearchVO;

public interface BoardService {
	//Q&A 게시판
	int insertQna(BoardVO vo); //Q&A 글 등록 메서드
	List<Map<String, Object>> selectQnaAll(SearchVO searchVo); //Q&A 글 목록 조회 메서드
	List<Map<String, Object>> selectAdminQnaAll(SearchVO searchVo); //관리자 - Q&A 글 목록 조회 메서드
	int selectAdminQnaTotalRecord(SearchVO searchVo); // 관리자 - Q&A 총 레코드 개수 구하는 메서드(페이징 처리)
	Map<String, Object> selectQna(int boardNo); //Q&A 글 상세조회 메서드
	int updateReadcount(int boardNo); //Q&A 조회수 증가 메서드
	int updateQna(BoardVO vo); //Q&A 수정 메서드
	int deleteQna(int boardNo); //Q&A 삭제 메서드
	int getQnaTotalCount(SearchVO searchVo); // Q&A 총 레코드 개수 구하는 메서드
	int deleteMulti(List<BoardVO> list); //관리자 - Q&A 다중삭제를 위한 메서드
	
	int insertNotice(BoardVO vo); //관리자 공지사항 글등록 메서드
	List<Map<String, Object>> selectNoticeAll(SearchVO searchVo);//공지사항 글 리스트 목록 조회 메서드
	int gTRSearchNotice(SearchVO searchVo); //공지사항 글 리스트 검색 전체 레코드
	Map<String, Object> selectNotice(int boardNo); //공지사항 글 1개 디테일 조회 메서드
	int updateNotice(BoardVO vo); //관리자 공지사항 글수정 메서드
	int deleteNotice(int boardNo); //관리자 공지사항 삭제 메서드
	List<Map<String, Object>> selectByEmpNo(EmpSearchVO searchVo); //사원 - 내가쓴 게시글 목록 조회 메서드
	int gTRSearchBoard(EmpSearchVO searchVo); //사원 - 내가쓴 게시글 검색 전체 레코드
	Map<String, Object> selectPrevNotice(int boardNo); //공지사항 - 이전글 보기
	Map<String, Object> selectNextNotice(int boardNo); //공지사항 - 다음글 보기
	int insertFAQ(BoardVO vo); //관리자 FAQ 글등록 메서드
	List<BoardVO> selectFAQ(SearchVO seachVo); //FAQ 목록 조회 메서드
	int gTRsearchFAQ(SearchVO searchVo); //FAQ 검색 총 레코드 값 조회 메서드
	int insertAnonumous(BoardVO vo); //익명게시판 글등록 메서드
	int updateFAQ(BoardVO vo); //관리자 FAQ 글수정 메서드
	BoardVO selectFAQByBoardNo(int boardNo); //관리자 글 수정전 게시글 보여주기 메서드
	List<Map<String, Object>> select24List();
	int updateAnonymousBoard(BoardVO vo);
	int deleteAnonymousBoard(int boardNo);
	List<Map<String, Object>> selRegdateDesc5(); //공지사항 최신글 5건 조회
	Map<String, Object> AnonymousBoardByBoardNo(int boardNo);
	List<Map<String, Object>> searchDeptBoard(EmpSearchVO searchVo); //부서 게시판 조회
	int gTRCountDeptBoard(EmpSearchVO searchVo); //부서 게시판 검색 총 레코드값 조회
	int insertDeptBoard(BoardVO vo); //부서 게시판 글쓰기
	Map<String, Object> selectdeptBoard(BoardVO vo); //부서 게시판 상세보기
	Map<String, Object> selPrevDeptBoard(BoardVO vo); // 부서 게시판 - 이전글 보기
	Map<String, Object> selNextDeptBoard(BoardVO vo); // 부서 게시판 - 다음글 보기
	int updateDeptBoard(BoardVO vo); //부서 게시판 수정하기
	int deleteDeptBoard(BoardVO vo); //부서 게시판 삭제하기(delflag='Y'로 변경)
	int likeCountUp(int boardNo); //게시판 좋아요 수 올리기
	int likeCountDown(int boardNo); //게시판 좋아요 수 내리기
	
	//FAQ 게시글 여러개 삭제 메서드(delflag='Y'로 변경)
	int faqDeleteMulti(List<BoardVO> list);
	//공지사항 게시글 여러개 삭제 메서드(delflag='Y'로 변경)
	int noticeDeleteMulti(List<BoardVO> list);

	
}

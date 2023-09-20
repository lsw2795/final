package com.ez.gw.pds.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ez.gw.board.model.BoardVO;
import com.ez.gw.common.SearchVO;

@Mapper
public interface PdsDAO {
	//자료실
	int insertPds(BoardVO vo); //자료실 DB에 파일 업로드 메서드
	List<Map<String, Object>> selectPdsAll(SearchVO vo); //자료실 게시글 목록 조회 메서드
	Map<String, Object> selectPds(int boardNo); //자료실 게시글 상세조회 메서드
	int updatePds(BoardVO vo); //자료실 글 수정 메서드
	int deletePds(int boardNo); //자료실 글 삭제 메서드
	int deletePdsFile(int boardNo); 
	int editPdsFile(@Param("boardNo") int boardNo, @Param("oldFileName") String oldFileName); //자료실 게시글에 해당하는 파일 DB에서 삭제 메서드  
	int insertFiles(PdsVO vo); //자료실 게시판 DB에 파일 업로드 
	List<PdsVO> selectFilesByBoardNo(int boardNo); //자료실 게시글에 업로드된 파일 조회 메서드
	int updateDownloadCount(int boardNo); //자료실 파일 다운로드 횟수 증가 메서드
	int getTotalRecord(SearchVO vo); //자료실 게시판 총 게시글 개수 조회 메서드
	int selectIsFile(int boardNo); //자료실 게시판 해당 게시글에 업로드된 파일이 있는지 조회하는 메서드
	List<BoardVO> selectPdsNew5(); //자료실 게시판 새 게시글 5개 조회 메서드
	
	List<PdsVO> selFilesByNotice(int boardNo); // 공지사항 디테일 파일 리스트 조회
	int editNoticeFile(int pdsNo); //공지사항 수정시 파일 삭제
	List<PdsVO> select24AnonymousImage(); //익명게시판 24시간 이내 이미지
	int deleteAnonymousImg(PdsVO vo); //익명게시판 이미지 삭제
	List<PdsVO> selFilesByDeptBoard(BoardVO boardVo); //부서 게시판 파일 등록
	List<Map<String, Object>> selectAdminPdsAll(SearchVO searchVo); // 관리자 - 파일목록 전체 조회
	int deleteAdminFile(int pdsNo); // 관리자 - 파일 db 삭제 메서드
	int getAdminTotalFile(SearchVO searchVo); // 파일 총 갯수 구하는 메서드
	int editDeptBoardFile(int pdsNo); // 부서게시판 - 수정중 파일 삭제 메서드
	int insertPdsByAnonymous(PdsVO vo);
	
	int clubFiles(PdsVO pdsVo); //동호회 파일 업로드
	
}

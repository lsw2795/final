package com.ez.gw.pds.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ez.gw.board.model.BoardVO;
import com.ez.gw.common.SearchVO;

@Mapper
public interface PdsDAO {
	int insertPds(BoardVO vo);
	List<Map<String, Object>> selectPdsAll(SearchVO vo);
	Map<String, Object> selectPds(int boardNo);
	int updatePds(BoardVO vo);
	int deletePds(int boardNo);
	int deletePdsFile(int boardNo); 
	int editPdsFile(@Param("boardNo") int boardNo, @Param("oldFileName") String oldFileName); 
	int insertFiles(PdsVO vo); //파일 업로드 
	List<PdsVO> selectFilesByBoardNo(int boardNo); // 게시글 번호로 파일 리스트 조회
	int updateDownloadCount(int boardNo);
	int getTotalRecord(SearchVO vo);
	int selectIsFile(int boardNo);
	List<PdsVO> selFilesByNotice(int boardNo); // 공지사항 디테일 파일 리스트 조회
	int editNoticeFile(int boardNo); //공지사항 수정시 파일 삭제
	
	
}

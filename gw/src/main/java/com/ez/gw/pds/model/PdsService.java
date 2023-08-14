package com.ez.gw.pds.model;

import java.util.List;
import java.util.Map;

import com.ez.gw.board.model.BoardVO;
import com.ez.gw.common.SearchVO;

public interface PdsService {
	int insertPds(BoardVO vo);
	List<Map<String, Object>> selectPdsAll(SearchVO vo);
	Map<String, Object> selectPds(int boardNo);
	int updatePds(BoardVO vo);
	int deletePds(int boardNo);
	int insertFiles(PdsVO vo); //파일 업로드 
	List<PdsVO> selectFilesByBoardNo(int boardNo); // 게시글 번호로 파일 리스트 조회
	int updateDownloadCount(int boardNo);
	int getTotalRecord(SearchVO vo);
}

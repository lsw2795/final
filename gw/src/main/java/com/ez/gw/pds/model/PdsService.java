package com.ez.gw.pds.model;

import java.util.List;
import java.util.Map;

import com.ez.gw.board.model.BoardVO;

public interface PdsService {
	int insertPds(BoardVO vo);
	List<Map<String, Object>> selectPdsAll();
	List<Map<String, Object>> selectPds(int boardNo);
	int updatePds(BoardVO vo);
	int deletePds(int boardNo);
	int insertFiles(PdsVO vo); //파일 업로드 
	
}

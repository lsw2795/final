package com.ez.gw.pds.model;

import java.util.List;
import java.util.Map;

import com.ez.gw.board.model.BoardVO;

public interface PdsService {
	int insertPds(BoardVO vo);
	List<Map<String, Object>> selectPdsAll();
	Map<String, Object> selectPds(int boardNo);
	int updatePds(BoardVO vo);
	int deletePds(int boardNo);
	
}

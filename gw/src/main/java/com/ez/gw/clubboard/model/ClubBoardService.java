package com.ez.gw.clubboard.model;

import java.util.List;
import java.util.Map;

import com.ez.gw.common.SearchVO;

public interface ClubBoardService {
	List<Map<String, Object>> clubBoardView(int clubNo, SearchVO searchVo);
	int insertClubBoard(ClubBoardVO clubVo);
}

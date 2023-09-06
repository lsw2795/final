package com.ez.gw.clubboard.model;

import java.util.List;
import java.util.Map;

import com.ez.gw.common.SearchVO;

public interface ClubBoardService {
	List<Map<String, Object>> clubBoardView(int clubNo, SearchVO searchVo);
	int insertClubBoard(ClubBoardVO clubVo);
	int updateReadcount(int boardNo); //조회수 증가
	int updateClubBoard(ClubBoardVO clubVo);
	Map<String, Object> detailClubBoard(int clubNo, int boardNo);
	int deleteClubBoard(int boardNo);
	int deleteMulti(List<ClubBoardVO> list); //관리자 다중 삭제
}

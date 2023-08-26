package com.ez.gw.clubboard.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ez.gw.common.SearchVO;

@Mapper
public interface ClubBoardDAO {
	List<Map<String, Object>> clubBoardView(@Param("clubNo")int clubNo,@Param("searchVo") SearchVO searchVo);
	int insertClubBoard(ClubBoardVO clubVo);
}

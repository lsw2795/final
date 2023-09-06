package com.ez.gw.club.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ez.gw.common.SearchVO;

@Mapper
public interface ClubDAO {
	int insertClub(ClubVO vo);
	List<Map<String, Object>> selectClub(SearchVO searchVo);
	ClubVO selectByClubNo(int clubNo);
	int updateClub(ClubVO vo);
	int deleteClub(int clubNo);
	int joinClub(@Param("merchantNo")String merchantNo,@Param("clubNo") int clubNo, @Param("empNo") int empNo);
	int outClub(int empNo);
	List<Map<String, Object>> adminClubList(SearchVO searchVo);
	int clubCount(int clubNo); //인원수 체크
}

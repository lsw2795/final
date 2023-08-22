package com.ez.gw.club.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ez.gw.common.SearchVO;

@Mapper
public interface ClubDAO {
	int insertClub(ClubVO vo);
	List<ClubVO> selectClub(SearchVO searchVo);
	ClubVO selectByClubNo(int clubNo);
	int updateClub(ClubVO vo);
	int deleteClub(int clubNo);
	
}

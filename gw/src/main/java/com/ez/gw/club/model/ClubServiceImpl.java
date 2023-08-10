package com.ez.gw.club.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ez.gw.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ClubServiceImpl implements ClubService{
	private final ClubDAO clubDao;

	@Override
	public int insertClub(ClubVO vo) {
		return clubDao.insertClub(vo);
	}

	@Override
	public List<ClubVO> selectClub(SearchVO searchVo) {
		return clubDao.selectClub(searchVo);
	}
	
}

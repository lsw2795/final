package com.ez.gw.clubboard.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ez.gw.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ClubBoardServiceImpl implements ClubBoardService{
	private final ClubBoardDAO clubboardDao;

	@Override
	public List<Map<String, Object>> clubBoardView(int clubNo, SearchVO searchVo) {
		return clubboardDao.clubBoardView(clubNo, searchVo);
	}

	@Override
	public int insertClubBoard(ClubBoardVO clubVo) {
		return clubboardDao.insertClubBoard(clubVo);
	}

	
}

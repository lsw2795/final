package com.ez.gw.position.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PositionServiceImpl implements PositionService{
	private final PositionDAO positionDao;

	@Override
	public PositionVO positionByNo(int positionNo) {
		return positionDao.positionByNo(positionNo);
	}
}

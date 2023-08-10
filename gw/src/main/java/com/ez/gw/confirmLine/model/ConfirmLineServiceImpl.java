package com.ez.gw.confirmLine.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ConfirmLineServiceImpl implements ConfirmLineService{
	private final ConfirmLineDAO confirmLineDao;

	@Override
	public int insertConfirmLine(ConfirmLineVO vo) {
		return confirmLineDao.insertConfirmLine(vo);
	}
}

package com.ez.gw.secondhandTrade.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SecondHandTradeServiceImpl implements SecondHandTradeService{
	private final SecondHandTradeDAO secondHandTradeDao;

	@Override
	public int insertMarket(SecondHandTradeVO secondVo) {
		return secondHandTradeDao.insertMarket(secondVo);
	}

	
}

package com.ez.gw.secondhandTrade.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SecondHandTradeDAO {
	int insertMarket(SecondHandTradeVO secondVo);

}

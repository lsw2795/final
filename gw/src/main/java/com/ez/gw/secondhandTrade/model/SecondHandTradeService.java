package com.ez.gw.secondhandTrade.model;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileVO;

import jakarta.servlet.http.HttpServletRequest;

public interface SecondHandTradeService {
	void insertMarket(SecondHandTradeVO secondVo, SecondhandTradeFileVO fileVo) throws IOException;
	List<Map<String, Object>> secondMarketFileUpload(HttpServletRequest request) throws IllegalStateException, IOException;
}

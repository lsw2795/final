package com.ez.gw.secondhandTrade.model;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ez.gw.common.SearchSellVO;
import com.ez.gw.common.SearchVO;
import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileVO;

import jakarta.servlet.http.HttpServletRequest;

public interface SecondHandTradeService {
	int insertMarket(SecondHandTradeVO secondVo);
	List<Map<String, Object>> selectAllMarket(SearchSellVO searchVo);
	Map<String, Object> selectMarketByNo(int tradeNo);
	int updateReadCount(int tradeNo);
	int getTotalRecord(SearchSellVO searchVo);
	int updateMarket(SecondHandTradeVO secondVo);
	int deleteMarket(int tradeNo);
	int like(int tradeNo);
	int dislike(int tradeNo);
}

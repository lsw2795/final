package com.ez.gw.secondhandTrade.model;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ez.gw.common.SearchVO;
import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileVO;

import jakarta.servlet.http.HttpServletRequest;

public interface SecondHandTradeService {
	int insertMarket(SecondHandTradeVO secondVo);
	List<SecondHandTradeVO> selectAllMarket(SearchVO searchVo);
	SecondHandTradeVO selectMarketByNo(int tradeNo);
	int updateReadCount(int tradeNo);
	int getTotalRecord(SearchVO searchVo);
	int updateMarket(SecondHandTradeVO secondVo);
	int deleteMarket(int tradeNo);
	int updateLike(int tradeNo);
	int showLike(int tradeNo);
}

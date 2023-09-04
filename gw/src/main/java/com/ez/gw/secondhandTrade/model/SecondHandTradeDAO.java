package com.ez.gw.secondhandTrade.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.ez.gw.common.SearchVO;
import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileVO;

@Mapper
public interface SecondHandTradeDAO {
	int insertMarket(SecondHandTradeVO secondVo);
	List<Map<String, Object>> selectAllMarket(SearchVO searchVo);
	Map<String, Object> selectMarketByNo(int tradeNo);
	int updateReadCount(int tradeNo);
	int getTotalRecord(SearchVO searchVo);
	int updateMarket(SecondHandTradeVO secondVo);
	int deleteMarket(int tradeNo);
	int updateLike(int tradeNo);
	int showLike(int tradeNo);
}

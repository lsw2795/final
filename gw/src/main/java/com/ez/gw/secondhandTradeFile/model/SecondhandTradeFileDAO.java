package com.ez.gw.secondhandTradeFile.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ez.gw.secondhandTrade.model.SecondHandTradeVO;

@Mapper
public interface SecondhandTradeFileDAO {
	int insertFile(SecondhandTradeFileVO secondFileVo);
	List<SecondhandTradeFileVO> showThumbnail();
	List<SecondhandTradeFileVO> selectDetailFileByNo(int tradeNo);
	int updateFile(SecondhandTradeFileVO secondFileVo);
	int deleteMarketFile(int tradeNo);
}

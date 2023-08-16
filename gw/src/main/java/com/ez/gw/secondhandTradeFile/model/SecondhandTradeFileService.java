package com.ez.gw.secondhandTradeFile.model;

import java.util.List;

import com.ez.gw.secondhandTrade.model.SecondHandTradeVO;

public interface SecondhandTradeFileService {
	int insertFile(SecondhandTradeFileVO secondFileVo);
	List<SecondhandTradeFileVO> showThumbnail();
}

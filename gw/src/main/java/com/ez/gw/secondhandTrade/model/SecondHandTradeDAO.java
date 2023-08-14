package com.ez.gw.secondhandTrade.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileVO;

@Mapper
public interface SecondHandTradeDAO {
	int insertMarket(SecondHandTradeVO secondVo);
	List<SecondHandTradeVO> selectAllMarket();
}

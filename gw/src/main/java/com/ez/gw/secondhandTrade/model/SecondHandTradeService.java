package com.ez.gw.secondhandTrade.model;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileVO;

import jakarta.servlet.http.HttpServletRequest;

public interface SecondHandTradeService {
	int insertMarket(SecondHandTradeVO secondVo);
}

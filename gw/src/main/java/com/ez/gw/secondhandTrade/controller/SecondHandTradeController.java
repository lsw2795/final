package com.ez.gw.secondhandTrade.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.gw.position.controller.PositionController;
import com.ez.gw.secondhandTrade.model.SecondHandTradeService;
import com.ez.gw.secondhandTrade.model.SecondHandTradeVO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/market")
public class SecondHandTradeController {
	private static final Logger logger = LoggerFactory.getLogger(SecondHandTradeController.class);
	private SecondHandTradeService secondHandTradeService;
	
	@RequestMapping("/marketList")
	public String marketList() {
		logger.info("중고마켓 화면 보여주기");
		return "market/marketList";
	}
	
	@GetMapping("/addMarket")
	public String addMarket() {
		logger.info("중고거래 등록 화면 보여주기");
		return "market/addMarket";
	}
	
	/*
	@PostMapping("/addMarket")
	public String post_addMarket(@ModelAttribute SecondHandTradeVO secondVo, HttpServletRequest request, Model model){
		//1
		logger.info("중고거래 글 등록 화면, 파라미터 secondVo = {}", secondVo);
		
		//2
		String fileName = "", originalFileName = "";
		long fileSize = 0;
		try {
			List<Map<String, Object>> list = secondHandTradeService.secondMarketFileUpload(request);
			
			for(Map<String, Object> map : list) {
				fileName = map.get("fileName").toString();
				originalFileName = (String)map.get("originalFileName");
				fileSize = (long)map.get("fileSize");
			}//for
		}catch(IllegalStateException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
				
			
		fileVo.setFileName(fileName);
				
		
		int cnt = secondHandTradeService.insertMarket(secondVo);
		logger.info("중고거래 글 등록 처리 결과 cnt = {}", cnt);
		
		model.addAttribute("message", "글 작성이 완료되었습니다.");
		model.addAttribute("url", "redirect: /market/marketList");
		
		return "common/message";
		
	}
	*/
}

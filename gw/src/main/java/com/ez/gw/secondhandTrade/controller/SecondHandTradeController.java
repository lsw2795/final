package com.ez.gw.secondhandTrade.controller;

import java.io.File;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ez.gw.position.controller.PositionController;
import com.ez.gw.secondhandTrade.model.SecondHandTradeVO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/market")
public class SecondHandTradeController {
	private static final Logger logger = LoggerFactory.getLogger(SecondHandTradeController.class);
	
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
	
	@PostMapping("/addMarket")
	public String post_addMarket(@ModelAttribute SecondHandTradeVO secondVo, HttpServletRequest request, MultipartFile file) {
		
		String marketPath = System.getProperty("user.dir") + "C:\\Users\\Desktop\\final\\gw\\src\\main\\webapp\\market\\upload";
		
		UUID uuid = UUID.randomUUID();
		
		String fileName = uuid + "+" + file.getOriginalFilename();
		
		File saveFile = new File(marketPath, fileName);
		
		return "";
	}
}

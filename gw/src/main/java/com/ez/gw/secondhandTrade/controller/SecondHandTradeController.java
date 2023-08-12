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
import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileService;
import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/market")
@RequiredArgsConstructor
public class SecondHandTradeController {
	private static final Logger logger = LoggerFactory.getLogger(SecondHandTradeController.class);
	private final SecondHandTradeService secondHandTradeService;
	private final SecondhandTradeFileService secondHandTradeFileService;
	
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
	public String post_addMarket(@ModelAttribute SecondHandTradeVO secondVo, @ModelAttribute SecondhandTradeFileVO secondFileVo, HttpServletRequest request, Model model) {
		//1
		logger.info("중고거래 상품 등록, 파라미터 secondVo = {}", secondVo);
		
		//2
		//파일 업로드 처리
		String fileName = "", originalFileName = "";
		long fileSize = 0;
		try {
			//파일 업로드 처리
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
			
			List<MultipartFile> files = multiRequest.getFiles("imageURL2");
			
			for(MultipartFile f : files) {
				originalFileName = f.getOriginalFilename();
				fileName = System.currentTimeMillis() + "_" + originalFileName;
				fileSize = (long)f.getSize();
				
				String filePath = "C:\\Users\\Desktop\\final\\gw\\src\\main\\webapp\\market\\upload" + originalFileName;
				//String filePath = "C:\\Users\\pc\\git\\final\\gw\\src\\main\\webapp\\market\\upload" + originalFileName;
				
				File file = new File(filePath);
				f.transferTo(file);
						
				logger.info("파일명:{}", fileName);
				secondFileVo.setImageURL(fileName);
				secondFileVo.setTradeNo(secondVo.getTradeNo());
				int result = secondHandTradeFileService.insertFile(secondFileVo);
				logger.info("이미지 멀티 파일 등록 결과 result = {}", result);
			}
		}catch(IllegalStateException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		
		int cnt = secondHandTradeService.insertMarket(secondVo);
		logger.info("중고거래 상품 등록 처리 결과 cnt = {}", cnt);
		
		//3
		String msg = "", url = "";
		if(cnt>0) {
			msg = "상품이 성공적으로 등록되었습니다.";
			url = "redirect:/market/marketList";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4.
		return "/common/message";
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

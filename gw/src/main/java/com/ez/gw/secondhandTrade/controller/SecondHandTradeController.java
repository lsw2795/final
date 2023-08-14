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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.gw.position.controller.PositionController;
import com.ez.gw.secondhandTrade.model.SecondHandTradeService;
import com.ez.gw.secondhandTrade.model.SecondHandTradeVO;
import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileService;
import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/market")
@RequiredArgsConstructor
public class SecondHandTradeController {
	private static final Logger logger = LoggerFactory.getLogger(SecondHandTradeController.class);
	private final SecondHandTradeService secondHandTradeService;
	private final SecondhandTradeFileService secondHandTradeFileService;
	
	
	@GetMapping("/addMarket")
	public String addMarket() {
		logger.info("중고거래 등록 화면 보여주기");
		
		return "market/addMarket";
	}
	
	@GetMapping("/getMarket")
	public String get_addMarket(Model model, HttpSession session) {
		//세션에서 저장한 폼 데이터 불러오기
		SecondHandTradeVO secondVo = (SecondHandTradeVO)session.getAttribute("secondVo");
		SecondhandTradeFileVO secondFileVo = (SecondhandTradeFileVO)session.getAttribute("secondFileVo");
		
		//세션에서 데이터를 불러왔으면 해당 데이터를 모델에 추가하여 폼에 미리 채워진 상태로 보여줌
		if(secondVo!=null && secondFileVo!=null) {
			model.addAttribute("secondVo", secondVo);
			model.addAttribute("secondFileVo", secondFileVo);
		}
		return "/market/addMarket";
	}
	
	@PostMapping("/addMarket")
	public String post_addMarket(@ModelAttribute SecondHandTradeVO secondVo, @ModelAttribute SecondhandTradeFileVO secondFileVo, HttpServletRequest request, HttpSession session, Model model) {
		//1
		logger.info("중고거래 상품 등록, 파라미터 secondVo = {}", secondVo);
		String msg = "", url = "";
		int cnt=0;
		
		//2
		//파일 업로드 처리
		try {
			String fileName = "", originalFileName = "";
			long fileSize = 0;
			
			//파일 업로드 처리
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
			
			List<MultipartFile> files = multiRequest.getFiles("imageURL2");
			for(MultipartFile f : files) {
				logger.info("컨텐트 타입, contentType={}, png={}, jpg={}", f.getContentType(), f.getContentType().toLowerCase().endsWith("png"), f.getContentType().toLowerCase().endsWith("jpg"));
				//이미지 파일만 업로드 가능
				if(!f.getContentType().toLowerCase().endsWith("png")&&!f.getContentType().toLowerCase().endsWith("jpg")) {
					msg="이미지 파일만 등록해주세요.";
					url="/market/getMarket";
					
					//이전에 입력한 폼 데이터 세션에 저장
					session.setAttribute("secondVo", secondVo);
					session.setAttribute("secondFileVo", secondFileVo);
					
					model.addAttribute("msg", msg);
					model.addAttribute("url", url);
					
					return "common/message";
				}
			}//for
			
			cnt = secondHandTradeService.insertMarket(secondVo);
			logger.info("중고거래 상품 등록 처리 결과 cnt = {}", cnt);
			
			for(MultipartFile f : files) {
				originalFileName = f.getOriginalFilename();
				fileName = System.currentTimeMillis() + "_" + originalFileName;
				fileSize = (long)f.getSize();
				
				String path = "C:\\Users\\Desktop\\git\\final\\gw\\src\\main\\webapp\\market\\upload";
				//String filePath = request.getSession().getServletContext().getRealPath(path);
				//String filePath = "C:\\Users\\pc\\git\\final\\gw\\src\\main\\webapp\\market\\upload";
				
				File file = new File(path, fileName);
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
		
		//3
		
		if(cnt>0) {
			msg = "상품이 성공적으로 등록되었습니다.";
			url = "/market/marketList";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4.
		return "/common/message";
	}
	
	@RequestMapping("/marketList")
	public String marketList(Model model) {
		//1
		logger.info("중고마켓 화면 보여주기");
		
		//2
		List<SecondHandTradeVO> list = secondHandTradeService.selectAllMarket();
		logger.info("리스트 결과, list.size = {}", list.size());
		
		//3
		model.addAttribute("list", list);
		
		//4
		return "market/marketList";
	}
	
}

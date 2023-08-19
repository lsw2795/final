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
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.SearchVO;
import com.ez.gw.common.Utility;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.employee.model.EmployeeVO;
import com.ez.gw.position.controller.PositionController;
import com.ez.gw.secondhandTrade.model.SecondHandTradeService;
import com.ez.gw.secondhandTrade.model.SecondHandTradeVO;
import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileService;
import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileVO;

import ch.qos.logback.classic.pattern.Util;
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
	private final EmployeeService employeeService;
	
	
	
	
	@GetMapping("/addMarket")
	public String get_addMarket(Model model, HttpSession session) {
		//세션에서 저장한 폼 데이터 불러오기
		SecondHandTradeVO secondVo = (SecondHandTradeVO)session.getAttribute("secondVo");
		SecondhandTradeFileVO secondFileVo = (SecondhandTradeFileVO)session.getAttribute("secondFileVo");
		
		logger.info("중고거래 등록 화면 보여주기");
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
		int empNo = (int)session.getAttribute("empNo");
		secondVo.setEmpNo(empNo);
		logger.info("중고거래 상품 등록, 파라미터 secondVo = {}, empNo={}", secondVo, empNo);
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
			int i=0;
			for(MultipartFile f : files) {
				originalFileName = f.getOriginalFilename();
				int cut = originalFileName.indexOf(".");
				logger.info("cut={}", cut);
				String cutFileName = originalFileName.substring(cut);
				logger.info("cutFileName={}", cutFileName);
				
				fileName = secondVo.getTradeNo() +"_" + i++ + cutFileName;
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
	public String marketList(Model model, HttpSession session, @ModelAttribute SearchVO searchVo) {
		//1
		int empNo = (int)session.getAttribute("empNo");
		
		logger.info("중고마켓 화면 보여주기, 사원번호 ={}", empNo);
		
		//2
		//페이징
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//[2]SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<SecondHandTradeVO> list = secondHandTradeService.selectAllMarket(searchVo);
		List<SecondhandTradeFileVO> fileList = secondHandTradeFileService.showThumbnail();
		EmployeeVO emp = employeeService.selectByEmpNo(empNo);
		
		int totalRecord = secondHandTradeService.getTotalRecord(searchVo);
		logger.info("리스트 결과, list.size = {}, fileList.size={}", list.size(), fileList.size());
		pagingInfo.setTotalRecord(totalRecord);
		
		String sub = "";
		int time=0;
		for(SecondhandTradeFileVO f : fileList) {
			String fileName = f.getImageURL();
			int idx = fileName.indexOf(".");
			sub = fileName.substring(idx);
		}
		
		for(SecondHandTradeVO fg : list) {
			fg.setEmpNo(empNo);
			time=Utility.displayNew(fg.getRegdate());
			logger.info("title={}", fg.getTitle());
			logger.info("regdate={}", fg.getRegdate());
			logger.info("time={}", time);
					
		}
		
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("sub", sub);
		model.addAttribute("emp", emp);
		model.addAttribute("time", time);
		model.addAttribute("pagingInfo", pagingInfo);
		//4
		return "market/marketList";
	}
	
	@RequestMapping("/marketDetail")
	public String detail(@RequestParam(defaultValue = "0")int tradeNo, HttpSession session, Model model) {
		
		//1
		int empNo = (int)session.getAttribute("empNo");
		logger.info("중고거래 상세보기 페이지, 파라미터={}", tradeNo);
		
		//2
		SecondHandTradeVO secondVo = secondHandTradeService.selectMarketByNo(tradeNo);
		List<SecondhandTradeFileVO> fileList = secondHandTradeFileService.selectDetailFileByNo(tradeNo);
		EmployeeVO emp = employeeService.selectByEmpNo(empNo);
		
		logger.info("중고거래 상세보기 페이지 결과, secondVo={}, fileList.size={}", secondVo, fileList.size());
		
		
		int cnt = secondHandTradeService.updateReadCount(tradeNo);
		logger.info("조회수 증가 결과, cnt ={}", cnt);
		
		//3
		model.addAttribute("vo", secondVo);
		model.addAttribute("file", fileList);
		model.addAttribute("emp", emp);
		
		//4
		return "market/marketDetail";
	}
	
	@GetMapping("/editMarket")
	public String get_editMarket(@RequestParam(defaultValue = "0")int tradeNo, Model model, HttpSession session) {
		//1
		int empNo = (int)session.getAttribute("empNo");
		logger.info("중고거래 수정 페이지, 파라미터, tradeNo={}, empNo={}", tradeNo, empNo);
		if(tradeNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/market/marketList");
			
			return "common/message";
		}
		//2
		SecondHandTradeVO secondVo = secondHandTradeService.selectMarketByNo(tradeNo);
		List<SecondhandTradeFileVO> fileList = secondHandTradeFileService.selectDetailFileByNo(tradeNo);
		EmployeeVO emp = employeeService.selectByEmpNo(empNo);
		logger.info("조회 결과, secondVo={}", secondVo);
		logger.info("조회 결과, fileList={}", fileList);
		logger.info("조회 결과, emp={}", emp);
		
		//3
		model.addAttribute("vo", secondVo);
		model.addAttribute("fileList", fileList);
		model.addAttribute("emp", emp);
		
		//4
		return "/market/editMarket";
	}
	
	
	
}

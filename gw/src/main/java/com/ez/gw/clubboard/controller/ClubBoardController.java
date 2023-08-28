package com.ez.gw.clubboard.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.gw.clubboard.model.ClubBoardService;
import com.ez.gw.clubboard.model.ClubBoardVO;
import com.ez.gw.common.SearchVO;
import com.ez.gw.common.Utility;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/club")
public class ClubBoardController {
	private static final Logger logger = LoggerFactory.getLogger(ClubBoardController.class);
	private final ClubBoardService clubBoardService;
	
	@GetMapping("/clubBoardWrite")
	public String clubBoardWrite() {
		logger.info("동호회 게시판 작성");
		return "club/clubBoardWrite";
	}
	
	@RequestMapping("/clubBoardWrite")
	public String clubBoardWrite_post(@ModelAttribute ClubBoardVO clubVo, HttpSession session ,
			@RequestParam int clubNo,Model model) {
		//1.
		int empNo = (int)session.getAttribute("empNo");
		clubVo.setEmpNo(empNo);
		clubVo.setClubNo(clubNo);
		
		logger.info("동호회 게시판 작성하는 페이지 empNo={},clubVo={}",empNo,clubVo);
		
		//2.
		int cnt=clubBoardService.insertClubBoard(clubVo);
		logger.info("동호회 게시판 작성 결과 cnt={}",cnt);
		
		String msg="게시물 등록 실패", url="/club/clubBoard?clubNo="+clubNo;
		if(cnt>0) {
			msg="게시물 등록 완료";
		}

		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}
	
	
	@RequestMapping("/clubBoard")
	public String clubBoadList(@ModelAttribute SearchVO saerchVo,
			@RequestParam(defaultValue = "0")int clubNo, Model model) {
		//1.
		logger.info("각 동호회 자유게시판 전체페이지");
	
		//2.
		List<Map<String, Object>> list = clubBoardService.clubBoardView(clubNo, saerchVo);
		logger.info("동호회 게시판목록 list.size={}",list.size());
		
		for(Map<String, Object> map : list) { 
			 map.put("timeNew",Utility.displayNew((Date)map.get("REGDATE"))); 
		 }
		//3.
		model.addAttribute("list", list);
		
		return "club/clubBoard";
	}
	
	@RequestMapping("/clubBoardDetail")
	public String detailClubBoard(@RequestParam(defaultValue = "0")int clubNo,
			@RequestParam(defaultValue = "0")int boardNo,Model model) {
		//1.
		logger.info("동호회 게시판 상세보기 clubNo={},boardNo={}",clubNo,boardNo);
		
		if(clubNo==0 || boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/club/clubBoardList");

			return "common/message";
		}
		
		clubBoardService.updateReadcount(boardNo); //조회수
		
		//2.
		Map<String, Object> map = clubBoardService.detailClubBoard(clubNo, boardNo);
		logger.info("동호회게시글 상세보기 결과 map={}",map);
		
		//3.
		model.addAttribute("map", map);
		
		//4.
		return "club/clubBoardDetail";
	}
	
	
	
	
	
	
}


























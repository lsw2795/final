package com.ez.gw.clubboard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.clubboard.model.ClubBoardService;
import com.ez.gw.clubboard.model.ClubBoardVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/club")
public class ClubBoardController {
	private static final Logger logger = LoggerFactory.getLogger(ClubBoardController.class);
	private final ClubBoardService clubBoardService;
	
	
	@RequestMapping("/clubBoard")
	public String clubBoadList() {
		//1.
		logger.info("각 동호회 자유게시판 페이지");
		return "club/clubBoard";
	}
	
	@GetMapping("/clubBoardWrite")
	public String clubBoardWrite() {
		logger.info("동호회 게시판 작성");
		return "club/clubBoardWrite";
	}
	
	@RequestMapping("/clubBoardWrite")
	public String clubBoardWrite_post(@ModelAttribute ClubBoardVO clubVo, HttpSession session , Model model) {
		//1.
		int empNo = (int)session.getAttribute("empNo");
		int clubNo = (int)session.getAttribute("clubNo");
		clubVo.setEmpNo(empNo);
		clubVo.setClubNo(clubNo);
		logger.info("동호회 게시판 작성하는 페이지 empNo={},clubNo={},clubVo={}",empNo,clubNo,clubVo);
		
		//2.
		int cnt=clubBoardService.insertClubBoard(clubVo);
		logger.info("동호회 게시판 작성 결과 cnt={}",cnt);
		
		String msg="게시물 등록 실패", url="/club/clubBoard";
		if(cnt>0) {
			msg="게시물 등록 완료";
		}

		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}
	
	
	
	
}


























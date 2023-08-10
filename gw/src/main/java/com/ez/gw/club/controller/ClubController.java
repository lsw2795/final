package com.ez.gw.club.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.gw.club.model.ClubService;
import com.ez.gw.club.model.ClubVO;
import com.ez.gw.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/club")
public class ClubController {
	private static final Logger logger = LoggerFactory.getLogger(ClubController.class);
	private final ClubService clubService;
	
	@RequestMapping("/createClub")
	public String clubWrite() {
		//1.
		logger.info("동호회 개설 페이지");
		return "club/createClub";
	}
	
	@PostMapping("/createClub")
	public String clubWrite_post(@ModelAttribute ClubVO vo, Model model) {
		//1.
		logger.info("동호회 개설 처리 페이지 vo={}",vo);
		//2.
		int cnt=clubService.insertClub(vo);
		logger.info("동호회 개설 결과 cnt={}",cnt);
		
		//3.
		//4.
		return "redirect:/club/clubList";
	}
	
	@RequestMapping("/clubList")
	public String clubList(@ModelAttribute SearchVO searchVo,Model model) {
		//1.
		logger.info("동호회 개설 전체조회 searchVo={},",searchVo);
		//2.
		List<ClubVO>list=clubService.selectClub(searchVo);
		logger.info("개설된 동호회 list.size()={}",list.size());
		
		//3.
		model.addAttribute("list", list);
		//4.
		return "club/clubList";
	}
	
	@RequestMapping("/deleteClub")
	public String deleteClub(@RequestParam(defaultValue = "0")int clubNo, Model model) {
		//1.
		logger.info("동호회 삭제");
		//2.
		int cnt=clubService.deleteClub(clubNo);
		logger.info("동호회 삭제 결과 cnt={}",cnt);
		
		String msg="삭제 실패했습니다.", url="/club/clubList";
		if(cnt>0) {
			msg="삭제완료 되었습니다.";
			url="/club/clubList";
		}
		
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4.
		return "club/clubList";
	}
		
}



























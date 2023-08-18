package com.ez.gw.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.club.model.ClubService;
import com.ez.gw.club.model.ClubVO;
import com.ez.gw.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/adminclub")
public class AdminClubController {
	private static final Logger logger = LoggerFactory.getLogger(AdminClubController.class);
	private final ClubService clubService;
	
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
		return "admin/adminclub/clubList";
	}
	
}





































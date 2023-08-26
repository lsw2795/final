package com.ez.gw.commute.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.commute.model.CommuteService;
import com.ez.gw.commute.model.CommuteVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/commute")
public class CommuteController {
	private static final Logger logger = LoggerFactory.getLogger(CommuteController.class);
	private final CommuteService commuteService;

	@GetMapping("/status")
	public String CommutingStatus(HttpServletRequest request, Model model) {
		int empNo = (int) request.getSession().getAttribute("empNo");

		logger.info("근태관리 - 출/퇴근 현황 페이지");

		//String viewpage = "commute/commutingStatus";

        List<CommuteVO> list = commuteService.selectCommuteByEmpNo(empNo);
        logger.info("근태관리 - 출/퇴근 데이터 조회 결과 list.size={}", list.size());
        
        model.addAttribute("list", list);
        return "commute/commutingStatus";
    }
	
	
	@RequestMapping("/workIn")
	@ResponseBody
	public int ajaxWorkIn(@RequestParam(defaultValue = "0") int empNo) {
		//1
		logger.info("ajax 사원 번호={}", empNo);
		//2
		int cnt = commuteService.insertWorkIn(empNo);
		logger.info("출근 버튼 클릭시 인서트 결과 cnt={}", cnt);
		//3
		//4
		return cnt;
	}
		
	






}

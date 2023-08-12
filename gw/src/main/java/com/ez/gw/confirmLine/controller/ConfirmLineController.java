package com.ez.gw.confirmLine.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.confirm.controller.ConfirmController;
import com.ez.gw.confirmLine.model.ConfirmLineService;
import com.ez.gw.confirmLine.model.ConfirmLineVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/confirm")
@RequiredArgsConstructor
public class ConfirmLineController {
	private static final Logger logger = LoggerFactory.getLogger(ConfirmLineController.class);
	private final ConfirmLineService confirmLineService;
	
	@ResponseBody
	@RequestMapping("/createLineAjax")
	public String insertConfirmLine(@ModelAttribute ConfirmLineVO vo, Model model, HttpSession session) {
		//1
		logger.info("결재선 생성, 파라미터 vo={}",vo);
		
		//2
		int empNo=(int)session.getAttribute("empNo");
		vo.setConstructor(empNo);
		int cnt=confirmLineService.insertConfirmLine(vo);
		
		String msg="error : 결재선 생성 에러가 발생했습니다.";
		if(cnt>0) {
			msg="결재선이 생성되었습니다";
		}
		
		//4
		return msg;
	}
	
	@RequestMapping("deleteConfirmLine")
	public String deleteConfirmLine(@RequestParam(defaultValue = "0") int confirmLineNo, Model model) {
		//1
		logger.info("결재선 삭제 파라미터 confirmLineNo={}",confirmLineNo);
		
		//2
		int cnt=confirmLineService.deleteLine(confirmLineNo);
		logger.info("삭제 처리 결과 cnt={}",cnt);
		
		String msg="결재선 삭제 처리 중 에러가 발생했습니다.", url="/approval/selectEmp/selectConfirmLine";
		if(cnt>0) {
			msg="선택한 결재선이 삭제되었습니다.";
		}
		
		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		//4
		return "common/message";
	}
}

package com.ez.gw.confirmLine.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
		vo.setConstructor(1);
		int cnt=confirmLineService.insertConfirmLine(vo);
		
		String msg="error : 결재선 생성 에러가 발생했습니다.";
		if(cnt>0) {
			msg="결재선이 생성되었습니다";
		}
		
		//4
		return msg;
	}
}

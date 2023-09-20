package com.ez.gw.club.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.club.model.ClubService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PaymentClubController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentClubController.class);
	private final ClubService clubService;
	
	//결제 완료시 ajax
	@ResponseBody
	@GetMapping("/club/ajaxPaymentClub")
	public void ajaxPaymentClub(@RequestParam Map<String, Object> payment, HttpSession session) {
		logger.info("ajax 이용 - payment={}",payment); 
		
		String uid = String.valueOf(payment.get("merchant_uid"));
		String clubNo = String.valueOf(payment.get("custom_data[club_no]"));
		String empNo = String.valueOf(payment.get("custom_data[buyer_emp_no]"));
		logger.info("클럽 가입 결과, uid = {}, clubNo = {}, empNo = {}",uid, clubNo, empNo); 
		int cnt = clubService.joinClub(uid, clubNo, empNo);
		logger.info("클럽 가입 결과, cnt = {}",cnt); 
		
		if(cnt>0) {
			session.removeAttribute("clubNo");
			session.setAttribute("clubNo",clubNo);
		}
		
	}
	
	
}

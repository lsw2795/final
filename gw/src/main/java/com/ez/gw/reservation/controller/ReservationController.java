package com.ez.gw.reservation.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.position.controller.PositionController;
import com.ez.gw.reman.model.RemanService;
import com.ez.gw.reman.model.RemanVO;
import com.ez.gw.reservation.model.ReservationService;
import com.ez.gw.reservation.model.ReservationVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/reservation")
@RequiredArgsConstructor
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	private final ReservationService reservationService;
	private final RemanService remanService;
	
	@RequestMapping("/addReservation")
	public String get_addRes(Model model) {
		logger.info("예약 작성 페이지 띄우기");
		
		List<RemanVO> remanVo = remanService.selectAllReman();
		List<RemanVO> meetingRoom = remanService.selectOfficeProductByCategory("meetingRoom");
		List<RemanVO> noteBook = remanService.selectOfficeProductByCategory("noteBook");
		List<RemanVO> rentCar = remanService.selectOfficeProductByCategory("rentCar");
		
		model.addAttribute("remanVo", remanVo);
		model.addAttribute("meetingRoom", meetingRoom);
		model.addAttribute("noteBook", noteBook);
		model.addAttribute("rentCar", rentCar);
		
		return "reservation/addReservation";  
		
	}
	
	@PostMapping("/addReservation")
	public String post_addRes(@ModelAttribute ReservationVO reservationVo, Model model, HttpSession session) {
		//1
		int empNo = (int)session.getAttribute("empNo");
		logger.info("자원예약 등록 페이지, 파라미터 reservationVo={}, empNo={}", reservationVo, empNo);
		
		String msg = "", url = "";
		//2
		//2-1. 먼저 예약날짜에 starttime이 겹치는 게 있는지 확인
		//0보다 크면 해당 시간에 예약 내역 있음
		int cnt = reservationService.checkIsBooked(reservationVo);
		if(cnt>0) {	//해당 시간에 예약 있음
			
		}
		
		cnt = reservationService.insertReservation(reservationVo);
		
		//3
		
		//4
		return "reservation/addReservation";
		
	}
}

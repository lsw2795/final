package com.ez.gw.reservation.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.position.controller.PositionController;
import com.ez.gw.reman.model.RemanService;
import com.ez.gw.reman.model.RemanVO;
import com.ez.gw.reservation.model.ReservationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/reservation")
@RequiredArgsConstructor
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	private final ReservationService reserationService;
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
}

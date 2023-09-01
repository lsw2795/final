package com.ez.gw.reservation.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.JustSearchRemanVO;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.employee.model.EmployeeVO;
import com.ez.gw.reman.model.RemanService;
import com.ez.gw.reman.model.RemanVO;
import com.ez.gw.reservation.model.ReservationService;
import com.ez.gw.reservation.model.ReservationVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/reservation")
@RequiredArgsConstructor
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	private final ReservationService reservationService;
	private final RemanService remanService;
	private final EmployeeService employeeService;

	@RequestMapping("/addReservation")
	public String get_addRes(Model model) {
		logger.info("예약 작성 페이지 띄우기");

		//List<RemanVO> remanVo = remanService.selectAllReman();
		//List<RemanVO> meetingRoom = remanService.selectOfficeProductByCategory("meetingRoom");
		//List<RemanVO> noteBook = remanService.selectOfficeProductByCategory("noteBook");
		//List<RemanVO> rentCar = remanService.selectOfficeProductByCategory("rentCar");

		//model.addAttribute("remanVo", remanVo);
		//model.addAttribute("meetingRoom", meetingRoom);
		//model.addAttribute("noteBook", noteBook);
		//model.addAttribute("rentCar", rentCar);

		return "reservation/addReservation";  

	}

	@PostMapping("/addReservation")
	public String post_addRes(@ModelAttribute ReservationVO reservationVo, Model model, HttpSession session) {
		//1
		int empNo = (int)session.getAttribute("empNo");
		logger.info("자원예약 등록 페이지, 파라미터 reservationVo={}, empNo={}", reservationVo, empNo);

		String msg = "예약 실패", url = "reservation/addReservation";
		//2
		EmployeeVO emp = employeeService.selectByEmpNo(empNo);
		reservationVo.setDeptNo(emp.getDeptNo());
		reservationVo.setEmpNo(empNo);

		int cnt = reservationService.insertReservation(reservationVo);
		if(cnt>0) {

			msg = "예약이 완료되었습니다.";
			url = "/reservation/reservationList";
		}
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";

	}

	/**
	 * 예약 있는지 여부 확인 ajax
	 * */
	@RequestMapping("/ajaxCheckBook")
	@ResponseBody
	public int check(@ModelAttribute ReservationVO reservationVo) {
		//1
		logger.info("ajax 확인 파라미터 reservationVo={}", reservationVo);

		//2
		int result = 0;
		int cnt = reservationService.checkIsBooked(reservationVo);
		if(cnt>0) {
			result =ConstUtil.BOOK_NOTOK;	//1
		}else {
			result = ConstUtil.BOOK_OK;		//2
		}
		//3
		//4
		return result;
	}

	@RequestMapping("/reservationList")
	public String reservationList(@ModelAttribute JustSearchRemanVO searchRemanVo, Model model, HttpServletRequest request){
		logger.info("자원예약 보기");
		List<Map<String, Object>> reservationList = null;

		reservationList = reservationService.selectAllReservation();
		logger.info("자원예약 내역 reservationList.size()={}", reservationList.size());
		
		List<RemanVO> remanVo = remanService.selectAllReman();
		searchRemanVo.setCategory("meetingRoom");
		List<RemanVO> meetingRoom = remanService.selectOfficeProductByCategory(searchRemanVo);
		
		searchRemanVo.setCategory("noteBook");
		List<RemanVO> noteBook = remanService.selectOfficeProductByCategory(searchRemanVo);
		searchRemanVo.setCategory("rentCar");
		List<RemanVO> rentCar = remanService.selectOfficeProductByCategory(searchRemanVo);

		model.addAttribute("remanVo", remanVo);
		model.addAttribute("meetingRoom", meetingRoom);
		model.addAttribute("noteBook", noteBook);
		model.addAttribute("rentCar", rentCar);
		
		model.addAttribute("reservationList", reservationList);

		return "reservation/reservationList";
	}


}

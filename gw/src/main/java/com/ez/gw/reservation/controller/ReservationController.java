package com.ez.gw.reservation.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	
	  @RequestMapping("/modalReservation") 
	  public String get_addRes(@ModelAttribute JustSearchRemanVO searchRemanVo, Model model, HttpServletRequest request) {
		  logger.info("자원예약 페이지 보기");
			//List<Map<String, Object>> reservationList = null;

			//reservationList = reservationService.selectAllReservation();
			//logger.info("자원예약 내역 reservationList.size()={}", reservationList.size());
			
			
			  List<RemanVO> remanVo = remanService.selectAllReman();
			  searchRemanVo.setCategory("meetingRoom"); List<RemanVO> meetingRoom =
			  remanService.selectOfficeProductByCategory(searchRemanVo);
			  
			  searchRemanVo.setCategory("noteBook"); List<RemanVO> noteBook =
			  remanService.selectOfficeProductByCategory(searchRemanVo);
			  searchRemanVo.setCategory("rentCar"); List<RemanVO> rentCar =
			  remanService.selectOfficeProductByCategory(searchRemanVo);
			  
			  model.addAttribute("remanVo", remanVo); model.addAttribute("meetingRoom",
			  meetingRoom); model.addAttribute("noteBook", noteBook);
			  model.addAttribute("rentCar", rentCar);
			 
			
			//model.addAttribute("reservationList", reservationList);
		  
		  return "reservation/modalReservation";
	  
	  }
	 

	@PostMapping("/addReservation")
	@ResponseBody
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
		logger.info("예약 여부 ajax 확인 파라미터 reservationVo={}", reservationVo);

		//2
		int result = 0;
		int cnt = reservationService.checkIsBooked(reservationVo);
		logger.info("해당시간 예약 존재 여부 cnt={}", cnt);
		RemanVO remanVo = remanService.selectRemanByNo(reservationVo.getRemanNo());
		int state = remanVo.getState();
		if(cnt>0) {
			result =ConstUtil.BOOK_NOTOK;	//1
		}else {
			if(state == 1) {
				result = ConstUtil.BOOK_OK;		//2
			}else if(state == 2) {
				result = ConstUtil.REMAN_NOTOK; //4 
			}else if(state == 3) {
				result = ConstUtil.ADMIN_ASK; //관리자 문의
			}
		}
		//3
		//4
		return result;
	}
	
	@RequestMapping("/reservationList")
	public String reservationList(Model model, HttpServletRequest request){
		logger.info("자원예약 보기");
		List<Map<String, Object>> reservationList = null;

		reservationList = reservationService.selectAllReservation();
		logger.info("자원예약 내역 reservationList.size()={}", reservationList.size());
		
		model.addAttribute("reservationList", reservationList);

		return "reservation/reservationList";
	}
	
	
	/**
	 * 모달창에 디테일 뿌리기
	 * @param reservationNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/DetailReservation")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> detail(@RequestParam(defaultValue = "0")int reservationNo, Model model) {
		//1
		logger.info("자원예약 디테일, 파라미터 reservationNo={}", reservationNo);
		
		
		//2
		Map<String, Object> map = reservationService.detailReservation(reservationNo);
		logger.info("map={}", map);
		
		//3
		model.addAttribute("map", map);
		
		//4
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}

	@RequestMapping("/delReservation")
	public String delReservation(@RequestParam(defaultValue = "0")int reservationNo, Model model) {
		//1
		logger.info("자원예약 삭제 페이지, 파라미터 reservationNo={}", reservationNo);
		//2
		String msg = "삭제 실패", url = "/reservation/reservationList";
		int cnt = reservationService.delReservation(reservationNo);
		
		if(cnt>0) {
			msg = "삭제 완료";
		}
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	@GetMapping("/editReservation")
	public String get_edit(@ModelAttribute JustSearchRemanVO searchRemanVo, Model model, HttpServletRequest request, @RequestParam(defaultValue = "0")int reservationNo) {
		//1
		logger.info("수정 페이지 열기");
		
		List<RemanVO> remanVo = remanService.selectAllReman();
		  searchRemanVo.setCategory("meetingRoom"); List<RemanVO> meetingRoom =
		  remanService.selectOfficeProductByCategory(searchRemanVo);
		  
		  searchRemanVo.setCategory("noteBook"); List<RemanVO> noteBook =
		  remanService.selectOfficeProductByCategory(searchRemanVo);
		  searchRemanVo.setCategory("rentCar"); List<RemanVO> rentCar =
		  remanService.selectOfficeProductByCategory(searchRemanVo);
		  
		  model.addAttribute("remanVo", remanVo); 
		  model.addAttribute("meetingRoom", meetingRoom); 
		  model.addAttribute("noteBook", noteBook);
		  model.addAttribute("rentCar", rentCar);
		
		//2
		ReservationVO resVo = reservationService.showReservationByNo(reservationNo);
		logger.info("resVo={}", resVo);
		
		//3
		model.addAttribute("resVo", resVo);
		
		//4
		return "reservation/editReservation";
	}
	
	@RequestMapping("/ajaxeditReservation")
	@ResponseBody
	public int post_edit(@ModelAttribute ReservationVO resVo) {
		//1
		logger.info("수정 post 페이지, 파라미터={}", resVo);
		
		//2
		int result = 0;
		int cnt = reservationService.updateReservation(resVo);
		logger.info("수정 결과, cnt = {}", cnt);
		
		//3
		//4
		if(cnt>0) {
			result=1;
		}else {
			result = 0;
		}
		
		return result;
	}
}

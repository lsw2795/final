package com.ez.gw.reman.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.common.JustSearchRemanVO;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.position.controller.PositionController;
import com.ez.gw.reman.model.ListRemanVO;
import com.ez.gw.reman.model.RemanService;
import com.ez.gw.reman.model.RemanVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class RemanController {
	private static final Logger logger = LoggerFactory.getLogger(RemanController.class);
	public final RemanService remanService;
	public final EmployeeService employeeService;

	@GetMapping("/admin/officeProduct/addOfficeProduct")
	public String get_officeProduct() {
		logger.info("관리자- 자원 등록 페이지 ");

		return "admin/officeProduct/addOfficeProduct";
	}

	@PostMapping("/admin/officeProduct/addOfficeProduct")
	public String post_officeProduct(@ModelAttribute RemanVO remanVo, Model model) {
		logger.info("관리자 - 자원 등록, 파라미터 remanVo={}", remanVo);

		int empNo = employeeService.selectEmpByName(remanVo.getManager());
		remanVo.setEmpNo(empNo);
		int cnt = remanService.insertOfficeProduct(remanVo);
		logger.info("자원 등록 결과, cnt={}", cnt);

		String msg = "", url = "";
		if (cnt > 0) {
			msg = "자원 등록이 완료되었습니다.";
			url = "/admin/officeProduct/officeProductList?category=meetingRoom";
		} else {
			msg = "자원 등록 실패";
			url = "/admin/officeProduct/addOfficeProduct";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/admin/officeProduct/officeProductList")
	public String productList(@ModelAttribute JustSearchRemanVO searchRemanVo, Model model) {
		logger.info("자원목록 페이지, 파라미터 searchRemanVo={}", searchRemanVo);
		
		  List<RemanVO> list = remanService.selectOfficeProductByCategory(searchRemanVo);
		  logger.info("list.size={}", list);
		  
		  model.addAttribute("list", list);
		 

		return "admin/officeProduct/officeProductList";
	}
	
	@RequestMapping("/admin/officeProduct/delOfficeProduct")
	public String productDelete(@ModelAttribute ListRemanVO remanVo, Model model) {
		//1
		logger.info("파라미터 remanVo={}", remanVo);
		
		//2
		List<RemanVO> remanList = remanVo.getRemanList();
		int cnt = remanService.multiDelReman(remanList);
		logger.info("삭제 결과, cnt = {}", cnt);
		
		String msg = "삭제 실패", url="/admin/officeProduct/officeProductList?category=meetingRoom";
		if(cnt>0) {
			msg = "삭제가 완료되었습니다.";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	@GetMapping("/admin/officeProduct/editOfficeProduct")
	public String get_edit(@RequestParam(defaultValue = "0")int remanNo, Model model) {
		//1
		logger.info("자원 수정 페이지, 파라미터 remanNo={}", remanNo);
		
		//2
		RemanVO remanVo = remanService.selectRemanByNo(remanNo);
		logger.info("remanVo={}", remanVo);
		
		//3
		model.addAttribute("remanVo", remanVo);
		
		//4
		return "admin/officeProduct/editOfficeProduct";
	}
	
	@PostMapping("/admin/officeProduct/editOfficeProduct")
	@ResponseBody
	public int post_edit(@ModelAttribute RemanVO remanVo, Model model) {
		//1
		logger.info("ajax remanVo = {}", remanVo);
		
		//2
		int result=0;
		int cnt = remanService.updateReman(remanVo);
		logger.info("자원 수정 결과, cnt = {}", cnt);
		
		if(cnt>0) {
			result = 1;
		}
		//3
		//4
		return result;
	}
	
	@RequestMapping("/admin/officeProduct/ajaxManagerCheck")
	@ResponseBody
	public int ajaxManagerCk(@RequestParam(required = false)String manager) {
		//
		logger.info("파라미터 manager = {}", manager);
		
		int cnt = employeeService.countManager(manager);
		logger.info("사원 찾기 결과, cnt = {}", cnt);
		
		int result = 0;
		if(cnt>0) {
			result = 1;	//사원 존재
		}else {
			result = 2;	//사원 존재하지 않음
		}
		
		return result;
	}
	
	@RequestMapping("/admin/officeProduct/staticProductList")
	public String staticProductList(@RequestParam(required = false)String category, String regdate, Model model) {
		logger.info("자원 통계 페이지, 파라미터 category={}, date={}", category, regdate);
		
		List<Map<String, Object>> meetingRoom = remanService.staticReman("meetingRoom", regdate);
		logger.info("회의실 조회 결과, meetingRoom={}", meetingRoom.size());
		
		List<Map<String, Object>> noteBook = remanService.staticReman("noteBook", regdate);
		logger.info("노트북 조회 결과, noteBook={}", noteBook.size());
		
		List<Map<String, Object>> rentCar = remanService.staticReman("rentCar", regdate);
		logger.info("렌트카 조회 결과, meetingRoom={}", rentCar.size());
		
		model.addAttribute("meetingRoom", meetingRoom);
		model.addAttribute("noteBook", noteBook);
		model.addAttribute("rentCar", rentCar);
		
		return "admin/officeProduct/staticProductList";
	}
}

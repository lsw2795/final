package com.ez.gw.reman.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.position.controller.PositionController;
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
	public String post_officeProduct(@ModelAttribute RemanVO remanVo, @RequestParam(required = false) String manager, Model model) {
		logger.info("관리자 - 자원 등록, 파라미터 remanVo={}, manager={}", remanVo, manager);
		
		int empNo = employeeService.selectEmpByName(manager);
		remanVo.setEmpNo(empNo);
		int cnt = remanService.insertOfficeProduct(remanVo);
		logger.info("자원 등록 결과, cnt={}", cnt);
		
		String msg = "", url = "";
		if(cnt>0) {
			msg = "자원 등록이 완료되었습니다.";
			url = "/admin/officeProduct/officeProductList";
		}else {
			msg = "자원 등록 실패";
			url = "/admin/officeProduct/addOfficeProduct";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/admin/officeProduct/officeProductList")
	public String productList(@RequestParam(required = false)String category, Model model) {
		logger.info("자원목록 페이지, 파라미터 category={}", category);
		
		List<RemanVO> list = remanService.selectOfficeProductByCategory(category);
		logger.info("list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/officeProduct/officeProductList";
	}
}

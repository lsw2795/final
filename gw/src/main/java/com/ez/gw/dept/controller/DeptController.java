package com.ez.gw.dept.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.dept.model.DeptService;
import com.ez.gw.dept.model.DeptVO;
import com.ez.gw.employee.model.EmployeeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DeptController {
	private static final Logger logger = LoggerFactory.getLogger(DeptController.class);
	private final DeptService deptService;
	private final EmployeeService empService;
	
	@RequestMapping("/mypage/organizationChart")
	public String deptList(Model model) {
		//1
		logger.info("조직도 화면 보여주기");
		//2
		List<DeptVO> deptList=deptService.selectAllDept();
		logger.info("부서 정보 조회 결과 deptList={}", deptList);
		//List<EmployeeService> empList=empService.selectEmpByDeptNo()
		
		//3
		model.addAttribute("deptList", deptList);
		
		return "mypage/organizationChart";
	}
	
}

package com.ez.gw.confirm.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.confirm.model.ConfirmService;
import com.ez.gw.dept.model.DeptService;
import com.ez.gw.dept.model.DeptVO;
import com.ez.gw.documentform.model.DocumentFormService;
import com.ez.gw.documentform.model.DocumentFormVO;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.employee.model.EmployeeVO;
import com.ez.gw.position.model.PositionService;
import com.ez.gw.position.model.PositionVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/approval")
@RequiredArgsConstructor
public class ConfirmController {
	private static final Logger logger = LoggerFactory.getLogger(ConfirmController.class);
    private final ConfirmService confirmService; 
    private final DocumentFormService documentFormService; 
    private final DeptService deptService; 
    private final PositionService positionService; 
    private final EmployeeService employeeService; 
    
    @GetMapping("/approvalWrite")
    public String approvalWrite_get(Model model ) {
    	//1
    	logger.info("결재 작성 페이지");
    	
    	//2
    	int no=1;
    	List<DocumentFormVO> formList = documentFormService.selectAllForm();
    	List<DeptVO> deptList = deptService.selectAllDept();
    	EmployeeVO empVo = employeeService.selectByEmpNo(no);
    	DeptVO deptVo = deptService.deptByNo(empVo.getDeptNo());
    	PositionVO positionVo = positionService.positionByNo(empVo.getPositionNo());
    	
    	//3
    	model.addAttribute("formList",formList);
    	model.addAttribute("deptList",deptList);
    	model.addAttribute("empVo",empVo);
    	model.addAttribute("deptVo",deptVo);
    	model.addAttribute("positonVo",positionVo);
    	logger.info("결재 양식 리스트 formList.size={}",formList.size());
    	
    	return "approval/approvalWrite";
    }
}

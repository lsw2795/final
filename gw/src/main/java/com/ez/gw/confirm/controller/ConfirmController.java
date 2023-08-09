package com.ez.gw.confirm.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    
    @GetMapping("/selectEmp/selectEmp")
    public String selecEmp_get(Model model ) {
    	//1
    	logger.info("참조자 선택 페이지");
    	
    	//2
    	List<EmployeeVO> empList = employeeService.selectAllEmp();
    	List<DeptVO> deptList = deptService.selectAllDept();
    	
    	//3
    	model.addAttribute("empList",empList);
    	model.addAttribute("deptList",deptList);
    	
    	return "approval/selectEmp/selectEmp";
    }
    
    @GetMapping("/selectEmp/createConfirmLine")
    public String createConfirmLine_get(Model model ) {
    	//1
    	logger.info("결재라인 생성 페이지");
    	
    	//2
    	List<EmployeeVO> empList = employeeService.selectAllEmp();
    	List<DeptVO> deptList = deptService.selectAllDept();
    	
    	//3
    	model.addAttribute("empList",empList);
    	model.addAttribute("deptList",deptList);
    	
    	return "approval/selectEmp/confirmLine";
    }
    
    @ResponseBody
    @RequestMapping("/selectEmpAjax")
    public EmployeeVO selectEmpAjax(@RequestParam (defaultValue = "0") int empNo) {
    	//1
    	logger.info("참조자 선택 empNo={}",empNo);
    	
    	EmployeeVO empVo = employeeService.selectByEmpNo(empNo);
    	logger.info("사원 조회 결과, empVo={}",empVo);
    	
    	return empVo;
    }
}
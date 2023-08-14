package com.ez.gw.confirm.controller;

import java.io.IOException;
import java.util.ArrayList;
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

import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.FileUploadUtil;
import com.ez.gw.confirm.model.ConfirmService;
import com.ez.gw.confirm.model.ConfirmVO;
import com.ez.gw.confirmFile.model.ConfirmFileService;
import com.ez.gw.confirmFile.model.ConfirmFileVO;
import com.ez.gw.confirmLine.model.ConfirmLineService;
import com.ez.gw.dept.model.DeptService;
import com.ez.gw.dept.model.DeptVO;
import com.ez.gw.deptagree.model.DeptagreeVO;
import com.ez.gw.documentform.model.DocumentFormService;
import com.ez.gw.documentform.model.DocumentFormVO;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.employee.model.EmployeeVO;
import com.ez.gw.position.model.PositionService;
import com.ez.gw.position.model.PositionVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/approval")
@RequiredArgsConstructor
public class ConfirmController {
	private static final Logger logger = LoggerFactory.getLogger(ConfirmController.class);
    private final ConfirmService confirmService; 
    private final ConfirmFileService confirmFileService; 
    private final DocumentFormService documentFormService; 
    private final DeptService deptService;
    private final PositionService positionService; 
    private final EmployeeService employeeService; 
    private final ConfirmLineService confirmLineService;
    
    
    @GetMapping("/approvalWrite")
    public String approvalWrite_get(Model model,HttpSession session ) {
    	//1
    	logger.info("결재 작성 페이지");
    	
    	//2
    	int empNo=(int)session.getAttribute("empNo");
    	List<DocumentFormVO> formList = documentFormService.selectAllForm();
    	List<DeptVO> deptList = deptService.selectAllDept();
    	EmployeeVO empVo = employeeService.selectByEmpNo(empNo);
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
    
    @PostMapping("/approvalWrite")
    public String approvalWrite_post(HttpSession session,HttpServletRequest request, @ModelAttribute ConfirmVO confirmVo,
    		@ModelAttribute DeptagreeVO deptAgreeVo,@RequestParam(required = false) int[] referEmpNo, Model model) {
    	//1
    	int empNo=(int)session.getAttribute("empNo");
    	logger.info("결재 작성 처리 파라미터 empNo={},confirmVo={}",empNo,confirmVo);
    	logger.info("결재 작성 처리 파라미터 합의부서 deptAgreeVo={}",deptAgreeVo);
    	logger.info("결재 작성 처리 파라미터 참조자 reperEmpNo={}",referEmpNo);
    	
    	//2
    	confirmVo.setEmpNo(empNo);
    	int cnt=confirmService.insertConfirm(confirmVo,deptAgreeVo,referEmpNo,request);
    	logger.info("결재 처리 결과 cnt={}",cnt);
    	
    	String msg="결재 작성 처리 중 에러가 발생했습니다.", url="/approval/approvalWrite";
    	if(cnt>0) {
    		msg="결재 작성 처리가 완료되었습니다.";
    	}
    	
    	//3
    	model.addAttribute("msg",msg);
    	model.addAttribute("url",url);
    	
    	return "common/message";
    }
    
    @GetMapping("/selectEmp/selectEmp")
    public String selecEmp_get(Model model,@RequestParam(required = false) int[] referEmpNo ) {
    	//1
    	logger.info("참조자 선택 페이지 파라미터 referEmpNo={}",referEmpNo);
    	
    	//2
    	List<EmployeeVO> empList = employeeService.selectAllEmp();
    	List<DeptVO> deptList = deptService.selectAllDept();
    	List<EmployeeVO> referEmpList = new ArrayList<>();
    	if(referEmpNo!=null) {
	    	for(int i=0;i<referEmpNo.length;i++) {
	    		EmployeeVO vo = employeeService.selectByEmpNo(referEmpNo[i]);
	    		referEmpList.add(vo);
	    	}
    	}
    	
    	//3
    	model.addAttribute("empList",empList);
    	model.addAttribute("deptList",deptList);
    	model.addAttribute("referEmpList",referEmpList);
    	
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
    
    @GetMapping("/selectEmp/selectConfirmLine")
    public String selectConfirmLine_get(HttpSession session, Model model ) {
    	//1
    	int empNo=(int)session.getAttribute("empNo");
    	logger.info("결재라인 선택 페이지 empNo={}",empNo);
    	
    	//2
    	List<Map<String, Object>> lineList = confirmLineService.selectByEmpNo(empNo);
    	logger.info("결재라인 조회 lineList={}",lineList.size());
    	
    	//3
    	model.addAttribute("lineList",lineList);
    	
    	//4
    	return "approval/selectEmp/selectConfirmLine";
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
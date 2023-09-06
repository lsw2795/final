package com.ez.gw.dept.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.dept.model.DeptAllVO;
import com.ez.gw.dept.model.DeptService;
import com.ez.gw.dept.model.DeptVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DeptController {
    private static final Logger logger = LoggerFactory.getLogger(DeptController.class);
    private final DeptService deptService;

    @RequestMapping("/mypage/organizationChart")
    public String deptList(@ModelAttribute DeptVO deptVo, Model model) {
        logger.info("조직도 화면 보여주기");

        List<DeptAllVO> list = deptService.selectAllDept2(deptVo);
        logger.info("부서 조회 결과 list.size()={}", list.size());
        model.addAttribute("list", list);

        return "mypage/organizationChart";
    }    
 
    @ResponseBody
    @RequestMapping("/admin/employee/checkDeptName")
    public int checkDeptName(@RequestParam (required = false)String deptName) {
    	logger.info("ajax 이용 - 부서 이름 중복확인 파라미터 deptName={}",deptName);
    	int cnt=deptService.checkDeptName(deptName);
    	logger.info("ajax 이용 - 부서 이름 중복확인 결과 cnt={}", cnt);
    	return cnt;
    }
    
    @ResponseBody
    @RequestMapping("/admin/employee/ajaxDeptInsert")
    public int insertDept(@ModelAttribute DeptVO deptVo) {
    	logger.info("ajax 이용 - 부서 생성, 파라미터 deptVo={}", deptVo);
    	int cnt=deptService.insertDept(deptVo);
    	logger.info("ajax 이용 - 부서 생성 결과 cnt={}", cnt);
    	return cnt;
    }
    
    @ResponseBody
    @RequestMapping("/admin/employee/ajaxSelectDept")
    public DeptVO selectDept(@RequestParam (defaultValue ="0")int deptNo) {
    	logger.info("ajax 이용 - 해당 부서 정보 조회, 파라미터 deptNo={}", deptNo);
    	DeptVO deptVo=deptService.deptByNo(deptNo);
    	logger.info("ajax 이용 - 해당 부서 정보 조회 결과, deptVo={}", deptVo);
    	return deptVo;
    }
    
    @ResponseBody
    @RequestMapping("/admin/employee/ajaxDeptUpdate")
    public int updateDept(@ModelAttribute DeptVO deptVo) {
    	logger.info("ajax 이용 - 선택한 부서 수정 파라미터 deptVo={}", deptVo);
    	int cnt=deptService.updateDept(deptVo);
    	logger.info("ajax 이용 - 선택한 부서 수정 결과 cnt={}", cnt);
    	return cnt;
    }
    
    @ResponseBody
    @RequestMapping("/admin/employee/ajaxDeptDelete")
    public int deleteDept(@RequestParam(defaultValue = "0")int deptNo) {
    	logger.info("ajax 이용 - 선택한 부서 삭제 파라미터 deptNo={}", deptNo);
    	int cnt=deptService.deptEmpCount(deptNo);
    	logger.info("ajax 이용 - 부서 삭제처리 전 해당 부서 사원수 조회 결과 cnt={}", cnt);
    	int result=0;
    	if(cnt==0) {
    		result=deptService.deleteDept(deptNo);
    		logger.info("ajax 이용 - 부서 삭제 처리 결과 result={}", result);
    	}
    	return result;
    }
    
    @ResponseBody
    @RequestMapping("/admin/employee/checkDeptName2")
    public int checkDeptName2(@RequestParam (required = false)String deptName,
    		@RequestParam(required = false)String oldDeptName) {
    	logger.info("ajax 이용 - 부서 수정 중 부서 이름 중복확인 파라미터 deptName={}, oldDeptName={}",deptName, oldDeptName);
    	int cnt=0;
    	if(deptName.equals(oldDeptName)) {
    		cnt=0;
    	}else {
    		cnt=deptService.checkDeptName(deptName);
    	}
    	logger.info("ajax 이용 - 부서 수정 중 부서 이름 중복확인 결과 cnt={}", cnt);
    	return cnt;
    }
    
    
}
	

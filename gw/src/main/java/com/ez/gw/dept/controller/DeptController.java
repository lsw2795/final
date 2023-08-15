package com.ez.gw.dept.controller;

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

import com.ez.gw.dept.model.DeptService;
import com.ez.gw.dept.model.DeptVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DeptController {
    private static final Logger logger = LoggerFactory.getLogger(DeptController.class);
    private final DeptService deptService;

    @GetMapping("/mypage/organizationChart")
    public String deptList(Model model) {
        logger.info("조직도 화면 보여주기");

        List<DeptVO> deptList = deptService.selectAllDept();
        logger.info("부서 정보 조회 결과 deptList={}", deptList);
        model.addAttribute("deptList", deptList);

        return "mypage/organizationChart";
    }
    
    @ResponseBody
    @RequestMapping("/mypage/ajaxOrganizationChart")
    public List<Map<String, Object>> EmpList(@RequestParam(defaultValue = "0") int deptNo) {
    	logger.info("ajax 이용 - 부서에 해당하는 직원 조회하기, 파라미터 deptNo={}", deptNo);
    	
    	List<Map<String, Object>> empList=deptService.selectEmpByDeptNo(deptNo);
    	logger.info("해당 직원 조회 결과, empList={}", empList);
    	
        return empList;
    }
}
	

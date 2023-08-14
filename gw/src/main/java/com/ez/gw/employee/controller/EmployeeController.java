package com.ez.gw.employee.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.FileUploadUtil;
import com.ez.gw.dept.model.DeptService;
import com.ez.gw.dept.model.DeptVO;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.employee.model.EmployeeVO;
import com.ez.gw.position.model.PositionService;
import com.ez.gw.position.model.PositionVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EmployeeController {
	private static final Logger logger=LoggerFactory.getLogger(EmployeeController.class);
	private final EmployeeService employeeService;
	private final DeptService deptService;
    private final PositionService positionService;
    private final FileUploadUtil fileuploadUtil;
    
	@GetMapping("/admin/employee/employeeRegister")
	public String empRegister_get(Model model) {
		logger.info("관리자 - 사원등록 페이지");
		List<DeptVO> deptList = deptService.selectAllDept();
		List<PositionVO> positionList=positionService.selectAllPosition();
		logger.info("부서&직위 전체목록 조회 결과, dpetList={}, positionList= {}", deptList, positionList);
		
		model.addAttribute("deptList",deptList);
		model.addAttribute("positionList",positionList);
		return "admin/employee/employeeRegister";
	}
	
	@PostMapping("/admin/employee/employeeRegister")
	public String productWrite_post(@ModelAttribute EmployeeVO vo
			, HttpServletRequest request, Model model) {
		logger.info("사원 등록 처리 파라미터 vo={}", vo);
		//이미지업로드 처리
		String fileName="", originalFileName="";
		long fileSize=0;
		try {
			List<Map<String, Object>> list
				=fileuploadUtil.fileupload(request, ConstUtil.UPLOAD_IMAGE_FLAG);
			
			for(Map<String, Object> map:list) {
				fileName=(String) map.get("fileName");
				originalFileName=(String) map.get("originalFileName");
				fileSize=(long) map.get("fileSize");
			}
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		vo.setImage(fileName);
		//db
		int cnt=employeeService.insertEmp(vo);
		logger.info("사원 등록 처리 결과 cnt={}",cnt);
		
	    String msg = "사원 등록에 실패했습니다.", url = "/admin/employee/employeeRegister";
        if (cnt > 0) {
            msg = "사원 등록을 완료했습니다.";
        }
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "common/message";
	}
	
}



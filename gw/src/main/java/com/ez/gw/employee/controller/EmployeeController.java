package com.ez.gw.employee.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
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
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.SearchVO;
import com.ez.gw.dept.model.DeptAllVO;
import com.ez.gw.dept.model.DeptService;
import com.ez.gw.dept.model.DeptVO;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.employee.model.EmployeeVO;
import com.ez.gw.position.model.PositionService;
import com.ez.gw.position.model.PositionVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EmployeeController {
	private static final Logger logger=LoggerFactory.getLogger(EmployeeController.class);
	private final EmployeeService employeeService;
	private final DeptService deptService;
	private final PositionService positionService;
	private final FileUploadUtil fileuploadUtil;
	private final PasswordEncoder passwordEncoder;

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
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
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
			msg = "사원번호 생성이 완료되었습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/mypage/empDetail")
	public String empDetail(@RequestParam (defaultValue = "0") int empNo, Model model) {
		logger.info("조직도- 사원 디테일 페이지 보기 파라미터 empNo={}", empNo);

		EmployeeVO empVo=employeeService.selectByEmpNo(empNo);
		logger.info("사원 디테일 조회 결과, empVo={}", empVo);

		model.addAttribute("empVo", empVo);

		return "mypage/empDetail";
	}

	@RequestMapping("/mypage/ajaxSearchEmp")
	@ResponseBody
	public Map<String, Object> searchEmpList(@ModelAttribute SearchVO searchVo) {
		logger.info("ajax 이용, 조직도 사원 검색- 파라미터 searchVo={}", searchVo);
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<Map<String, Object>> searchList = employeeService.selectSearchEmp(searchVo);
		int totalRecord = employeeService.gTRSearchEmp(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("ajax 이용, 조직도 사원 검색 결과 - searchList.size()={}", searchList.size());

		Map<String, Object> result = new HashMap<>();
		result.put("searchList", searchList);
		result.put("pagingInfo", pagingInfo);

		return result;
	}

	@GetMapping("/mypage/empInfoEdit")
	public String empEdit(HttpSession session,Model model) {
		int empNo=(int)session.getAttribute("empNo");
		logger.info("사원 정보 수정 페이지, 파라미터 empNo={}", empNo);
		Map<String, Object> map=employeeService.selectEmpByEmpNo(empNo);
		logger.info("사원 정보 수정 페이지 결과 map={}", map);
		model.addAttribute("map", map);
		return "mypage/empInfoEdit";
	}

	@PostMapping("/mypage/empInfoEdit")
	public String empEdit_post(@ModelAttribute EmployeeVO empVo,
			HttpSession session, Model model) {
		int empNo=(int)session.getAttribute("empNo");
		empVo.setEmpNo(empNo);
		logger.info("사원 - 사원정보 수정처리 파라미터 empVo={}", empVo);

		int result=employeeService.loginCheck(empVo.getPwd(),empVo.getEmpNo());
		logger.info("비밀번호 체크 결과 result={}",result);

		String msg="정보 수정에 실패했습니다.", url="/mypage/empInfoEdit";
		if(result==employeeService.LOGIN_OK) {
			int cnt=employeeService.updateEmpInfo(empVo);
			logger.info("사원정보 수정결과 cnt={}", cnt);
			if(cnt>0) {
				msg="정보 수정이 완료되었습니다.";
			}
		}else if(result==employeeService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@GetMapping("/inc/empMain")
	public String empMain(HttpSession session,Model model) {
		int empNo=(int)session.getAttribute("empNo");
		logger.info("사원메인 정보 페이지, 파라미터 empNo={}", empNo);
		Map<String, Object> empMap=employeeService.selectEmpByEmpNo(empNo);
		logger.info("사원메인 정보 페이지 결과 empMap={}", empMap);
		model.addAttribute("empMap", empMap);
		return "inc/empMain";
	}

	@GetMapping("/mypage/pwdEdit")
	public String pwdEdit(){
		logger.info("사원 비밀번호 변경 페이지");
		return "mypage/pwdEdit";
	}

	@RequestMapping("/ajaxPwdCheck")
	@ResponseBody
	public int pwdCheck(HttpSession session,
			@RequestParam (required = false)String pwd) {
		int empNo=(int)session.getAttribute("empNo");
		logger.info("ajax이용 - 비밀번호 일치 파라미터 pwd={}, empNo={}", pwd, empNo);

		int result=employeeService.loginCheck(pwd,empNo);
		if(result==employeeService.LOGIN_OK){
			result=1;
		}else if(result==employeeService.PWD_DISAGREE){
			result=0;
		}
		logger.info("ajax이용 - 비밀번호 일치 결과 result={}", result);
		return result;
	}

	@PostMapping("/mypage/pwdEdit")
	public String pwdEdit_post(@ModelAttribute EmployeeVO empVo,
			HttpSession session, Model model) {
		int empNo=(int)session.getAttribute("empNo");
		empVo.setEmpNo(empNo);
		empVo.setPwd(passwordEncoder.encode(empVo.getPwd()));
		logger.info("사원 - 비밀번호 수정처리 파라미터 empVo={}", empVo);

		int cnt=employeeService.updateEmpPwd(empVo);
		logger.info("사원 - 비밀번호 수정결과 cnt={}", cnt);
		String msg="비밀번호 수정에 실패했습니다.", url="/mypage/pwdEdit";
		if(cnt>0) {
			msg="비밀번호 수정이 완료되었습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/admin/employee/employeeList")
	public String empList(@ModelAttribute SearchVO searchVo,
			@ModelAttribute DeptVO deptVo, Model model){
		logger.info("관리자 - 전체 임직원 목록,조직도 조회 파라미터 searchVo={}", searchVo);
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<Map<String, Object>> list=employeeService.selectSerachEmp2(searchVo);
		logger.info("한 페이지당 임직원 목록 조회결과, list.size={}",list.size());

		int totalRecord=employeeService.getTotalRecord(searchVo);
		logger.info("임직원 목록 전체 조회, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		List<DeptAllVO> deptList = deptService.selectAllDept2(deptVo);
		logger.info("부서 조회 결과 deptList.size()={}", deptList.size());

		//3
		model.addAttribute("list", list);
		model.addAttribute("deptList", deptList);
		model.addAttribute("pagingInfo", pagingInfo);

		//4
		return "admin/employee/employeeList";	
	}

	@GetMapping("/admin/employee/employeeEdit")
	public String adminEmpEdit(@RequestParam (defaultValue = "0")int empNo, Model model) {
		logger.info("관리자 - 사원 정보 수정 페이지 보여주기, 파라미터 empNo={}", empNo);
		List<DeptVO> deptList = deptService.selectAllDept();
		List<PositionVO> positionList=positionService.selectAllPosition();
		Map<String, Object> map=employeeService.selectEmpByEmpNo(empNo);
		logger.info("부서&직위 전체목록 조회 결과, dpetList={}, positionList= {}", deptList, positionList);
		model.addAttribute("deptList",deptList);
		model.addAttribute("positionList",positionList);
		model.addAttribute("map", map);
		return "admin/employee/employeeRegister";
	}

	@PostMapping("/admin/employee/employeeEdit")
	public String adminEmpEdit_post(@RequestParam (defaultValue = "0") int empNo,
	        @ModelAttribute EmployeeVO empVo,
	        HttpServletRequest request, @RequestParam String oldFileName, Model model) {
	    empVo.setEmpNo(empNo);
	    logger.info("관리자 - 사원 정보 수정 처리 파라미터 empVo={}, oldFileName={}", empVo, oldFileName);

	    String fileName = "", originalFileName = "";
	    long fileSize = 0;
	    try {
	        List<Map<String, Object>> list = fileuploadUtil.fileupload(request, ConstUtil.UPLOAD_IMAGE_FLAG);

	        for (Map<String, Object> map : list) {
	            fileName = (String) map.get("fileName");
	            originalFileName = (String) map.get("originalFileName");
	            fileSize = (long) map.get("fileSize");
	        }

	    } catch (IllegalStateException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    EmployeeVO vo = employeeService.selectByEmpNo(empNo);
	    logger.info("파일 업로드후 db에 저장되어있는 사원 이미지 image={}", vo.getImage());

	    if (fileName != null && !fileName.isEmpty()) {
	        empVo.setImage(fileName);
	        if (!oldFileName.equals(fileName)) { // If new file uploaded and names are different
	            if (oldFileName != null && !oldFileName.isEmpty()) { // If old file exists
	                String upPath = fileuploadUtil.getUploadPath(request, ConstUtil.UPLOAD_IMAGE_FLAG);
	                File file = new File(upPath, oldFileName);
	                if (file.exists()) {
	                    boolean bool = file.delete();
	                    logger.info("기존 파일 삭제 여부 bool={}", bool);
	                }
	            }
	        }
	    } else {
	        empVo.setImage(oldFileName);
	    }

	    int cnt = employeeService.updateEmpAdmin(empVo);
	    logger.info("관리자 - 사원 정보 수정 처리 결과 cnt={}", cnt);

	    String msg = "사원 정보 수정에 실패했습니다.", url = "/admin/employee/employeeEdit?empNo=" + empVo.getEmpNo();
	    if (cnt > 0) {
	        msg = "사원 정보 수정이 완료되었습니다.";
	    }
	    model.addAttribute("msg", msg);
	    model.addAttribute("url", url);
	    return "common/message";
	}
	
	
}






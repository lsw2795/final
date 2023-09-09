package com.ez.gw.employee.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import jakarta.servlet.http.HttpServletResponse;
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
			msg = vo.getName()+"임직원의 사원번호 생성이 완료되었습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/mypage/empDetail")
	public String empDetail(@RequestParam (defaultValue = "0") int empNo, Model model) {
		logger.info("조직도- 사원 디테일 페이지 보기 파라미터 empNo={}", empNo);

		Map<String, Object> map=employeeService.selectEmpByEmpNo(empNo);
		logger.info("사원 디테일 조회 결과, map={}", map);

		model.addAttribute("map", map);

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

	@RequestMapping("/inc/empMain")
	public String empMain(HttpSession session,Model model) {
		int empNo=(int)session.getAttribute("empNo");
		//logger.info("사원메인 정보 페이지, 파라미터 empNo={}", empNo);
		Map<String, Object> empMap=employeeService.selectEmpByEmpNo(empNo);
		//logger.info("사원메인 정보 페이지 결과 empMap={}", empMap);
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

	@ResponseBody
	@RequestMapping("/mypage/ajaxPwdEdit")
	public int pwdEdit_post(@ModelAttribute EmployeeVO empVo,
			HttpSession session) {
		int empNo=(int)session.getAttribute("empNo");
		empVo.setEmpNo(empNo);
		empVo.setPwd(passwordEncoder.encode(empVo.getPwd()));
		logger.info("사원 - 비밀번호 수정처리 파라미터 empVo={}", empVo);

		int cnt=employeeService.updateEmpPwd(empVo);
		logger.info("사원 - 비밀번호 수정결과 cnt={}", cnt);
		return cnt;
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
		
		List<Map<String, Object>> managerList=deptService.selectManager();
		logger.info("부서장 자격 임직원 조회 결과 managerList.size()={}", managerList.size());
		
		List<DeptVO> deptList2=deptService.selectAllDept();
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("deptList", deptList);
		model.addAttribute("deptList2", deptList2);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("managerList", managerList);

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

	@ResponseBody
	@RequestMapping("/ajaxUpdateRetiredate")
	public int updateEmpRetiredate(@ModelAttribute EmployeeVO empVo,
			@RequestParam (defaultValue = "0") int empNo,
			@RequestParam (required = false)String retiredate) {
		 empVo.setEmpNo(empNo);
		 empVo.setRetiredate(retiredate);
		 logger.info("관리자 - 사원 퇴사 처리 파라미터 empVo={}", empVo);
		 int cnt=employeeService.updateEmpRetiredate(empVo);
		 logger.info("관리자 - 사원 퇴사 처리 결과, cnt={}", cnt);
		 
		 return cnt;
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
	    empVo.setImage(fileName);

	    if (empVo.getImage()!= null && !empVo.getImage().isEmpty()) { //새파일 업로드
            if (oldFileName != null && !oldFileName.isEmpty()) { //기존 파일이 있으면
                String upPath = fileuploadUtil.getUploadPath(request, ConstUtil.UPLOAD_IMAGE_FLAG);
                File file = new File(upPath, oldFileName);
                if (file.exists()) {
                    boolean bool = file.delete();
                    logger.info("기존 파일 삭제 여부 bool={}", bool);
                }
            }
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
	
	@GetMapping("/admin/employee/exportToExcel")
	public void exportToExcel(HttpServletResponse response) throws IOException {
		logger.info("엑셀로 저장");
		
		List<Map<String, Object>> list=employeeService.selEmpExportExcel();
		logger.info("사원 전체목록 조회 결과, list.size()={}", list.size());
	    Workbook workbook = new XSSFWorkbook();
	    Sheet sheet = workbook.createSheet("사원 목록");

	    Row headerRow = sheet.createRow(0);
	    headerRow.createCell(0).setCellValue("사원번호");
	    headerRow.createCell(1).setCellValue("사원이름");
	    headerRow.createCell(2).setCellValue("부서");
	    headerRow.createCell(3).setCellValue("직위");
	    headerRow.createCell(4).setCellValue("내선번호");
	    headerRow.createCell(5).setCellValue("입사일");

	    int rowNum = 1;
	    for (Map<String, Object> empMap : list) {
	        Row row = sheet.createRow(rowNum++);
	        row.createCell(0).setCellValue(empMap.get("EMP_NO") != null ? empMap.get("EMP_NO").toString() : "");
	        row.createCell(1).setCellValue(empMap.get("NAME") != null ? empMap.get("NAME").toString() : "");
	        row.createCell(2).setCellValue(empMap.get("DEPT_NAME") != null ? empMap.get("DEPT_NAME").toString() : "");
	        row.createCell(3).setCellValue(empMap.get("POSITION_NAME") != null ? empMap.get("POSITION_NAME").toString() : "");
	        row.createCell(4).setCellValue(empMap.get("EXTENSION_NO") != null ? empMap.get("EXTENSION_NO").toString() : "");

	        if (empMap.get("HIREDATE") != null) {
	            Date hiredate = (Date) empMap.get("HIREDATE");
	            Cell hiredateCell = row.createCell(5);
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            hiredateCell.setCellValue(dateFormat.format(hiredate));
	        } else {
	            row.createCell(5).setCellValue("");
	        }
	    }

	    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	    response.setHeader("Content-Disposition", "attachment; filename=employeeList_data.xlsx");

	    OutputStream outputStream = response.getOutputStream();
	    workbook.write(outputStream);
	    workbook.close();
	    outputStream.close();
	}
	
	@RequestMapping("/admin/employee/empList")
	public String selempCount(@RequestParam (defaultValue = "0") int year,Model model) {
		logger.info("관리자 - 메인 사원 통계 파라미터 year={}", year);
		List<Map<String, Object>> empList=employeeService.selEmpCountByDeptName(year);
		logger.info("관리자 - 메인 사원 통계 결과, empList={}", empList);
		
		model.addAttribute("empList", empList);
		
		return "admin/employee/empList";
	}
	
}






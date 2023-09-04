package com.ez.gw.commute.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import org.springframework.web.multipart.MultipartFile;

import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.commute.model.CommuteService;
import com.ez.gw.commute.model.CommuteVO;
import com.ez.gw.commute.model.SearchCommuteVO;
import com.ez.gw.dept.model.DeptService;
import com.ez.gw.dept.model.DeptVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class CommuteController {
	private static final Logger logger = LoggerFactory.getLogger(CommuteController.class);
	private final CommuteService commuteService;
	private final DeptService deptService;

	@GetMapping("/commute/status")
	public String CommutingStatus(HttpServletRequest request, Model model) {
		int empNo = (int) request.getSession().getAttribute("empNo");

		logger.info("근태관리 - 출/퇴근 현황 페이지");

		List<CommuteVO> list = commuteService.selectCommuteByEmpNo(empNo);
		logger.info("근태관리 - 출/퇴근 데이터 조회 결과 list.size={}", list.size());


		model.addAttribute("list", list);
		return "commute/commutingStatus";
	}


	@RequestMapping("/commute/workIn")
	@ResponseBody
	public int ajaxWorkIn(@RequestParam(defaultValue = "0") int empNo) {
		//1
		logger.info("ajax 사원 번호={}", empNo);

		//2
		int count = commuteService.selectIsWorkIn(empNo); // 출근 기록 없으면 0, 출근 기록 있으면 1 리턴
		logger.info("출근 기록 존재 여부 count={}", count);

		int result = 0; //ajax로 리턴해줄 int 값 초기화, 0:출근 처리 실패 1:출근 처리 성공
		if(count<1) { //출근 기록 없을때만 insert
			int cnt = commuteService.insertWorkIn(empNo);

			LocalDateTime currentTime = LocalDateTime.now();
			LocalDateTime nineAM = currentTime.withHour(9).withMinute(0).withSecond(0).withNano(0);

			int commuteState = currentTime.isBefore(nineAM) ? 0 : 1; // 0: On time, 1: Late
			CommuteVO vo = new CommuteVO();
			vo.setEmpNo(empNo);
			vo.setCommuteState(commuteState);

			int cnt2 = commuteService.updateCommuteState(vo); // 오전 9시 이후로 출근하면 근태 상태가 1 지각으로 바뀌는 메서드
			logger.info("출근 버튼 클릭시 지각 여부 cnt2={}", cnt2);
			if(cnt2==1) {
				return 2; //지각 출근
			}


			logger.info("출근 버튼 클릭시 인서트 결과 cnt={}", cnt);
			result = 1; //출근 처리 성공
		}

		return result;

	}

	@RequestMapping("/commute/workOut")
	@ResponseBody
	public int ajaxWorkOut(@RequestParam(defaultValue = "0") int empNo) {
		//1
		logger.info("ajax 사원 번호={}", empNo);

		//출근기록 있는지 여부 조회 없으면 0 있으면 1
		int count = commuteService.selectIsWorkIn(empNo); // 출근 기록 없으면 0, 출근 기록 있으면 1 리턴
		logger.info("출근 기록 존재 여부 count={}", count);

		int result = 0; //ajax로 리턴해줄 int 값 초기화, 0:퇴근 처리 실패 1:퇴근 처리 성공

		//출근 기록이 있으면
		if(count>0) { //출근 기록 있을때만 insert
			int count2 = commuteService.selectIsWorkOut(empNo); //퇴근기록 조회
			logger.info("퇴근 기록 조회 여부 count2={}", count2);
			//출근기록이 있는데 퇴근기록이 없을때만 퇴근 처리
			if(count2<1) {
				int cnt = commuteService.updateWorkOut(empNo);
				logger.info("퇴근 버튼 클릭시 인서트 결과 cnt={}", cnt);
				result = 1; //퇴근 처리 완료

				if (cnt > 0) {
					LocalDateTime currentTime = LocalDateTime.now();
					LocalDateTime sixPM = currentTime.withHour(18).withMinute(0).withSecond(0).withNano(0);
					if (currentTime.isBefore(sixPM)) { // 오후 6시 이전에 퇴근한 경우에만 commute_state 업데이트
						int state = commuteService.selectLateState(empNo); //지각여부 조회 1이면 지각
						logger.info("지각 여부 조회 state={}", state);

						result = 3;
						if(state==1) {
							int cnt3 = commuteService.updateCommuteStateTotal(empNo);
							logger.info("지각도했고 6시 이전에 퇴근도 했으면 업데이트 ={}", cnt3);

						}else {
							int result2 = commuteService.updateCommuteStateEalry(empNo); // commute_state 업데이트
						}
					}

				}

			}else {
				result = 2; //이미 퇴근 기록이 있움
			}
		}
		return result;
	}

	@RequestMapping("/commute/statistics")
	public String statistics(HttpSession session, @RequestParam(required = false) String date
			,Model model) {
		int empNo = (int)session.getAttribute("empNo");
		logger.info("근태 통계 페이지 파라미터, date={}, empNo={}", date, empNo);

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); // 사용하는 날짜 및 시간 형식에 맞게 수정

		if(date!=null && !date.isEmpty()) {
			int attendance = commuteService.selectCommuteAttendanceCount(empNo, date); //월별 출근 횟수 조회
			logger.info("월별 출근횟수 조회 결과 attendance={}", attendance);
			int late = commuteService.selectCommuteLateCount(empNo, date); //월별 지각 횟수 조회 메서드
			logger.info("월별 지각횟수 조회 결과 late={}", late);
			int ealry = commuteService.selectCommuteEarlyleaveCount(empNo, date); //월별 조퇴 횟수 조회 메서드
			logger.info("월별 조퇴횟수 조회 결과 ealry={}", ealry);
			List<Map<String, Object>> commuteList = commuteService.selectCommuteMonthByEmpNo(empNo, date); //해당 사원 월별 근퇴 전체 조회 메서드
			logger.info("월별 근태기록 전체 조회 결과 commuteList.size={}", commuteList.size());

			long totalHours = 0;
			long totalMinutes = 0;


			for(Map<String, Object> map : commuteList) {
				// 시간 추출
				String workInStr = (String) map.get("WORK_IN");
				String workOutStr = (String) map.get("WORK_OUT");

				LocalDateTime workInTime = LocalDateTime.parse(workInStr, formatter);
				LocalDateTime workOutTime = LocalDateTime.parse(workOutStr, formatter);

				// 시간 정보만 추출 (초 제외)
				LocalTime workInTimeOnly = workInTime.toLocalTime().withSecond(0);
				LocalTime workOutTimeOnly = workOutTime.toLocalTime().withSecond(0);

				// 근무 시간 계산
				Duration workDuration = Duration.between(workInTime, workOutTime);
				long workHours = workDuration.toHours();
				long workMinutes = (workDuration.toMinutes() % 60);

				totalHours += workHours; // 월 총 근무시간
				totalMinutes += workDuration.toMinutes(); // 월 총 근무시간 (분 단위)

				// 날짜에서 년도, 월, 일, 요일 추출
				LocalDate workDate = workInTime.toLocalDate();
				int year = workDate.getYear();
				int month = workDate.getMonthValue();
				int day = workDate.getDayOfMonth();
				String dayOfWeek = workDate.getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.KOREAN); // 요일 계산 (한글로)

				//근태상태 조회 
				BigDecimal stateBig = (BigDecimal)map.get("COMMUTE_STATE");
				int state = stateBig.intValue();
				String stateResult = "";

				if(state==0) {
					stateResult = "정상근무";
				}else if(state==1) {
					stateResult = "지각";
				}else if(state==2) {
					stateResult = "조퇴" ;
				}else if(state==3) {
					stateResult = "지각 + 조퇴";
				}

				map.put("state", stateResult);
				map.put("workDate", String.format("%04d-%02d-%02d (%s)", year, month, day, dayOfWeek)); // 년도, 월, 일, 요일 저장
				map.put("workInTime", workInTimeOnly); //출근 시간
				map.put("workOutTime", workOutTimeOnly); //퇴근 시간
				map.put("workTime", String.format("%02d:%02d", workHours, workMinutes)); // 근무 시간


			}

			model.addAttribute("commuteList", commuteList);
			model.addAttribute("attendance", attendance);
			model.addAttribute("late", late);
			model.addAttribute("ealry", ealry);
			model.addAttribute("TotalWorkTimeOfMonth", totalHours); //월 총 근무 시간

		}

		return "commute/statistics";
	}

	@GetMapping("/commute/exportToExcel")
	public void exportToExcel(HttpServletResponse response, HttpSession session) throws IOException {
		int empNo = (int)session.getAttribute("empNo");

		logger.info("엑셀로 저장 파라미터, empNo={}", empNo);

		List<CommuteVO> commuteList = commuteService.selectCommuteByEmpNo(empNo); // 근태 출퇴근 정보를 DB에서 가져옴

		// Create a new Excel workbook and sheet
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("개인별 근태기록");

		// 컬럼 셋팅
		Row headerRow = sheet.createRow(0);
		headerRow.createCell(0).setCellValue("사원번호");
		headerRow.createCell(1).setCellValue("출근 시간");
		headerRow.createCell(2).setCellValue("퇴근 시간");
		headerRow.createCell(3).setCellValue("근태 상태");

		// Populate data rows
		int rowNum = 1;
		for (CommuteVO commute : commuteList) {
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(commute.getEmpNo());
			row.createCell(1).setCellValue(commute.getWorkIn()); // 출근 시간 필드에 따라 변경
			row.createCell(2).setCellValue(commute.getWorkOut()); // 퇴근 시간 필드에 따라 변경
			row.createCell(3).setCellValue(commute.getCommuteState()); // 근태 상태 필드에 따라 변경
		}

		// Set response headers
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=" + empNo + "_commute_data.xlsx");

		// Write workbook data to response output stream
		OutputStream outputStream = response.getOutputStream();
		workbook.write(outputStream);
		workbook.close();
		outputStream.close();
	}


	@PostMapping("/commute/importFromExcel")
	public String importFromExcel(@RequestParam("file") MultipartFile file) throws IOException {

		// 원본 파일명이 .xlsx로 끝나지 않으면 
		if (!file.getOriginalFilename().endsWith(".xlsx")) {
			return "redirect:/commute/status";
		}

		// Create a new Excel workbook from the uploaded file
		Workbook workbook = new XSSFWorkbook(file.getInputStream());
		Sheet sheet = workbook.getSheetAt(0); // Assuming the data is in the first sheet

		// Iterate through rows and insert data into the database
		for (Row row : sheet) {
			// Skip the header row
			if (row.getRowNum() == 0) {
				continue;
			}

			CommuteVO commute = new CommuteVO();
			commute.setEmpNo((int) row.getCell(0).getNumericCellValue());
			commute.setWorkIn(row.getCell(1).getStringCellValue());
			commute.setWorkOut(row.getCell(2).getStringCellValue());
			commute.setCommuteState((int) row.getCell(3).getNumericCellValue());

			commuteService.insertWorkIn((int) row.getCell(0).getNumericCellValue()); // DB에 데이터 입력

		}

		workbook.close();
		return "redirect:/commute/status?importSuccess=Data imported successfully";
	}
	
	

	

	//--------------------------ADMIN------------------------

	@RequestMapping("/admin/commute/allCommute")
	public String allCommute(@ModelAttribute SearchCommuteVO searchCommuteVo, Model model) {
		logger.info("관리자 - 전사원 근태 현황, 파라미터 searchCommuteVo={}", searchCommuteVo);

		List<DeptVO> deptList = deptService.selectAllDept();
		logger.info("관리자 - 부서 전체 조회 deptList.size={}", deptList.size());

		// 페이징처리
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchCommuteVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(20);

		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchCommuteVo.setRecordCountPerPage(20);
		searchCommuteVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());


		int attendance = commuteService.selectAllCommuteAttendanceCount(searchCommuteVo); //전사원 출근 횟수 조회
		logger.info("월별 출근횟수 조회 결과 attendance={}", attendance);
		int late = commuteService.selectAllCommuteLateCount(searchCommuteVo); //전사원 지각 횟수 조회 메서드
		logger.info("월별 지각횟수 조회 결과 late={}", late);
		int ealry = commuteService.selectAllCommuteEalryLeaveCount(searchCommuteVo); //월별 조퇴 횟수 조회 메서드
		logger.info("월별 조퇴횟수 조회 결과 ealry={}", ealry);

		List<Map<String, Object>> commuteList = commuteService.selectAllCommute(searchCommuteVo);
		logger.info("관리자 - 전사원 근태 기록 조회 commuteList.size={}", commuteList.size());

		int totalRecord = commuteService.getAllCommuteTotalCount(searchCommuteVo);
		logger.info("관리자 - 총 레코드 갯수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		// 페이징처리

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); // 사용하는 날짜 및 시간 형식에 맞게 수정

		//

		long totalHours = 0;
		long totalMinutes = 0;

		for(Map<String, Object> map : commuteList) {
			// 시간 추출
			String workInStr = (String) map.get("WORK_IN");
			String workOutStr = (String) map.get("WORK_OUT");


			if (workOutStr != null) {
				LocalDateTime workInTime = LocalDateTime.parse(workInStr, formatter);
				LocalDateTime workOutTime = LocalDateTime.parse(workOutStr, formatter);

				// 시간 정보만 추출 (초 제외)
				LocalTime workInTimeOnly = workInTime.toLocalTime().withSecond(0);
				LocalTime workOutTimeOnly = workOutTime.toLocalTime().withSecond(0);

				// 근무 시간 계산
				Duration workDuration = Duration.between(workInTime, workOutTime);
				long workHours = workDuration.toHours();
				long workMinutes = (workDuration.toMinutes() % 60);

				totalHours += workHours; // 월 총 근무시간
				totalMinutes += workDuration.toMinutes(); // 월 총 근무시간 (분 단위)

				// 날짜에서 년도, 월, 일, 요일 추출
				LocalDate workDate = workInTime.toLocalDate();
				int year = workDate.getYear();
				int month = workDate.getMonthValue();
				int day = workDate.getDayOfMonth();
				String dayOfWeek = workDate.getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.KOREAN); // 요일 계산 (한글로)

				//근태상태 조회 
				BigDecimal stateBig = (BigDecimal)map.get("COMMUTE_STATE");
				int state = stateBig.intValue();
				String stateResult = "";

				if(state==0) {
					stateResult = "정상근무";
				}else if(state==1) {
					stateResult = "지각";
				}else if(state==2) {
					stateResult = "조퇴" ;
				}else if(state==3) {
					stateResult = "지각 + 조퇴";
				}

				map.put("state", stateResult);
				map.put("workDate", String.format("%04d-%02d-%02d (%s)", year, month, day, dayOfWeek)); // 년도, 월, 일, 요일 저장
				map.put("workInTime", workInTimeOnly); //출근 시간
				map.put("workOutTime", workOutTimeOnly); //퇴근 시간
				map.put("workTime", String.format("%02d:%02d", workHours, workMinutes)); // 근무 시간

			}else {
				LocalDateTime workInTime = LocalDateTime.parse(workInStr, formatter);

				// 시간 정보만 추출 (초 제외)
				LocalTime workInTimeOnly = workInTime.toLocalTime().withSecond(0);


				// 날짜에서 년도, 월, 일, 요일 추출
				LocalDate workDate = workInTime.toLocalDate();
				int year = workDate.getYear();
				int month = workDate.getMonthValue();
				int day = workDate.getDayOfMonth();
				String dayOfWeek = workDate.getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.KOREAN); // 요일 계산 (한글로)

				//근태상태 조회 
				BigDecimal stateBig = (BigDecimal)map.get("COMMUTE_STATE");
				int state = stateBig.intValue();
				String stateResult = "";

				if(state==0) {
					stateResult = "정상근무";
				}else if(state==1) {
					stateResult = "지각";
				}else if(state==2) {
					stateResult = "조퇴" ;
				}else if(state==3) {
					stateResult = "지각 + 조퇴";
				}

				map.put("state", stateResult);
				map.put("workDate", String.format("%04d-%02d-%02d (%s)", year, month, day, dayOfWeek)); // 년도, 월, 일, 요일 저장
				map.put("workInTime", workInTimeOnly); //출근 시간
				map.put("workOutTime", "미퇴근"); //퇴근 시간
				map.put("workTime", ""); // 근무 시간
			}

		}

		model.addAttribute("commuteList", commuteList);
		model.addAttribute("attendance", attendance); // 출근 횟수
		model.addAttribute("late", late); // 지각 횟수
		model.addAttribute("ealry", ealry); // 조퇴 횟수
		model.addAttribute("TotalWorkTimeOfMonth", totalHours); //전사원 총 근무 시간

		//
		model.addAttribute("commuteList", commuteList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("pagingInfo", pagingInfo); //페이징 처리
		model.addAttribute("totalRecord", totalRecord); //총 레코드 갯수


		return "admin/commute/allCommute";
	}






}

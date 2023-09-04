package com.ez.gw.calendar.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.ez.gw.calendar.model.CalendarService;
import com.ez.gw.calendar.model.CalendarVO;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.employee.model.EmployeeVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/calendar")
public class CalendarController {
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	private final CalendarService calendarService;
	private final EmployeeService empService;
	
	
	@GetMapping("/addCalendar")
	public String get_schedule() {
		logger.info("일정등록 화면 보여주기");
		return "calendar/addCalendar";
	}
	
	@PostMapping("/addCalendar")
	public String post_schedule(@ModelAttribute CalendarVO calVo, HttpSession session) {
		//1
		int empNo = (int)session.getAttribute("empNo");
		logger.info("일정 등록 파라미터 calVo = {}, empNo={}", calVo, empNo);
		
		String getbegindate = calVo.getBegindate();
		String getenddate = calVo.getEnddate();
		String begindate = "", begintime = "";
		String enddate = "", endtime = "";
		String alldayFlag = "";
		if(getbegindate!=null && !getbegindate.isEmpty()) {
			begindate = getbegindate.substring(0,10);
			begintime = getbegindate.substring(11);
			logger.info("begindate={}, begintime={}", begindate, begintime);
			
		}
		
		if(getenddate !=null && !getenddate.isEmpty()) {
			enddate = getenddate.substring(0,10);
			endtime = getenddate.substring(11);
		}
		
		alldayFlag = calVo.getAlldayFlag();
		
		if(alldayFlag==null || alldayFlag.isEmpty()) {
			alldayFlag = "N";
		}else {
			alldayFlag = "Y";
			begintime = "00";
			endtime = "24";
		}
		
		calVo.setBegindate(begindate);
		calVo.setBegintime(begintime);
		calVo.setEnddate(enddate);
		calVo.setEndtime(endtime);
		calVo.setEmpNo(empNo);
		
		calVo.setAlldayFlag(alldayFlag);
		
		
		logger.info("vo setting 후 파라미터 calVo = {}", calVo);
		
		//2
		int cnt = calendarService.insertCalendar(calVo);
		logger.info("일정 등록 결과, cnt = {}", cnt);
		
		//3
		//4
		return "redirect:/calendar/fullCalendar";
	}
	
	
	
	@RequestMapping("/fullCalendar")
	public ModelAndView getCalendarList(ModelAndView mv, HttpServletRequest request, HttpSession session) {
		int empNo = (int)session.getAttribute("empNo");
		logger.info("내 스케줄 보기, 파라미터 empNo={}", empNo);
		String viewpage="calendar/fullCalendar";
		List<CalendarVO> calendarList=null;
		
		try {
			calendarList = calendarService.calendarList(empNo);
			request.setAttribute("calendarList", calendarList);
			logger.info("calendarList.size={}", calendarList.size());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping("/DeptCalendar")
	public ModelAndView deptNoCalendar(ModelAndView mv, HttpServletRequest request, HttpSession session) {
		//
		int empNo = (int)session.getAttribute("empNo");
		EmployeeVO emp = empService.selectByEmpNo(empNo);
		int deptNo = emp.getDeptNo();
		logger.info("부서 전체 캘린더 조회, 임원 사원번호 empNo={}, 부서번호={}", empNo, deptNo);
		String viewpage="calendar/DeptCalendar";
		
		//
		List<Map<String, Object>> deptCalendarList = null;
		try {
			deptCalendarList = calendarService.calendarAllDept(deptNo);
			logger.info("부서 전체 일정, list.size()={}", deptCalendarList.size());
			request.setAttribute("map", deptCalendarList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		//
		mv.setViewName(viewpage);
		//
		return mv;
	}
	
	@RequestMapping("/DetailCalendar")
	@ResponseBody
	public ResponseEntity<CalendarVO> detail(@RequestParam(defaultValue = "0")int calendarNo,Model model ) {
		//1
		logger.info("캘린더 디테일, 파라미터 calendarNo={}", calendarNo);
		
		//2
		CalendarVO cal = calendarService.selectCalendarByNo(calendarNo);
		logger.info("캘린더 정보 cal = {}", cal);
		
		//3
		model.addAttribute("result", cal);
		//4
		return new ResponseEntity<>(cal, HttpStatus.OK);
	}
	
	@RequestMapping("/editCalendar")
	public String edit(@RequestParam(defaultValue = "0")int calendarNo, HttpSession session, @ModelAttribute CalendarVO calendarVo, Model model) {
		//1
		int empNo = (int)session.getAttribute("empNo");
		logger.info("수정 페이지, 수정된 값 calendarVo={}, empNo={}", calendarVo, empNo);
		
		String getbegindate = calendarVo.getBegindate();
		String getenddate = calendarVo.getEnddate();
		String begindate = "", begintime = "";
		String enddate = "", endtime = "";
		String alldayFlag = "";
		if(getbegindate!=null && !getbegindate.isEmpty()) {
			begindate = getbegindate.substring(0,10);
			begintime = getbegindate.substring(11);
			logger.info("begindate={}, begintime={}", begindate, begintime);
			
		}
		
		if(getenddate !=null && !getenddate.isEmpty()) {
			enddate = getenddate.substring(0,10);
			endtime = getenddate.substring(11);
		}
		
		alldayFlag = calendarVo.getAlldayFlag();
		
		if(alldayFlag==null || alldayFlag.isEmpty()) {
			alldayFlag = "N";
		}else {
			alldayFlag = "Y";
			begintime = "00";
			endtime = "24";
		}
		
		calendarVo.setBegindate(begindate);
		calendarVo.setBegintime(begintime);
		calendarVo.setEnddate(enddate);
		calendarVo.setEndtime(endtime);
		calendarVo.setEmpNo(empNo);
		
		calendarVo.setAlldayFlag(alldayFlag);
		//2
		int cnt = calendarService.updateCalendar(calendarVo);
		logger.info("일정 수정 결과, cnt={}", cnt);
		
		String msg = "수정 실패", url = "/calendar/fullCalendar";
		if(cnt>0) {
			msg = "수정 성공했습니다.";
		}
		//3
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	@RequestMapping("/delCalendar")
	public String delete_cal(@RequestParam(defaultValue = "0")int calendarNo) {
		//
		logger.info("일정 삭제, 파라미터 calendarNo={}", calendarNo);
		
		//
		int cnt = calendarService.deleteCalendar(calendarNo);
		logger.info("삭제 결과, cnt = {}", cnt);
		
		//
		//
		return "redirect:/calendar/fullCalendar";
	}
}

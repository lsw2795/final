package com.ez.gw.commute.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ez.gw.commute.model.CommuteService;
import com.ez.gw.commute.model.CommuteVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/commute")
public class CommuteController {
	private static final Logger logger = LoggerFactory.getLogger(CommuteController.class);
	private final CommuteService commuteService;

	@GetMapping("/status")
	public ModelAndView CommutingStatus(ModelAndView mv, HttpServletRequest request) {
		int empNo = (int) request.getSession().getAttribute("empNo");

		logger.info("근태관리 - 출/퇴근 현황 페이지");

		String viewpage = "commute/commutingStatus";

        List<CommuteVO> list = commuteService.selectCommuteByEmpNo(empNo);
        logger.info("근태관리 - 출/퇴근 데이터 조회 결과 list.size={}", list.size());
        
        List<Map<String, Object>> events = new ArrayList<>();
        SimpleDateFormat isoDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
        SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        for (CommuteVO vo : list) {
            Map<String, Object> event = new HashMap<>();
            event.put("title", Integer.toString(vo.getCommuteState()));
            
            if (vo.getWorkIn() != null) {
                try {
                    // 입력 날짜 형식으로 파싱 후, 다시 출력 날짜 형식으로 변환
                    Date parsedWorkIn = inputDateFormat.parse(vo.getWorkIn());
                    event.put("start", isoDateFormat.format(parsedWorkIn));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
            if (vo.getWorkOut() != null) {
                try {
                    // 입력 날짜 형식으로 파싱 후, 다시 출력 날짜 형식으로 변환
                    Date parsedWorkOut = inputDateFormat.parse(vo.getWorkOut());
                    event.put("end", isoDateFormat.format(parsedWorkOut));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
            
            events.add(event);
        }

        mv.addObject("calendarList", events);
        mv.setViewName(viewpage);
        return mv;
    }
	
	
	@RequestMapping("/workIn")
	@ResponseBody
	public int ajaxWorkIn(@RequestParam(defaultValue = "0") int empNo) {
		//1
		logger.info("ajax 사원 번호={}", empNo);
		//2
		int cnt = commuteService.insertWorkIn(empNo);
		//3
		//4
		return cnt;
	}
		
	






}

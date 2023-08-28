package com.ez.gw.commute.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String CommutingStatus(HttpServletRequest request, Model model) {
		int empNo = (int) request.getSession().getAttribute("empNo");

		logger.info("근태관리 - 출/퇴근 현황 페이지");

		//String viewpage = "commute/commutingStatus";

        List<CommuteVO> list = commuteService.selectCommuteByEmpNo(empNo);
        logger.info("근태관리 - 출/퇴근 데이터 조회 결과 list.size={}", list.size());
        
        
        model.addAttribute("list", list);
        return "commute/commutingStatus";
    }
	
	
	@RequestMapping("/workIn")
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
	
	@RequestMapping("/workOut")
	@ResponseBody
	public int ajaxWorkOut(@RequestParam(defaultValue = "0") int empNo) {
		//1
		logger.info("ajax 사원 번호={}", empNo);
		
		//출근기록 있는지 여부 조회 없으면 0 있으면 1
		int count = commuteService.selectIsWorkIn(empNo); // 출근 기록 없으면 0, 출근 기록 있으면 1 리턴
		logger.info("퇴근 기록 존재 여부 count={}", count);
		
		int result = 0; //ajax로 리턴해줄 int 값 초기화, 0:퇴근 처리 실패 1:퇴근 처리 성공
		
		//출근 기록이 있으면
		if(count>0) { //출근 기록 있을때만 insert
			int count2 = commuteService.selectIsWorkOut(empNo); //퇴근기록 조회
			//출근기록이 있는데 퇴근기록이 없을때만 퇴근 처리
			if(count2<1) {
				int cnt = commuteService.updateWorkOut(empNo);
				logger.info("퇴근 버튼 클릭시 인서트 결과 cnt={}", cnt);
				result = 1; //퇴근 처리 완료
				
				if (cnt > 0) {
	                LocalDateTime currentTime = LocalDateTime.now();
	                LocalDateTime sixPM = currentTime.withHour(18).withMinute(0).withSecond(0).withNano(0);
	                if (currentTime.isBefore(sixPM)) { // 오후 6시 이전에 퇴근한 경우에만 commute_state 업데이트
	                    int result2 = commuteService.updateCommuteStateEalry(empNo); // commute_state 업데이트
	                    if(result2>0) {
	                    	return 3; // 오후 6시 이전에 퇴근할 경우 조퇴 
	                    }
	                }
	                
				}
				
			}else {
				result = 2; //이미 퇴근 기록이 있움
			}
		}
		return result;
	}
	
	@RequestMapping("/statistics")
	public String statistics() {
		logger.info("부서별 근태 통계 페이지");
		
		
		return "commute/statistics";
	}


}

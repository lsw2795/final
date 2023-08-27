package com.ez.gw.commute.model;

import java.util.List;
import java.util.Map;

public interface CommuteService {
	List<CommuteVO> selectCommuteByEmpNo(int empNo); //사원번호로 해당 사원의 출퇴근 기록 전체 조회 메서드
	int insertWorkIn(int empNo); //출근 시간 인서트
	int updateWorkOut(int empNo); //퇴근 시간 업데이트
	int selectIsWorkIn(int empNo); //당일 출근 기록있는지 확인 메서드
	int selectIsWorkOut(int empNo); //당일 퇴근 기록있는지 확인 메서드
	
}

package com.ez.gw.commute.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface CommuteService {
	List<CommuteVO> selectCommuteByEmpNo(int empNo); //사원번호로 해당 사원의 출퇴근 기록 전체 조회 메서드
	int insertWorkIn(int empNo); //출근 시간 인서트
	int updateWorkOut(int empNo); //퇴근 시간 업데이트
	int selectIsWorkIn(int empNo); //당일 출근 기록있는지 확인 메서드
	int selectIsWorkOut(int empNo); //당일 퇴근 기록있는지 확인 메서드
	
	int updateCommuteState(CommuteVO vo); // 오전 9시 이후로 출근하면 근태 상태가 1 지각으로 바뀌는 메서드
	int updateCommuteStateEalry(int empNo); //오후 6시 이전에 퇴근하면 근태 상태가 5 조퇴로 바뀌는 메서드
	int selectLateState(int empNo); //지각인지 현재 상태 조회하는 메서드
	int updateCommuteStateTotal(int empNo); // 지각 + 조퇴면 3으로 바뀌는 메서드
	
	int selectCommuteLateCount(@Param("empNo")int empNo, @Param("date")String date); //월별 지각 횟수 조회 메서드
	int selectCommuteEarlyleaveCount(@Param("empNo")int empNo, @Param("date")String date); //월별 조퇴 횟수 조회 메서드
	int selectCommuteAttendanceCount(@Param("empNo")int empNo, @Param("date")String date); //월별 출근 횟수 조회 메서드
	
	List<Map<String, Object>> selectCommuteMonthByEmpNo(@Param("empNo")int empNo, @Param("date")String date); //해당 사원 월별 근태 기록 전체 조회
	
	//------------admin-------------
	List<Map<String, Object>> selectAllCommute(); // 전사원 근태 조회
}

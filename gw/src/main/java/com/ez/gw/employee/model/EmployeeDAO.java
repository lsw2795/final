package com.ez.gw.employee.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.gw.common.SearchVO;

@Mapper
public interface EmployeeDAO {
	EmployeeVO selectByEmpNo(int empNo); //사원번호로 사원정보 조회 메서드
	List<Map<String, Object>> selectAllEmp();
	String selectPwd(int empNo); //로그인 성공여부
	String selctAuthority(int empNo); //관리자 로그인여부
	int getNextSequenceValue(); // EMPLOYEE_SEQ.nextval을 얻어오는 메서드(DAO만 등록)
	int insertEmp(EmployeeVO vo); //관리자 - 사원 등록 메서드
	List<Map<String, Object>> selectSearchEmp(SearchVO searchVo);//조직도 - 사원 검색 메서드
	int updateFindPwd(EmployeeVO empVo) throws Exception; //사원 비번 찾기
	Map<String, Object> selectEmpByEmpNo(int empNo); //사원 정보 상세보기 메서드
	int updateEmpInfo(EmployeeVO empVo); //사원 - 사원정보 수정하기
	int updateEmpPwd(EmployeeVO empVo); //사원 - 비밀번호 수정하기
	int updateEmpRetiredate(EmployeeVO empVo);// 관리자 - 사원 퇴사일자 업데이트
	int getTotalRecord(SearchVO searchVo); //사원, 관리자 전체 레코드 조회 (organizationChartView 이용)
	List<Map<String, Object>> selectSerachEmp2(SearchVO searchVo); //관리자 사원 전체 조회 메서드(페이징처리)
	int updateEmpAdmin(EmployeeVO empVo); //관리자 - 사원정보 수정하기
	int gTRSearchEmp(SearchVO searchVo); //조직도 - 사원 검색 레코드 조회 (organizationChartView 이용)
	int selectEmpByName(String name);
	String selectNameByEmpNo(int empNo);
	String selectEmail(int empNo); //비밀번호 찾을때 이메일 확인
	int countManager(String name);
	int findInfoCheck(EmployeeVO empVo); //비밀번호 찾을때 이메일,사원번호 개수 확인
	int findPwd(EmployeeVO empVo); //비번 찾기 비번 변경
	List<Map<String, Object>> selEmpExportExcel(); //사원목록 엑셀로 저장하기용
	List<Integer> selectRetire(); //퇴사자
	Integer selectByClubNo(int empNo); 
	List<Map<String, Object>> selEmpCountByDeptName(int year); //부서포함 년도별 입사자 수
	int createClub(EmployeeVO empVo); //개설자 동호회 번호 넣어주기
	
	int selectRetireCount(); //퇴사자수
	int selectAllEmployeeCount(); //총 사원수
	int selectAvgSalary(); //평균연봉
	int selectHiredateCount(); //올해 입사자수
	
}


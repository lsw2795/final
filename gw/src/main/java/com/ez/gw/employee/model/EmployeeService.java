package com.ez.gw.employee.model;

import java.util.List;
import java.util.Map;

import com.ez.gw.common.SearchVO;

public interface EmployeeService {
	//로그인 처리 관련 상수
	int LOGIN_OK=1; //로그인 성공
	int PWD_DISAGREE=2; //비밀번호 불일치
	int	EMPNO_NONE=3; //존재하지 않는 사원번호
	
	//관리자 권한 여부 상수
	int IS_ADMIN=1; //관리자 권한 있음
	int NOT_ADMIN=2; //관리자 권한 없음
	int	ADMIN_NONE=3; //해당 관리자 없음
	
	//동회회비 결제 유무
	int CLUB_PAID=1;
	int CLUB_NOT_PAID=2;
	
	EmployeeVO selectByEmpNo(int empNo); //사원번호로 사원정보 조회 메서드
	List<Map<String, Object>> selectAllEmp();
	int loginCheck(String pwd,int empNo); //로그인 성공여부
	String selctAuthority(int empNo); //관리자 로그인 여부
	int insertEmp(EmployeeVO vo); //관리자 - 사원 등록 메서드
	List<Map<String, Object>> selectSearchEmp(SearchVO searchVo);//조직도 - 사원 검색 메서드
	void sendEmail(EmployeeVO empVo, String div); //비번찾기 메일 보내기
	//void findPwd(HttpServletResponse response, EmployeeVO empVo) throws Exception; //비번찾기
	Map<String, Object> selectEmpByEmpNo(int empNo); //사원 정보 상세보기 메서드
	int updateEmpInfo(EmployeeVO empVo); //사원 - 사원정보 수정하기
	int updateEmpPwd(EmployeeVO empVo); //사원 - 비밀번호 수정하기
	int updateEmpRetiredate(EmployeeVO empVo);// 관리자 - 사원 퇴사일자 업데이트
	int getTotalRecord(SearchVO searchVo); //관리자, 사원 - 전체 목록 건수 (organizationChartView 이용)
	List<Map<String, Object>> selectSerachEmp2(SearchVO searchVo); //관리자 사원 전체 조회 메서드(페이징처리)
	String selectPwd(int empNo); //비밀번호 확인 메서드
	int updateEmpAdmin(EmployeeVO empVo); //관리자 - 사원정보 수정하기
	List<EmployeeVO> selectByReferEmpNo(String confirmDocumentNo); //참조자 정보 조회 
	int gTRSearchEmp(SearchVO searchVo); //조직도 - 사원 검색 레코드 조회 (organizationChartView 이용)
	int selectEmpByName(String name);
	String selectNameByEmpNo(int empNo);
	int emailCheck(String email, int empNo); //비번찾기 메일 확인
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

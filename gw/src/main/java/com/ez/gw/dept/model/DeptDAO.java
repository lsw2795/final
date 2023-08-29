package com.ez.gw.dept.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeptDAO {
	DeptVO deptByNo(int empNo);
	List<DeptVO> selectAllDept();
	List<Map<String, Object>> selectEmpByDeptNo(int deptVo);
	List<DeptAllVO> selectAllDept2(DeptVO deptVo);
	int insertDept(DeptVO deptVo); //부서 추가
	List<Map<String, Object>> selectManager(); //부서장 자격 임직원 조회
	int checkDeptName(String name); //부서 이름 중복확인
	int updateDept(DeptVO deptVo); //부서 수정
	int deptEmpCount(int deptNo); //해당 부서 사원수 조회
	int deleteDept(int deptNo); //부서 삭제
}

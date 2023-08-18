package com.ez.gw.employee.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ez.gw.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements EmployeeService{
	private final EmployeeDAO employeeDao;

	@Override
	public EmployeeVO selectByEmpNo(int empNo) {
		return employeeDao.selectByEmpNo(empNo);
	}

	@Override
	public int loginCheck(String pwd, int empNo) {
		String dbPwd=employeeDao.selectPwd(empNo);
		int result=0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=EmployeeService.EMPNO_NONE;
		}else {
			if(dbPwd.equals(pwd)) {
				result=EmployeeService.LOGIN_OK;			
			}else {
				result=EmployeeService.PWD_DISAGREE;								
			}
		}
		
		return result;
	}

	@Override
	public String selctAuthority(int empNo) {
		return employeeDao.selctAuthority(empNo);
	}
	
	@Override
	public List<EmployeeVO> selectAllEmp() {
		return employeeDao.selectAllEmp();
	}

	@Override
	public int insertEmp(EmployeeVO vo) {
		return employeeDao.insertEmp(vo);
	}

	@Override
	public List<Map<String, Object>> selectSearchEmp(SearchVO searchVo) {
		return employeeDao.selectSearchEmp(searchVo);
	}

	@Override
	public Map<String, Object> selectEmpByEmpNo(int empNo) {
		return employeeDao.selectEmpByEmpNo(empNo);
	}



}

package com.ez.gw.employee.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ez.gw.common.SearchVO;
import com.ez.gw.refer.model.ReferDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements EmployeeService{
	private static final Logger logger = LoggerFactory.getLogger(EmployeeServiceImpl.class);
	private final EmployeeDAO employeeDao;
	private final ReferDAO referDao;
	private final PasswordEncoder passwordEncoder;

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
			if(passwordEncoder.matches(pwd, dbPwd)) {
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
	public List<Map<String, Object>> selectAllEmp() {
		return employeeDao.selectAllEmp();
	}

	@Override
	public int insertEmp(EmployeeVO vo) {
		int sequenceValue = employeeDao.getNextSequenceValue();
		vo.generateCombinedEmpNo(sequenceValue);
		return employeeDao.insertEmp(vo);
	}

	@Override
	public List<EmployeeVO> selectByReferEmpNo(String confirmDocumentNo) {
		List<Integer> referList = referDao.selectEmpNoByConfirmNo(confirmDocumentNo);
		logger.info("결재문서에 대한 참조자 referList={}",referList);
		
		List<EmployeeVO> list = new ArrayList<>();
		for(int i=0; i<referList.size(); i++) {
			EmployeeVO vo = employeeDao.selectByEmpNo(referList.get(i));
			logger.info("참조자에 대한 조회 vo={}",vo);
			list.add(vo);
		}
		return list;
	}
	
	
	public List<Map<String, Object>> selectSearchEmp(SearchVO searchVo) {
		return employeeDao.selectSearchEmp(searchVo);
	}

	@Override
	public Map<String, Object> selectEmpByEmpNo(int empNo) {
		return employeeDao.selectEmpByEmpNo(empNo);
	}

	@Override
	public void sendEmail(EmployeeVO empVo, String div) {
		
	}

	@Override
	public int updateEmpInfo(EmployeeVO empVo) {
		return employeeDao.updateEmpInfo(empVo);
	}

	@Override
	public int updateEmpPwd(EmployeeVO empVo) {
		return employeeDao.updateEmpPwd(empVo);
	}


	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return employeeDao.getTotalRecord(searchVo);
	}

	@Override
	public List<Map<String, Object>> selectSerachEmp2(SearchVO searchVo) {
		return employeeDao.selectSerachEmp2(searchVo);
	}

	@Override
	public String selectPwd(int empNo) {
		return employeeDao.selectPwd(empNo);
	}

	@Override
	public int updateEmpAdmin(EmployeeVO empVo) {
		return employeeDao.updateEmpAdmin(empVo);
	}

	@Override
	public int gTRSearchEmp(SearchVO searchVo) {
		return employeeDao.gTRSearchEmp(searchVo);
	}




}





package com.ez.gw.employee.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ez.gw.common.SearchVO;
import com.ez.gw.email.EmailSender;
import com.ez.gw.refer.model.ReferDAO;

import jakarta.mail.internet.MimeMessage;
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
	public int updateEmpRetiredate(EmployeeVO empVo) {
		return employeeDao.updateEmpRetiredate(empVo);
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

	@Override
	public int selectEmpByName(String name) {
		return employeeDao.selectEmpByName(name);
	}

	@Override
	public String selectNameByEmpNo(int empNo) {
		return employeeDao.selectNameByEmpNo(empNo);
	}

	@Override
	public int emailCheck(String email, int empNo) {
		String dbEmail=employeeDao.selectEmail(empNo);
		int res=0;
		if(dbEmail==null || dbEmail.isEmpty()) {
			res=EMPNO_NONE;
		}
		
		return res;
	}

	

	public int countManager(String name) {
		return employeeDao.countManager(name);
	}

	@Override
	public int findInfoCheck(EmployeeVO empVo) {
		return employeeDao.findInfoCheck(empVo);
	}

	@Override
	public int findPwd(EmployeeVO empVo) {
		return employeeDao.findPwd(empVo);
		
	}

	@Override
	public List<Map<String, Object>> selEmpExportExcel() {
		return employeeDao.selEmpExportExcel();
	}

	@Override
	public List<Integer> selectRetire() {
		return employeeDao.selectRetire();
	}

	@Override
	public Integer selectByClubNo(int empNo) {
		return employeeDao.selectByClubNo(empNo);
	}

	@Override
	public List<Map<String, Object>> selEmpCountByDeptName(int year) {
		return employeeDao.selEmpCountByDeptName(year);
	}

	@Override
	public int createClub(EmployeeVO empVo) {
		return employeeDao.createClub(empVo);
	}

	@Override
	public int selectRetireCount() {
		return employeeDao.selectRetireCount();
	}

	@Override
	public int selectAllEmployeeCount() {
		return employeeDao.selectAllEmployeeCount();
	}

	@Override
	public int selectAvgSalary() {
		return employeeDao.selectAvgSalary();
	}

	@Override
	public int selectHiredateCount() {
		return employeeDao.selectHiredateCount();
	}



}





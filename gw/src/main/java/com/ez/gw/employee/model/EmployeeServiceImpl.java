package com.ez.gw.employee.model;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

import com.ez.gw.common.SearchVO;

import jakarta.servlet.http.HttpServletResponse;
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
	public void sendEmail(EmployeeVO empVo, String div) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "서버 이메일 주소(보내는 사람 이메일 주소)";
		String hostSMTPpwd = "서버 이메일 비번(보내는 사람 이메일 비번)";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "보내는 사람 이메일주소(받는 사람 이메일에 표시됨)";
		String fromName = "COSMOS";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "COSMOS 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += empVo.getEname() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += empVo.getPwd() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = empVo.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	

	@Override
	public void findPwd(HttpServletResponse response, EmployeeVO empVo) throws Exception {
		
	}

	@Override
	public Map<String, Object> selectEmpByEmpNo(int empNo) {
			return employeeDao.selectEmpByEmpNo(empNo);
	}

}
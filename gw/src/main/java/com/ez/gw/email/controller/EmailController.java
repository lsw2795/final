package com.ez.gw.email.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.email.EmailSender;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.employee.model.EmployeeVO;

import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/login")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	private final EmployeeService empService;
	//주입받기
	private final EmailSender emailSender;
	
	@RequestMapping("/empForgotPwd")
	public void email() {
		logger.info("사원 비밀번호 찾기 화면");
	}
	
	@RequestMapping("/sendEmail")
	public String sendEmail(String email, @ModelAttribute EmployeeVO empVo,
			@RequestParam int empNo) {
		int receiverEmail=empService.emailCheck(email, empNo);
		String str = emailSender.getTempPassword();
		empService.updateEmpPwd(empVo);
		
		
		String receiver = empVo.getEmail(); //받는 사람의 이메일 주소
		
		String subject = "COSMOS 임시 비밀번호 안내";		
		String content = "안녕하세요.^^"
						+ "COSMOS 임시 비밀번호 안내 관련 이메일입니다."
						+ "귀하의 임시비밀번호는[ "+str+" ] 입니다."
						+ "로그인 후 비밀번호 변경해주세요 ";		
		String sender = "rlacodud4456@naver.com"; //보내는 사람의 이메일 주소
											//앞에 설정한 본인의 보내는 이메일 주소
		
		
		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("메일 발송 성공!");	
		} catch (MessagingException e) {
			logger.info("메일 발송 실패 : "+e.getMessage());	
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	
	/*public Map<String, Object> findPwd(String email,int empNo){
		Map<String, Object> json = new HashMap<>();
		int pwdChk=empService.emailCheck(email, empNo);
		logger.info("이메일,사원번호 확인 pwdChk={}", pwdChk);
		
		json.put("check", pwdChk);

		return json;
	}*/
	
	@RequestMapping("/findPwd")
	@ResponseBody
	public String findPwd(@ModelAttribute EmployeeVO empVo ) {
		logger.info("empVo={}",empVo);
		return "";
	}
	
	
	
}

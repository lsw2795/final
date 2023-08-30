package com.ez.gw.email.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	private final PasswordEncoder passwordEncoder;
	//주입받기
	private final EmailSender emailSender;
	
	@GetMapping("/adminForgotPwd")
	public void ForgotPwd() {
		logger.info("관리자 비밀번호 찾기 화면");
	}
	
	@GetMapping("/empForgotPwd")
	public void email() {
		logger.info("사원 비밀번호 찾기 화면");
	}
	
	@ResponseBody
	@RequestMapping("/ajaxempForgotPwd")
	public int ajaxempForgotPwd(@ModelAttribute EmployeeVO empVo,
			@RequestParam (defaultValue = "0") int empNo, 
			@RequestParam (required = false)String email) {
		logger.info("ajax 이용 - empNo={},email={}",empNo,email);
		
		//사원번호,이메일 확인
		empService.emailCheck(email, empNo);
				
		//임시 랜덤 비번
		String str = getTempPassword();
		logger.info("임시 비번 str={}",str);
		//empVo.setPwd(passwordEncoder.encode(str));
		//empService.findPwd(empNo, email); //임시비번 update
				
		//이메일 보내기
		String receiver = email;	//받는 사람의 이메일 주소
		String subject = "COSMOS 임시 비밀번호 안내";		
		String content = "COSMOS 임시 비밀번호 안내 관련 이메일입니다."
						+ "귀하의 임시비밀번호는[ "+str+" ] 입니다."
						+ "로그인 후 비밀번호 변경해주세요.";		
		String sender = "rlacodud4456@naver.com"; //보내는 사람의 이메일 주소
				
		int result=0;
		int cnt=0;
		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("메일 발송 성공!");
				result=1;
				if(result>0) {
					empVo.setPwd(passwordEncoder.encode(str)); //임시비번 암호화
					empVo.setEmail(email);
					empVo.setEmpNo(empNo);
					cnt=empService.findPwd(empVo); //임시비번 update
					logger.info("임시 비번 update여부 cnt={}",cnt);
				}
		} catch (MessagingException e) {
			logger.info("메일 발송 실패 : "+e.getMessage());	
			e.printStackTrace();
		}
				
		return cnt;
		
	}
	
	//임시 비밀번호 발급
    public String getTempPassword(){
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
        
        String str = "";

        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
    }
	
	
}

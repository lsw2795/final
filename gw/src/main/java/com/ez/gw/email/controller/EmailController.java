package com.ez.gw.email.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.email.EmailSender;

import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/login")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	//주입받기
	private final EmailSender emailSender;
	
	@RequestMapping("/empForgotPwd")
	public void email() {
		logger.info("사원 비밀번호 찾기 화면");
	}
	
	@RequestMapping("/")
	public String sendEmail(String email) {
		String receiver = "kcy1515@gmail.com"; //받는 사람의 이메일 주소
		String subject = "COSMOS 임시 비밀번호 안내";		
		String content = "이메일 내용입니다. 감사합니다.";		
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

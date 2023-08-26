package com.ez.gw.email.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String sendEmail(String email, @ModelAttribute EmployeeVO empvo) {
		String str = getTempPassword();
		
		String receiver = empvo.getEmail(); //받는 사람의 이메일 주소
		empvo.setEmail(email);
		
		String subject = "COSMOS 임시 비밀번호 안내";		
		String content = "안녕하세요. "
						+ "COSMOS 임시 비밀번호 안내 관련 이메일입니다."
						+ "귀하의 임시비밀번호는[ "+str+" ] 입니다."
						+ "로그인 후 비밀번호 변경해주세요 ";		
		String sender = "rlacodud4456@naver.com"; //보내는 사람의 이메일 주소
											//앞에 설정한 본인의 보내는 이메일 주소
		empService.updateEmpPwd(empvo);
		
		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("메일 발송 성공!");	
		} catch (MessagingException e) {
			logger.info("메일 발송 실패 : "+e.getMessage());	
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	@GetMapping("/findPwd")
	@ResponseBody
	public Map<String, Object> findPwd(String email,int empNo){
		Map<String, Object> json = new HashMap<>();
		int pwdChk=empService.emailCheck(email, empNo);
		logger.info("이메일,사원번호 확인 pwdChk={}", pwdChk);
		
		json.put("check", pwdChk);

		return json;
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

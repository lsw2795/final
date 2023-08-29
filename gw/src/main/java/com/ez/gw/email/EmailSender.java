package com.ez.gw.email;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class EmailSender {
	private final JavaMailSender mailSender;
	
	public void sendEmail(String subject, String content, String receiver, String sender)
			throws MessagingException {
		
		MimeMessage message = mailSender.createMimeMessage(); 
		message.setSubject(subject);
		message.setText(content);
		message.setRecipient(RecipientType.TO, new InternetAddress(receiver));
		message.setFrom(new InternetAddress(sender));
		mailSender.send(message);
		
	}
	
	
	
	
}

































package kr.soft.study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

	@Autowired
	private JavaMailSender mailSender;

	public void sendResetPasswordEmail(String to, String resetLink) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(to);
		message.setSubject("비밀번호 재설정 링크");
		message.setText("비밀번호를 재설정하려면 다음 링크를 클릭하세요: " + resetLink);
		mailSender.send(message);
	}
}
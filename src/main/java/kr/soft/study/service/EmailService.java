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
		message.setSubject("��й�ȣ �缳�� ��ũ");
		message.setText("��й�ȣ�� �缳���Ϸ��� ���� ��ũ�� Ŭ���ϼ���: " + resetLink);
		mailSender.send(message);
	}
}
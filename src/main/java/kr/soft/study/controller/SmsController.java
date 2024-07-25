package kr.soft.study.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import kr.soft.study.service.MessageService;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

@Controller
public class SmsController {

	private final MessageService messageService;

	@Autowired
	public SmsController(MessageService messageService) {
		this.messageService = messageService;
	}

	/*
	 * @GetMapping("/sendSms") public String showSmsForm() { return "sendSms"; }
	 */

	@PostMapping("/sendSms")
	public String sendSms(@RequestParam("to") String to, @RequestParam("text") String text,
			@RequestParam("couponImageUrl") String couponImageUrl, Model model) {
		try {
			messageService.sendMessage(to, text, couponImageUrl);
			model.addAttribute("message", "SMS �߼� ����!");
		} catch (Exception e) {
			model.addAttribute("message", "SMS �߼� ����: " + e.getMessage());
		}
		return "sendSms";
	}

	/*
	 * @GetMapping("/sendMms") public String showMmsForm() { return "sendMms"; }
	 */

	@PostMapping("/sendMms")
	public String sendMms(@RequestParam("to") String to, @RequestParam("text") String text, Model model) {
		try {
			SingleMessageSentResponse response = messageService.sendMms(to, text, "�Ƹ޸�ī��.jpg");
			model.addAttribute("message", "MMS �߼� ����! ����: " + response);
		} catch (IOException e) {
			model.addAttribute("message", "���� ���ε� ����: " + e.getMessage());
		} catch (Exception e) {
			model.addAttribute("message", "MMS �߼� ����: " + e.getMessage());
		}
		return "sendMms";
	}

	// ���̹̽���
	@PostMapping("/sendSmishing")
	public RedirectView sendSmishing(@RequestParam("to") String phoneNumber, @RequestParam("text") String messageText,
			@RequestParam("buttonType") String buttonType) {
		String imageUrl;
		String adminText;
		if ("delivery".equals(buttonType)) {
			imageUrl = "http://211.37.179.32:8080/smishing";
			adminText = "[KB��������] �ֹ��Ͻ� ��ǰ�� ���� ���������Դϴ�.";
		} else if ("invitation".equals(buttonType)) {
			imageUrl = "http://211.37.179.32:8080/smishing";
			adminText = "[KB��������] ������ ��ȥ�Ŀ� �ͼ� �Բ� �������ּ���!";
		} else {
			throw new IllegalArgumentException("Invalid button type");
		}

		// ���� �޽��� �߼�
		messageService.sendSmishing(phoneNumber, messageText, imageUrl, adminText);

		// ���� �� �����̷�Ʈ�� �������� �����մϴ�.
		return new RedirectView("voice/smishing");
	}

	@GetMapping("/smishing")
	public void showSmishingImage(@RequestParam(value = "buttonType", required = false) String buttonType,
			Model model) {
		String imageUrl;
		if ("delivery".equals(buttonType)) {
			imageUrl = "/images/aaaa.jpg";
		} else if ("invitation".equals(buttonType)) {
			imageUrl = "/images/coffee.jpg";
		} else {
			// �⺻ �̹��� �Ǵ� ���� ó��
			imageUrl = "/images/default.jpg";
		}

	}

}
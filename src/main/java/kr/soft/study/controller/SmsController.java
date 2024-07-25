package kr.soft.study.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

}
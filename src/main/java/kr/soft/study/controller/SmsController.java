package kr.soft.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.soft.study.service.MessageService;

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
	public String sendSms(@RequestParam("to") String to, @RequestParam("text") String text, Model model) {
		try {
			messageService.sendMessage(to, text);
			model.addAttribute("message", "SMS 발송 성공!");
		} catch (Exception e) {
			model.addAttribute("message", "SMS 발송 실패: " + e.getMessage());
		}
		return "sendSms";
	}
}
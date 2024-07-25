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
			model.addAttribute("message", "SMS 발송 성공!");
		} catch (Exception e) {
			model.addAttribute("message", "SMS 발송 실패: " + e.getMessage());
		}
		return "sendSms";
	}

	/*
	 * @GetMapping("/sendMms") public String showMmsForm() { return "sendMms"; }
	 */

	@PostMapping("/sendMms")
	public String sendMms(@RequestParam("to") String to, @RequestParam("text") String text, Model model) {
		try {
			SingleMessageSentResponse response = messageService.sendMms(to, text, "아메리카노.jpg");
			model.addAttribute("message", "MMS 발송 성공! 응답: " + response);
		} catch (IOException e) {
			model.addAttribute("message", "파일 업로드 실패: " + e.getMessage());
		} catch (Exception e) {
			model.addAttribute("message", "MMS 발송 실패: " + e.getMessage());
		}
		return "sendMms";
	}

}
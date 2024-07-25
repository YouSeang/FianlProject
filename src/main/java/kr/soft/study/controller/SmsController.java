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

	// 스미싱문자
	@PostMapping("/sendSmishing")
	public RedirectView sendSmishing(@RequestParam("to") String phoneNumber, @RequestParam("text") String messageText,
			@RequestParam("buttonType") String buttonType) {
		String imageUrl;
		String adminText;
		if ("delivery".equals(buttonType)) {
			imageUrl = "http://211.37.179.32:8080/smishing";
			adminText = "[KB국민은행] 주문하신 물품이 오늘 도착예정입니다.";
		} else if ("invitation".equals(buttonType)) {
			imageUrl = "http://211.37.179.32:8080/smishing";
			adminText = "[KB국민은행] 저희의 결혼식에 와서 함께 축하해주세요!";
		} else {
			throw new IllegalArgumentException("Invalid button type");
		}

		// 문자 메시지 발송
		messageService.sendSmishing(phoneNumber, messageText, imageUrl, adminText);

		// 전송 후 리다이렉트할 페이지를 지정합니다.
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
			// 기본 이미지 또는 오류 처리
			imageUrl = "/images/default.jpg";
		}

	}

}
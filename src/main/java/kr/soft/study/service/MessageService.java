package kr.soft.study.service;

import org.springframework.stereotype.Service;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
public class MessageService {
	private final DefaultMessageService messageService;

	public MessageService() {
		// 여기에 실제 API 키와 시크릿 키를 입력하세요
		this.messageService = NurigoApp.INSTANCE.initialize("NCSCQBNH3DRTBVRV", "UH1DX4NDB5VNDU6UBQJTQI3TMGM8JBW1",
				"https://api.coolsms.co.kr");
	}

	public void sendMessage(String to, String text, String couponImageUrl) {
		// 쿠폰 이미지 URL을 포함한 메시지 작성
		String fullMessage = text + "\n쿠폰 이미지: " + couponImageUrl;

		Message message = new Message();
		message.setFrom("01030669048"); // 계정에서 등록한 발신번호
		message.setTo(to); // 수신번호
		message.setText(fullMessage); // 메시지 내용

		try {
			messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
			// 발송에 실패한 메시지 목록을 확인!
			System.out.println(exception.getFailedMessageList());
			System.out.println(exception.getMessage());
		} catch (Exception exception) {
			System.out.println(exception.getMessage());
		}
	}
}
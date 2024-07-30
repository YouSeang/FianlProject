package kr.soft.study.service;

import java.io.File;
import java.io.IOException;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.model.StorageType;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
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

		System.out.println(couponImageUrl);
		// 쿠폰 이미지 URL을 포함한 메시지 작성
		String fullMessage = text + "\n쿠폰:" + couponImageUrl;

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

	public SingleMessageSentResponse sendMms(String to, String text, String imagePath) throws IOException {
		// 이미지 파일을 읽어옵니다
		ClassPathResource resource = new ClassPathResource(imagePath);
		if (!resource.exists()) {
			throw new IOException("파일이 존재하지 않습니다: " + imagePath);
		}
		File file = resource.getFile();

		// 파일 업로드를 통해 이미지 ID를 얻어옵니다
		String imageId = this.messageService.uploadFile(file, StorageType.MMS, null);

		// MMS 메시지 설정
		Message message = new Message();
		message.setFrom("01030669048");
		message.setTo(to);
		message.setText(text);
		message.setImageId(imageId);

		// MMS 발송
		SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message));
		System.out.println(response);

		return response;
	}

	public boolean sendSmishing(String to, String text, String couponImageUrl, String adminText) {
		System.out.println(couponImageUrl);
		// 쿠폰 이미지 URL을 포함한 메시지 작성
		String fullMessage = adminText + "\n" + couponImageUrl + "\n" + text;

		Message message = new Message();
		message.setFrom("01030669048"); // 계정에서 등록한 발신번호
		message.setTo(to); // 수신번호
		message.setText(fullMessage); // 메시지 내용

		try {
			messageService.send(message);
			return true;
		} catch (NurigoMessageNotReceivedException exception) {
			// 발송에 실패한 메시지 목록을 확인
			System.out.println(exception.getFailedMessageList());
			System.out.println(exception.getMessage());
			return false;
		} catch (Exception exception) {
			System.out.println(exception.getMessage());
			return false;
		}
	}
}
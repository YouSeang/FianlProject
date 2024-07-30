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
		// ���⿡ ���� API Ű�� ��ũ�� Ű�� �Է��ϼ���
		this.messageService = NurigoApp.INSTANCE.initialize("NCSCQBNH3DRTBVRV", "UH1DX4NDB5VNDU6UBQJTQI3TMGM8JBW1",
				"https://api.coolsms.co.kr");
	}

	public void sendMessage(String to, String text, String couponImageUrl) {

		System.out.println(couponImageUrl);
		// ���� �̹��� URL�� ������ �޽��� �ۼ�
		String fullMessage = text + "\n����:" + couponImageUrl;

		Message message = new Message();
		message.setFrom("01030669048"); // �������� ����� �߽Ź�ȣ
		message.setTo(to); // ���Ź�ȣ
		message.setText(fullMessage); // �޽��� ����

		try {
			messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
			// �߼ۿ� ������ �޽��� ����� Ȯ��!
			System.out.println(exception.getFailedMessageList());
			System.out.println(exception.getMessage());
		} catch (Exception exception) {
			System.out.println(exception.getMessage());
		}
	}

	public SingleMessageSentResponse sendMms(String to, String text, String imagePath) throws IOException {
		// �̹��� ������ �о�ɴϴ�
		ClassPathResource resource = new ClassPathResource(imagePath);
		if (!resource.exists()) {
			throw new IOException("������ �������� �ʽ��ϴ�: " + imagePath);
		}
		File file = resource.getFile();

		// ���� ���ε带 ���� �̹��� ID�� ���ɴϴ�
		String imageId = this.messageService.uploadFile(file, StorageType.MMS, null);

		// MMS �޽��� ����
		Message message = new Message();
		message.setFrom("01030669048");
		message.setTo(to);
		message.setText(text);
		message.setImageId(imageId);

		// MMS �߼�
		SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message));
		System.out.println(response);

		return response;
	}

	public boolean sendSmishing(String to, String text, String couponImageUrl, String adminText) {
		System.out.println(couponImageUrl);
		// ���� �̹��� URL�� ������ �޽��� �ۼ�
		String fullMessage = adminText + "\n" + couponImageUrl + "\n" + text;

		Message message = new Message();
		message.setFrom("01030669048"); // �������� ����� �߽Ź�ȣ
		message.setTo(to); // ���Ź�ȣ
		message.setText(fullMessage); // �޽��� ����

		try {
			messageService.send(message);
			return true;
		} catch (NurigoMessageNotReceivedException exception) {
			// �߼ۿ� ������ �޽��� ����� Ȯ��
			System.out.println(exception.getFailedMessageList());
			System.out.println(exception.getMessage());
			return false;
		} catch (Exception exception) {
			System.out.println(exception.getMessage());
			return false;
		}
	}
}
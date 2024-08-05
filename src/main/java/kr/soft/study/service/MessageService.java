package kr.soft.study.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import kr.soft.study.dto.UserDto;
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
		this.messageService = NurigoApp.INSTANCE.initialize("NCSDNQBMFSNRNH46", "YJRPJUPXCTOKDLHFO4DLR1V2YHL5QC2Q",
				"https://api.coolsms.co.kr");
	}

	public void sendMessage(String to, String text, String couponImageUrl) {

		System.out.println(couponImageUrl);
		// ���� �̹��� URL�� ������ �޽��� �ۼ�
		String fullMessage = text + "\n����:" + couponImageUrl;

		Message message = new Message();
		message.setFrom("01098373995"); // �������� ����� �߽Ź�ȣ
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

	public SingleMessageSentResponse sendMms(HttpSession session, String to, String text, String imagePath)
			throws IOException {
		// �̹��� ������ �о�ɴϴ�
		ClassPathResource resource = new ClassPathResource(imagePath);
		if (!resource.exists()) {
			throw new IOException("������ �������� �ʽ��ϴ�: " + imagePath);
		}
		File file = resource.getFile();

		UserDto user = (UserDto) session.getAttribute("user");

		String userName = user.getName(); // user�� null�� �ƴ� ��쿡�� ȣ���
		System.out.println(userName);

		String fullMessage = "[KB��������]" + userName + "���� �߼��� �����Դϴ�" + "\n ���� �޽���: " + text;

		// ���� ���ε带 ���� �̹��� ID�� ���ɴϴ�
		String imageId = this.messageService.uploadFile(file, StorageType.MMS, null);

		// MMS �޽��� ����
		Message message = new Message();
		message.setFrom("01098373995");
		message.setTo(to);
		message.setText(fullMessage);
		message.setImageId(imageId);

		// MMS �߼�
		SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message));
		System.out.println(response);

		return response;
	}

	public boolean sendSmishing(String to, String text, String couponImageUrl, String adminText) {
		System.out.println(couponImageUrl);

		String fullMessage = adminText + "\n" + couponImageUrl + "\n" + text;

		Message message = new Message();
		message.setFrom("01098373995"); // �������� ����� �߽Ź�ȣ
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
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
		// ���⿡ ���� API Ű�� ��ũ�� Ű�� �Է��ϼ���
		this.messageService = NurigoApp.INSTANCE.initialize("NCSCQBNH3DRTBVRV", "UH1DX4NDB5VNDU6UBQJTQI3TMGM8JBW1",
				"https://api.coolsms.co.kr");
	}

	public void sendMessage(String to, String text, String couponImageUrl) {
		// ���� �̹��� URL�� ������ �޽��� �ۼ�
		String fullMessage = text + "\n���� �̹���: " + couponImageUrl;

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
}
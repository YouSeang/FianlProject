package kr.soft.study.service;

import java.io.FileOutputStream;
import java.util.Base64;

public class TestBase64Decode {
	public static void main(String[] args) throws Exception {
		// ���⿡ API���� ���� Base64 ���ڿ��� ��������.
		String base64Audio = "���⿡ API���� ��ȯ�� Base64 ���ڿ��� �ٿ���������";
		byte[] audioBytes = Base64.getDecoder().decode(base64Audio);

		// output.mp3�� �����ϰ�, ���������� ����Ǵ��� Ȯ���ϼ���.
		try (FileOutputStream fos = new FileOutputStream("output.mp3")) {
			fos.write(audioBytes);
		}

		System.out.println("���� ���� �Ϸ�: output.mp3");
	}
}

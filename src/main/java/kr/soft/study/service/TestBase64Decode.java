package kr.soft.study.service;

import java.io.FileOutputStream;
import java.util.Base64;

public class TestBase64Decode {
	public static void main(String[] args) throws Exception {
		// 여기에 API에서 받은 Base64 문자열을 넣으세요.
		String base64Audio = "여기에 API에서 반환된 Base64 문자열을 붙여넣으세요";
		byte[] audioBytes = Base64.getDecoder().decode(base64Audio);

		// output.mp3로 저장하고, 정상적으로 재생되는지 확인하세요.
		try (FileOutputStream fos = new FileOutputStream("output.mp3")) {
			fos.write(audioBytes);
		}

		System.out.println("파일 생성 완료: output.mp3");
	}
}

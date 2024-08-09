package kr.soft.study.service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class GoogleTextToSpeechService {

	private final String apiKey = "AIzaSyCJOpdCB0zJZ1O4Eevono66WCtATWAb-Cg"; // ���⿡ ���� API Ű�� �Է��ϼ���.

	public String synthesizeSpeech(String text, String speaker) throws Exception {
		String url = "https://texttospeech.googleapis.com/v1/text:synthesize?key=" + apiKey;

		// �ùٸ� ���� �̸��� ������ ����
		String voiceName;
		String ssmlGender;

		if (speaker.equals("mijin")) {
			voiceName = "ko-KR-Neural2-B"; // ���� ��Ҹ�
			ssmlGender = "FEMALE";
		} else {
			voiceName = "ko-KR-Neural2-C"; // ���� ��Ҹ�
			ssmlGender = "MALE";
		}

		String requestBody = "{" + "\"input\": {\"text\": \"" + text + "\"}," + "\"voice\": {"
				+ "\"languageCode\": \"ko-KR\"," + "\"name\": \"" + voiceName + "\"," + "\"ssmlGender\": \""
				+ ssmlGender + "\"" + "}," + "\"audioConfig\": {\"audioEncoding\": \"MP3\"}" + "}";

		HttpClient client = HttpClient.newHttpClient();
		HttpRequest httpRequest = HttpRequest.newBuilder().uri(URI.create(url))
				.header("Content-Type", "application/json").POST(HttpRequest.BodyPublishers.ofString(requestBody))
				.build();

		HttpResponse<String> response = client.send(httpRequest, HttpResponse.BodyHandlers.ofString());

		if (response.statusCode() == 200) {
			JSONObject jsonResponse = new JSONObject(response.body());
			String audioContent = jsonResponse.getString("audioContent");

			// Base64 ���ڿ� �α׷� Ȯ�� (����� �뵵)
			System.out.println(audioContent.substring(0, 50)); // �պκи� �α׷� ���

			return audioContent;
		} else {
			throw new Exception("Google TTS API ��û ����: " + response.body());
		}
	}
}

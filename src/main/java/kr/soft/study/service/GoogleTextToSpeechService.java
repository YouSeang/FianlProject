package kr.soft.study.service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class GoogleTextToSpeechService {

	private final String apiKey = "AIzaSyCJOpdCB0zJZ1O4Eevono66WCtATWAb-Cg"; //실제 API 키

	public String synthesizeSpeech(String text, String speaker) throws Exception {
		String url = "https://texttospeech.googleapis.com/v1/text:synthesize?key=" + apiKey;

		String voiceName;
		String ssmlGender;

		if (speaker.equals("mijin")) {
			voiceName = "ko-KR-Wavenet-A"; // 여성 목소리
			ssmlGender = "FEMALE";
		} else {
			voiceName = "ko-KR-Wavenet-C"; // 남성 목소리
			ssmlGender = "MALE";
		}

		// 추가적으로 speakingRate와 pitch 설정 (옵션)
		double speakingRate = 1.1; // 속도 설정 (기본값 1.0, 0.25 ~ 4.0)
		double pitch = 0.0; // 음높이 설정 (기본값 0.0, -20.0 ~ 20.0)

		String requestBody = "{" + "\"input\": {\"text\": \"" + text + "\"}," + "\"voice\": {"
				+ "\"languageCode\": \"ko-KR\"," + "\"name\": \"" + voiceName + "\"," + "\"ssmlGender\": \""
				+ ssmlGender + "\"" + "}," + "\"audioConfig\": {" + "\"audioEncoding\": \"MP3\"," + "\"speakingRate\": "
				+ speakingRate + "," + "\"pitch\": " + pitch + "}" + "}";

		HttpClient client = HttpClient.newHttpClient();
		HttpRequest httpRequest = HttpRequest.newBuilder().uri(URI.create(url))
				.header("Content-Type", "application/json").POST(HttpRequest.BodyPublishers.ofString(requestBody))
				.build();

		HttpResponse<String> response = client.send(httpRequest, HttpResponse.BodyHandlers.ofString());

		if (response.statusCode() == 200) {
			JSONObject jsonResponse = new JSONObject(response.body());
			String audioContent = jsonResponse.getString("audioContent");

			System.out.println(audioContent.substring(0, 50)); // 디버깅 용도

			return audioContent;
		} else {
			throw new Exception("Google TTS API 요청 실패: " + response.body());
		}
	}
}

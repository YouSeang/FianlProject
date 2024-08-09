package kr.soft.study.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import kr.soft.study.service.GoogleTextToSpeechService;

@RestController
@RequestMapping("/api")
public class TextToSpeechController {

	private final GoogleTextToSpeechService googleTextToSpeechService;

	@Autowired
	public TextToSpeechController(GoogleTextToSpeechService googleTextToSpeechService) {
		this.googleTextToSpeechService = googleTextToSpeechService;
	}

	@PostMapping("/synthesize")
	public ResponseEntity<Map<String, Object>> synthesizeSpeech(@RequestBody Map<String, String> request) {
		Map<String, Object> response = new HashMap<>();
		String text = request.get("text");
		String speaker = request.get("speaker");

		try {
			String audioContent = googleTextToSpeechService.synthesizeSpeech(text, speaker);
			response.put("audioContent", audioContent);
			return new ResponseEntity<>(response, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace(); // 서버 콘솔에 에러 로그를 출력합니다.
			response.put("error", "음성 합성 실패: " + e.getMessage());
			return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}

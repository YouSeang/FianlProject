package kr.soft.study.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.BinaryWebSocketHandler;

import kr.soft.study.command.CriminalVoiceCommand;
import kr.soft.study.service.OpenAIService;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

@Component
public class AudioWebSocketHandler extends BinaryWebSocketHandler {

    @Autowired
    private OpenAIService openAIService;
    
    @Autowired
    private CriminalVoiceCommand criminalVoiceCommand;

    @Autowired
    private ApplicationContext context;

    @Override
    protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
        File audioFile = new File("audio.webm");
        String scenarioName = null;

        try (FileOutputStream fos = new FileOutputStream(audioFile)) {
            fos.write(message.getPayload().array()); // 2. 오디오 파일 저장
            String transcript = callClovaCSR(audioFile); // 3. Clova CSR 호출

            // 변환된 텍스트를 클라이언트에 전송
            session.sendMessage(new TextMessage(transcript)); // 3. Clova CSR 결과 전송
            
            // 시나리오 이름 추출
            try {
                URI uri = session.getUri();
                if (uri != null) {
                    String query = uri.getQuery();
                    if (query != null) {
                        for (String param : query.split("&")) {
                            String[] pair = param.split("=");
                            if (pair.length == 2 && pair[0].equals("scenarioName")) {
                                scenarioName = URLDecoder.decode(pair[1], StandardCharsets.UTF_8.toString());
                                break;
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            if (scenarioName == null) {
                session.sendMessage(new TextMessage("Scenario name is missing."));
                return;
            }

            // OpenAI API를 호출하여 답변을 생성
            String chatbotResponse = openAIService.getChatbotResponse(transcript, scenarioName); // 4. OpenAI API 호출
            session.sendMessage(new TextMessage(chatbotResponse)); // 4. OpenAI API 결과 전송

            // CriminalVoiceCommand를 호출하여 데이터베이스 조회
            Map<String, Object> model = new HashMap<>();
            model.put("id", transcript); // OpenAI 응답을 ID로 사용
            model.put("scenarioName", scenarioName);
            String voiceData = criminalVoiceCommand.execute(model); // 5. CriminalVoiceCommand 실행
            session.sendMessage(new TextMessage(voiceData)); // 5. CriminalVoiceCommand 결과 전송
            
        } catch (IOException e) {
            e.printStackTrace();
            try {
                session.sendMessage(new TextMessage("오디오 처리 중 오류 발생: " + e.getMessage()));
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        } finally {
            // 처리 후 파일 삭제
            if (audioFile.exists()) {
                audioFile.delete();
            }
        }
    }

    private String callClovaCSR(File audioFile) throws IOException {
        String apiURL = "https://naveropenapi.apigw.ntruss.com/recog/v1/stt";
        String secretKey = "GJEzAf0iJ0vpYv6uHEx7dUYitK3W1mE1SIJXyqyw";
        String clientId = "4feer17ghj";
        String lang = "Kor"; // 언어 설정
        
        apiURL += "?lang=" + lang;

        HttpURLConnection connection = (HttpURLConnection) new URL(apiURL).openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/octet-stream");
        connection.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
        connection.setRequestProperty("X-NCP-APIGW-API-KEY", secretKey);
        connection.setDoOutput(true);

        try (OutputStream os = connection.getOutputStream()) {
            Files.copy(audioFile.toPath(), os);
        }

        int responseCode = connection.getResponseCode();
        if (responseCode == 200) {
            try (InputStream is = connection.getInputStream();
                 BufferedReader br = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8))) {
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    response.append(line);
                }
                return response.toString();
            }
        } else {
            try (InputStream errorStream = connection.getErrorStream();
                 BufferedReader br = new BufferedReader(new InputStreamReader(errorStream, StandardCharsets.UTF_8))) {
                StringBuilder errorResponse = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    errorResponse.append(line);
                }
                return "Error response from server: " + errorResponse.toString();
            }
        }
    }
}

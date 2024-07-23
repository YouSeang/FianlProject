package kr.soft.study.handler;

import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.BinaryWebSocketHandler;

import kr.soft.study.service.OpenAIService;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;

public class AudioWebSocketHandler extends BinaryWebSocketHandler {

    private final OpenAIService openAIService;

    public AudioWebSocketHandler(OpenAIService openAIService) {
        this.openAIService = openAIService;
    }

    @Override
    protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
        File audioFile = new File("audio.webm");
        try (FileOutputStream fos = new FileOutputStream(audioFile)) {
            fos.write(message.getPayload().array());
            String transcript = callClovaCSR(audioFile); // 음성을 텍스트로 변환

            // 변환된 텍스트를 클라이언트에 전송
            session.sendMessage(new TextMessage(transcript));

            // OpenAI API를 호출하여 답변을 생성
            String chatbotResponse = openAIService.getChatbotResponse(transcript);
            session.sendMessage(new TextMessage(chatbotResponse));

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
        String secretKey = "key";
        String clientId = "";
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
                 BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"))) {
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    response.append(line);
                }
                return response.toString();
            }
        } else {
            try (InputStream errorStream = connection.getErrorStream();
                 BufferedReader br = new BufferedReader(new InputStreamReader(errorStream, "UTF-8"))) {
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

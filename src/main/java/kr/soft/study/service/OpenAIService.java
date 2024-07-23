package kr.soft.study.service;

import okhttp3.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;

public class OpenAIService {

    private static final String API_URL = "https://api.openai.com/v1/chat/completions";
    private static final String API_KEY = "sk-proj-sIsAbbwOpF9PskExixjbT3BlbkFJCCqdEbsNHbKy1wJ7BlYp";  // 여기에 OpenAI API 키를 입력하세요
    private static final int MAX_RETRIES = 5; // 최대 재시도 횟수
    private static final long RETRY_DELAY_MS = 2000; // 재시도 사이의 지연 시간 (밀리초)

    private final OkHttpClient client;

    public OpenAIService() {
        this.client = new OkHttpClient();
    }

    public String getChatbotResponse(String userInput) throws IOException {
        String prompt = generatePrompt(userInput);

        JSONObject jsonBody = new JSONObject();
        jsonBody.put("model", "gpt-3.5-turbo");
        jsonBody.put("messages", new JSONArray().put(new JSONObject()
            .put("role", "system")
            .put("content", "You are an assistant that converts various user inputs into standardized responses."))
            .put(new JSONObject()
                .put("role", "user")
                .put("content", prompt)));
        jsonBody.put("max_tokens", 50);
        jsonBody.put("temperature", 0.5);

        RequestBody body = RequestBody.create(
            jsonBody.toString(),
            MediaType.parse("application/json; charset=utf-8")
        );

        Request request = new Request.Builder()
            .url(API_URL)
            .post(body)
            .addHeader("Authorization", "Bearer " + API_KEY)
            .build();

        return executeWithRetries(request);
    }

    private String executeWithRetries(Request request) throws IOException {
        int attempt = 0;
        while (attempt < MAX_RETRIES) {
            try (Response response = client.newCall(request).execute()) {
                if (response.isSuccessful()) {
                    JSONObject responseBody = new JSONObject(response.body().string());
                    return responseBody.getJSONArray("choices").getJSONObject(0).getJSONObject("message").getString("content").trim();
                } else if (response.code() == 429) {
                    // Too many requests, wait and retry
                    attempt++;
                    Thread.sleep(RETRY_DELAY_MS);
                } else {
                    throw new IOException("Unexpected code " + response);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                throw new IOException("Retry interrupted", e);
            }
        }
        throw new IOException("Max retries exceeded");
    }

    private String generatePrompt(String userInput) {
        return String.format(
            "다양한 요청 문구를 하나의 표준 응답으로 변환하십시오. 다음은 몇 가지 예제입니다:\n\n" +
            "입력: 도와주세요\n응답: 도움 요청\n\n" +
            "입력: 신고하면 되나요\n응답: 1\n\n" +
            "입력: 좀 도와주세요\n응답: 도움 요청\n\n" +
            "입력: 제발 좀 도와주세요\n응답: 도움 요청\n\n" +
            "입력: 헬프미\n응답: 도움 요청\n\n" +
            "입력: 도와주시겠어요?\n응답: 도움 요청\n\n" +
            "입력: 도와주시렵니까?\n응답: 도움 요청\n\n" +
            "입력: 도와주실 수 있나요?\n응답: 도움 요청\n\n" +
            "입력: 지를 좀 도와주시겠어유???\n응답: 도움 요청\n\n" +
            "입력: 도와주셈\n응답: 도움 요청\n\n" +
            "입력: 도와줄래?\n응답: 도움 요청\n\n" +
            "입력: 네 삭제했습니다\n응답: 삭제 완료\n\n" +
            "입력: 지금 했어요\n응답: 삭제 완료\n\n" +
            "입력: %s\n응답:", userInput
        );
    }
}

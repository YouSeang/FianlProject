package kr.soft.study.service;

import okhttp3.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;

public class OpenAIService {

    private static final String API_URL = "https://api.openai.com/v1/chat/completions";
    private static final String API_KEY = "sk-proj-sIsAbbwOpF9PskExixjbT3BlbkFJCCqdEbsNHbKy1wJ7BlYp";  // ���⿡ OpenAI API Ű�� �Է��ϼ���
    private static final int MAX_RETRIES = 5; // �ִ� ��õ� Ƚ��
    private static final long RETRY_DELAY_MS = 2000; // ��õ� ������ ���� �ð� (�и���)

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
            "�پ��� ��û ������ �ϳ��� ǥ�� �������� ��ȯ�Ͻʽÿ�. ������ �� ���� �����Դϴ�:\n\n" +
            "�Է�: �����ּ���\n����: ���� ��û\n\n" +
            "�Է�: �Ű��ϸ� �ǳ���\n����: 1\n\n" +
            "�Է�: �� �����ּ���\n����: ���� ��û\n\n" +
            "�Է�: ���� �� �����ּ���\n����: ���� ��û\n\n" +
            "�Է�: ������\n����: ���� ��û\n\n" +
            "�Է�: �����ֽðھ��?\n����: ���� ��û\n\n" +
            "�Է�: �����ֽ÷ƴϱ�?\n����: ���� ��û\n\n" +
            "�Է�: �����ֽ� �� �ֳ���?\n����: ���� ��û\n\n" +
            "�Է�: ���� �� �����ֽðھ���???\n����: ���� ��û\n\n" +
            "�Է�: �����ּ�\n����: ���� ��û\n\n" +
            "�Է�: �����ٷ�?\n����: ���� ��û\n\n" +
            "�Է�: �� �����߽��ϴ�\n����: ���� �Ϸ�\n\n" +
            "�Է�: ���� �߾��\n����: ���� �Ϸ�\n\n" +
            "�Է�: %s\n����:", userInput
        );
    }
}

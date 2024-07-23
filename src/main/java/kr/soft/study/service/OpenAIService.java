package kr.soft.study.service;

import okhttp3.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;

public class OpenAIService {

    private static final String API_URL = "https://api.openai.com/v1/chat/completions";
    private static final String API_KEY = "sk-proj-43wb9GPdjVEKoJPlgl5GT3BlbkFJvHVP3Q3RsVn9qVX0xVUc";  // ���⿡ OpenAI API Ű�� �Է��ϼ���
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
            "���� �ʿ��� ��� ����Ʈ�� �ϳ��� ������ �ٰž�. �ʰ� ������, ����� ���� �����̶� ���ϰų� �����ϴٰ� �����ϴ� ��縦 ����Ʈ���� �ϳ� ���°ž�.���� ��û�� ���� �����Ҷ�, �ٸ� ������� ���������� ������ ���ڷθ� ������� ���� ��� 6 �̷�������.  ��縮��Ʈ\r\n"
            + "\r\n"
            + "1. ���� ����û�� ���� �ɱ��?\r\n"
            + "2. �� ������ �����Ǿ��ٰ��?\r\n"
            + "3. ���� �������� ���� �ɱ��?\r\n"
            + "4. �� ���� ���´� �� �޴������� Ȯ���� �� �־��\r\n"
            + "5. �󸶸� �غ��ϸ� �ɱ��?\r\n"
            + "6. ����� �����Ѱ���?:\n\n" +
            "�Է�: �� ���� �����Ѱ���\n����: 6\n\n" +
             
            "�Է�: %s\n����:", userInput
        );
    }
}

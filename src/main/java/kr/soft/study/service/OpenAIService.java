package kr.soft.study.service;

import okhttp3.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;

public class OpenAIService {

    private static final String API_URL = "https://api.openai.com/v1/chat/completions";
    private static final String API_KEY = "sk-proj-8g5cmBMjE3SB7knypmuOT3BlbkFJFlehu1UQIVddhdeOnxVw";  // 여기에 OpenAI API 키를 입력하세요
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
            "나는 너에게 대사 리스트와 하나의 문장을 줄거야. 너가 할일은, 문장과 뜻이 조금이라도 통하거나 동일하거나 포함된다고 생각하는 대사를 리스트에서 하나 고르는거야.내가 요청한 것을 수행할때, 다른 문장들은 말하지말고 오로지 숫자로만 대답해줘 예를 들면 6 이런식으로. 만약에 해당하는 것이 없으면 0 을 반환해줘.  대사리스트\r\n"
            + "\r\n"
            + "1. 제가 사건에 연루되었단 말인가요? 제가요? 명의도용 사건이요? 어떤사건이요? 무슨일이에요?\r\n"
            + "2. 그 사실에 대해 알지 못합니다. 아니요. 잘몰라요. 아는 사실이 없어요.\r\n"
            + "3. 제가 어떻게 하면 되나요? 어떻게 진위여부를 파악하나요. 저 판매 안했어요. 저는 안그랬습니다.\r\n"
            + "4. 저는 직장이든 자택이든 어딘가에 있습니다. 회사입니다. 집입니다. 다른곳입니다. \r\n"
            + "5. 네. 알겠습니다. 이동했습니다. 주의하겠습니다.\r\n"
            + "6. 어떤 은행을 거래하고 있습니다. 국민은행입니다. 하나은행입니다.신한은행입니다. 농협입니다.새마을금고.우리은행.\r\n"
            + "7. 어떤 종류의 계좌가 있습니다. 예금이있습니다. 적금이 있습니다. 신탁이 있습니다. 500만원 있습니다. 얼마정도가 있습니다.\r\n"
            + "8. 사람은 무사한가요:\n\n" +
            "입력: 제 자식은 무사한가요\n응답: 8\n\n" +
             
            "입력: %s\n응답:", userInput
        );
    }
}

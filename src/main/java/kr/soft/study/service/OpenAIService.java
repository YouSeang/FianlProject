package kr.soft.study.service;

import okhttp3.*;
import org.json.JSONArray;
import org.json.JSONObject;

import kr.soft.study.dao.CriminalVoiceDAO;

import java.io.IOException;

public class OpenAIService {

    private static final String API_URL = "https://api.openai.com/v1/chat/completions";
    private static final String API_KEY = "sk-proj-8g5cmBMjE3SB7knypmuOT3BlbkFJFlehu1UQIVddhdeOnxVw";  // 여기에 OpenAI API 키를 입력하세요
    private static final int MAX_RETRIES = 5; // 최대 재시도 횟수
    private static final long RETRY_DELAY_MS = 2000; // 재시도 사이의 지연 시간 (밀리초)

    private final OkHttpClient client;
    private final CriminalVoiceDAO criminalVoiceDAO;

    public OpenAIService(CriminalVoiceDAO criminalVoiceDAO) {
        this.client = new OkHttpClient();
        this.criminalVoiceDAO = criminalVoiceDAO;
    }

    public String getChatbotResponse(String userInput, String scenarioName) throws IOException {
    	// 시나리오 이름을 사용하여 데이터베이스에서 프롬프트를 가져옵니다.
        String promptFromDB = getPromptFromDatabase(scenarioName);
        
        // 가져온 프롬프트를 사용하여 최종 프롬프트를 생성합니다.
        String prompt = generatePrompt(userInput, scenarioName, promptFromDB);

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

    private String generatePrompt(String userInput, String scenarioName, String promptFromDB) {
        return String.format(
            "나는 너에게 대사 리스트와 하나의 문장을 줄거야. 너가 할 일은 문장과 뜻이 조금이라도 통하거나 동일하거나 포함된다고 생각하는 대사를 리스트에서 하나 고르는 거야. 내가 요청한 것을 수행할 때, 다른 문장들은 말하지 말고 오로지 숫자로만 대답해줘. 예를 들면 6 이런 식으로. 최대한 골라보고 만약에 해당하는 것이 없으면 0을 반환해줘.\n\n" +
            "%s\n\n" +
            "입력: %s\n응답 (숫자로만 대답해줘):", 
            promptFromDB, 
            userInput
        );
    }

    private String getPromptFromDatabase(String scenarioName) {
        // 데이터베이스에서 시나리오 이름에 해당하는 프롬프트를 가져오는 로직을 구현합니다.
        // 예: SQL 쿼리를 실행하여 프롬프트를 가져옵니다.
        return criminalVoiceDAO.getPromptByScenarioName(scenarioName);
    }
}

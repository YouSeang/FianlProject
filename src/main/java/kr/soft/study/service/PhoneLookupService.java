package kr.soft.study.service;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class PhoneLookupService {

	private final String apiKey = "num_live_QyjzZPKEr0dTM64ZJN5ScVQ5l3dDY1fW1BcbuXqC"; // 여기에 실제 API 키를 넣으세요

	private static final String API_URL = "https://api.numlookupapi.com/v1/validate/";

	public JsonNode lookupPhoneNumber(String phoneNumber) throws Exception {
		String url = API_URL + phoneNumber + "?apikey=" + apiKey;

		try (CloseableHttpClient client = HttpClients.createDefault()) {
			HttpGet request = new HttpGet(url);
			try (CloseableHttpResponse response = client.execute(request)) {
				String jsonResponse = EntityUtils.toString(response.getEntity());
				ObjectMapper mapper = new ObjectMapper();
				return mapper.readTree(jsonResponse);
			}
		}
	}
}

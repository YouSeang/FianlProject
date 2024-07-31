package kr.soft.study.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.soft.study.service.OpenAIService;

@RestController
public class VoicePhishingController {

    private final OpenAIService openAIService;

    @Autowired
    public VoicePhishingController(OpenAIService openAIService) {
        this.openAIService = openAIService;
    }
    
    @PostMapping("/processVoice")
    public String processVoice(@RequestBody Map<String, String> request) {
        String userInput = request.get("userInput");
        String scenarioName = request.get("scenarioName");
        
        try {
            // OpenAI API를 호출하여 사용자 입력을 표준 응답으로 변환
            String standardResponse = openAIService.getChatbotResponse(userInput, scenarioName);
            return standardResponse;
        } catch (IOException e) {
            e.printStackTrace();
            return "Error: " + e.getMessage();
        }
    }
}

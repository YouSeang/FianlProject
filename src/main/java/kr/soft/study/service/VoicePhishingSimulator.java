package kr.soft.study.service;

import java.util.HashMap;
import java.util.Map;

public class VoicePhishingSimulator {
	
	private static final Map<String, String> responseMap = new HashMap<>();

    static {
    	//시나리오1
    	//답변1
        responseMap.put("네어떻게해야하죠", "어떡하죠?");
        responseMap.put("도와주세요", "어떡하죠?");
        //답변2
        responseMap.put("그럴리가없는데요", "제가확인할게요");
        responseMap.put("제가어플로확인해볼게요", "제가확인할게요");
        
        //시나리오2
        //답변1
        responseMap.put("네삭제했습니다", "삭제완료했어요.");
        //답변2
        responseMap.put("지금했어요", "삭제완료했어요.");
        
        // 다른 매핑 추가
    }

    public static String getStandardResponse(String userInput) {
    	String processedInput = preprocessInput(userInput);
    	return responseMap.getOrDefault(processedInput, "다시 말씀해 주세요.");
    }
    
    // 텍스트 전처리 method
    private static String preprocessInput(String input) {
        if (input == null) {
            return "";
        }
        // 입력 텍스트의 공백과 특수문자를 제거하고 소문자로 변환
        return input.replaceAll("[^가-힣]", "").toLowerCase().trim();
    }

}

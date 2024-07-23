package kr.soft.study.service;

import java.util.HashMap;
import java.util.Map;

public class VoicePhishingSimulator {
	
	private static final Map<String, String> responseMap = new HashMap<>();

    static {
    	//�ó�����1
    	//�亯1
        responseMap.put("�׾���ؾ�����", "�����?");
        responseMap.put("�����ּ���", "�����?");
        //�亯2
        responseMap.put("�׷��������µ���", "����Ȯ���ҰԿ�");
        responseMap.put("�������÷�Ȯ���غ��Կ�", "����Ȯ���ҰԿ�");
        
        //�ó�����2
        //�亯1
        responseMap.put("�׻����߽��ϴ�", "�����Ϸ��߾��.");
        //�亯2
        responseMap.put("�����߾��", "�����Ϸ��߾��.");
        
        // �ٸ� ���� �߰�
    }

    public static String getStandardResponse(String userInput) {
    	String processedInput = preprocessInput(userInput);
    	return responseMap.getOrDefault(processedInput, "�ٽ� ������ �ּ���.");
    }
    
    // �ؽ�Ʈ ��ó�� method
    private static String preprocessInput(String input) {
        if (input == null) {
            return "";
        }
        // �Է� �ؽ�Ʈ�� ����� Ư�����ڸ� �����ϰ� �ҹ��ڷ� ��ȯ
        return input.replaceAll("[^��-�R]", "").toLowerCase().trim();
    }

}

package kr.soft.study.service;

import java.util.HashMap;
import java.util.Map;

public class VoicePhishingSimulator {
	
	private static final Map<String, String> responseMap = new HashMap<>();

    static {
    	//½Ã³ª¸®¿À1
    	//´äº¯1
        responseMap.put("³×¾î¶»°ÔÇØ¾ßÇÏÁÒ", "¾î¶±ÇÏÁÒ?");
        responseMap.put("µµ¿ÍÁÖ¼¼¿ä", "¾î¶±ÇÏÁÒ?");
        //´äº¯2
        responseMap.put("±×·²¸®°¡¾ø´Âµ¥¿ä", "Á¦°¡È®ÀÎÇÒ°Ô¿ä");
        responseMap.put("Á¦°¡¾îÇÃ·ÎÈ®ÀÎÇØº¼°Ô¿ä", "Á¦°¡È®ÀÎÇÒ°Ô¿ä");
        
        //½Ã³ª¸®¿À2
        //´äº¯1
        responseMap.put("³×»èÁ¦Çß½À´Ï´Ù", "»èÁ¦¿Ï·áÇß¾î¿ä.");
        //´äº¯2
        responseMap.put("Áö±İÇß¾î¿ä", "»èÁ¦¿Ï·áÇß¾î¿ä.");
        
        // ´Ù¸¥ ¸ÅÇÎ Ãß°¡
    }

    public static String getStandardResponse(String userInput) {
    	String processedInput = preprocessInput(userInput);
    	return responseMap.getOrDefault(processedInput, "´Ù½Ã ¸»¾¸ÇØ ÁÖ¼¼¿ä.");
    }
    
    // ÅØ½ºÆ® ÀüÃ³¸® method
    private static String preprocessInput(String input) {
        if (input == null) {
            return "";
        }
        // ÀÔ·Â ÅØ½ºÆ®ÀÇ °ø¹é°ú Æ¯¼ö¹®ÀÚ¸¦ Á¦°ÅÇÏ°í ¼Ò¹®ÀÚ·Î º¯È¯
        return input.replaceAll("[^°¡-ÆR]", "").toLowerCase().trim();
    }

}

package kr.soft.study.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;

import kr.soft.study.dao.SecureDAO;
import kr.soft.study.dto.TipDto;
import kr.soft.study.dto.PointsDto;

@Component
public class SecureCommand implements SCommand {

    private SqlSession sqlSession;

    @Autowired
    public SecureCommand(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void execute(Map<String, Object> map) {
        String userId = (String) map.get("userId");
        Map<String, List<String>> responses = (Map<String, List<String>>) map.get("responses");

        // 팁을 데이터베이스에서 조회
        SecureDAO secureDAO = sqlSession.getMapper(SecureDAO.class);
        List<TipDto> allTips = secureDAO.getTips();

        // 카테고리별 체크된 항목 수를 계산
        Map<String, Integer> categoryCounts = new HashMap<>();
        int totalChecked = 0;
        for (Map.Entry<String, List<String>> entry : responses.entrySet()) {
            String category = entry.getKey();
            int checkedCount = entry.getValue().size();
            categoryCounts.put(category, checkedCount);
            totalChecked += checkedCount;
        }

        // 총 점수 계산 (체크된 항목 수 * 7)
        int totalScore = totalChecked * 7;
        String temperatureMessage = "";
        if (totalScore < 30) {
            temperatureMessage = "미지근해요";
        } else if (totalScore < 70) {
            temperatureMessage = "따뜻해요";
        } else {
            temperatureMessage = "뜨거워요";
        }

        // 보안 점수 저장
        if (userId != null) {
            secureDAO.addSecurityScore(userId, totalScore);
        } else {
            secureDAO.addSecurityScore("guest", totalScore);
        }

        // 각 카테고리에 대한 팁을 분리하여 저장
        Map<String, TipDto> tipsByCategory = new HashMap<>();
        for (TipDto tip : allTips) {
            int checkedCount = categoryCounts.getOrDefault(tip.getCategory(), 0);
            if (checkedCount < 3) {  // 체크된 항목 수가 3개 미만인 경우에만 팁을 추가
                tipsByCategory.put(tip.getCategory(), tip);
            }
        }

        // 순위 계산
        int rank = secureDAO.getScoreRank(totalScore);
        int totalSubmissions = secureDAO.getTotalSubmissions();

        map.put("tipsByCategory", tipsByCategory);
        map.put("totalScore", totalScore);
        map.put("temperatureMessage", temperatureMessage);
        map.put("rank", rank);
        map.put("totalSubmissions", totalSubmissions);

        // 이벤트 당첨 로직 (로그인된 경우에만)
        if (userId != null) {
            int pointsAddedToday = secureDAO.checkPointsAddedToday(userId);
            if (pointsAddedToday == 0 && Math.random() < 1) { // 10% 확률로 이벤트 당첨
                PointsDto pointsDto = new PointsDto();
                pointsDto.setUserId(userId); // String으로 유지
                pointsDto.setPointsEarned(500);
                pointsDto.setPointReason("보안 체크리스트 완료");
                pointsDto.setTotalPoints(secureDAO.getTotalPoints(userId) + 500);
                secureDAO.addPoints(pointsDto);
                map.put("eventWinner", true);
            } else {
                map.put("eventWinner", false);
            }
        }
    }
}

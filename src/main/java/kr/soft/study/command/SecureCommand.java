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

        // ���� �����ͺ��̽����� ��ȸ
        SecureDAO secureDAO = sqlSession.getMapper(SecureDAO.class);
        List<TipDto> allTips = secureDAO.getTips();

        // ī�װ��� üũ�� �׸� ���� ���
        Map<String, Integer> categoryCounts = new HashMap<>();
        int totalChecked = 0;
        for (Map.Entry<String, List<String>> entry : responses.entrySet()) {
            String category = entry.getKey();
            int checkedCount = entry.getValue().size();
            categoryCounts.put(category, checkedCount);
            totalChecked += checkedCount;
        }

        // �� ���� ��� (üũ�� �׸� �� * 7)
        int totalScore = totalChecked * 7;
        String temperatureMessage = "";
        if (totalScore < 30) {
            temperatureMessage = "�������ؿ�";
        } else if (totalScore < 70) {
            temperatureMessage = "�����ؿ�";
        } else {
            temperatureMessage = "�߰ſ���";
        }

        // ���� ���� ����
        if (userId != null) {
            secureDAO.addSecurityScore(userId, totalScore);
        } else {
            secureDAO.addSecurityScore("guest", totalScore);
        }

        // �� ī�װ��� ���� ���� �и��Ͽ� ����
        Map<String, TipDto> tipsByCategory = new HashMap<>();
        for (TipDto tip : allTips) {
            int checkedCount = categoryCounts.getOrDefault(tip.getCategory(), 0);
            if (checkedCount < 3) {  // üũ�� �׸� ���� 3�� �̸��� ��쿡�� ���� �߰�
                tipsByCategory.put(tip.getCategory(), tip);
            }
        }

        // ���� ���
        int rank = secureDAO.getScoreRank(totalScore);
        int totalSubmissions = secureDAO.getTotalSubmissions();

        map.put("tipsByCategory", tipsByCategory);
        map.put("totalScore", totalScore);
        map.put("temperatureMessage", temperatureMessage);
        map.put("rank", rank);
        map.put("totalSubmissions", totalSubmissions);

        // �̺�Ʈ ��÷ ���� (�α��ε� ��쿡��)
        if (userId != null) {
            int pointsAddedToday = secureDAO.checkPointsAddedToday(userId);
            if (pointsAddedToday == 0 && Math.random() < 1) { // 10% Ȯ���� �̺�Ʈ ��÷
                PointsDto pointsDto = new PointsDto();
                pointsDto.setUserId(userId); // String���� ����
                pointsDto.setPointsEarned(500);
                pointsDto.setPointReason("���� üũ����Ʈ �Ϸ�");
                pointsDto.setTotalPoints(secureDAO.getTotalPoints(userId) + 500);
                secureDAO.addPoints(pointsDto);
                map.put("eventWinner", true);
            } else {
                map.put("eventWinner", false);
            }
        }
    }
}

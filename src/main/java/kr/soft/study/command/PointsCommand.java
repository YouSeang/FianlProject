package kr.soft.study.command;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.soft.study.dao.PointsDAO;
import kr.soft.study.dto.PointsDto;

@Component
public class PointsCommand implements PCommand {

    private SqlSession sqlSession;

    @Autowired
    public PointsCommand(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public String execute(Map<String, Object> map) {
        String userId = (String) map.get("userId");
        if (userId == null || userId.isEmpty()) {
            return "User not logged in.";
        }

        PointsDAO pointsDAO = sqlSession.getMapper(PointsDAO.class);
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);

        int pointsAddedToday = pointsDAO.checkPointsAddedToday(params);
        if (pointsAddedToday == 0) {
            Integer totalPoints = pointsDAO.getTotalPoints(userId);
            int newPoints = 500;
            int updatedTotalPoints = totalPoints != null ? totalPoints + newPoints : newPoints;

            PointsDto pointsDto = new PointsDto();
            pointsDto.setUserId(userId);
            pointsDto.setPointsEarned(newPoints);
            pointsDto.setPointReason("보이스피싱 체험완료");
            pointsDto.setTotalPoints(updatedTotalPoints);

            pointsDAO.addPoints(pointsDto);
            return "Points added successfully.";
        } else {
            return "Points already added today.";
        }
    }
}

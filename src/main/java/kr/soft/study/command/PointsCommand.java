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

//소미수정
	@Override
	public String execute(Map<String, Object> map) {
		String userId = (String) map.get("userId");
		String pointReason = (String) map.get("pointReason");
		System.out.println("Executing PointsCommand with userId: " + userId + ", pointReason: " + pointReason);
		if (userId == null || userId.isEmpty()) {
			System.out.println("User ID is null or empty.");
			return "User ID is null or empty.";
		}

		PointsDAO pointsDAO = sqlSession.getMapper(PointsDAO.class);
		Map<String, Object> params = new HashMap<>();
		params.put("userId", userId);
		params.put("pointReason", pointReason);
		int pointsAddedToday = pointsDAO.checkPointsAddedToday(params);
		if (pointsAddedToday == 0) {
			Integer totalPoints = pointsDAO.getTotalPoints(userId);
			int newPoints = 500; // 기본 포인트

			// 포인트 이유에 따라 다른 포인트를 설정
			if ("출석체크".equals(pointReason)) {
				newPoints = 100; // 출석체크일 경우 100 포인트
			}

			int updatedTotalPoints = totalPoints != null ? totalPoints + newPoints : newPoints;
			PointsDto pointsDto = new PointsDto();
			pointsDto.setUserId(userId);
			pointsDto.setPointsEarned(newPoints);
			pointsDto.setPointReason(pointReason);
			pointsDto.setTotalPoints(updatedTotalPoints);
			pointsDAO.addPoints(pointsDto);

			return "포인트가 업데이트 되었습니다!";
		} else {
			System.out.println("Points already added today for userId: " + userId + ", pointReason: " + pointReason);
			return "오늘은 이미 체험을 통한 포인트 지급이 완료되었습니다.";
		}
	}

	// 소미추가 - 포인트사용
	@Override
	public String useExecute(Map<String, Object> map) {
		String userId = (String) map.get("userId");
		String used_pointReason = (String) map.get("pointReason");
		if (userId == null || userId.isEmpty()) {
			return "User ID is null or empty.";
		}

		PointsDAO pointsDAO = sqlSession.getMapper(PointsDAO.class);
		Integer totalPoints = pointsDAO.getTotalPoints(userId);
		if (totalPoints != null && totalPoints >= 5000) {
			int updatedTotalPoints = totalPoints - 5000;
			PointsDto pointsDto = new PointsDto();
			pointsDto.setUserId(userId);
			pointsDto.setPointsUsed(5000);
			pointsDto.setUsageType(used_pointReason);
			pointsDto.setTotalPoints(updatedTotalPoints);
			pointsDAO.substractPoints(pointsDto);
			return "포인트가 사용되었습니다.";
		} else {
			return "Not enough points.";
		}
	}

//슬기언니추가
	public void updatePoints(String userId, int pointsEarned, String pointReason, int quizId) {
		System.out.println("Executing PointsCommand with userId: " + userId + ", quizId: " + quizId + ", pointsEarned: "
				+ pointsEarned + ", pointReason: " + pointReason);
		if (userId == null || userId.isEmpty()) {
			System.out.println("User ID is null or empty.");
			return;
		}
		PointsDAO pointsDAO = sqlSession.getMapper(PointsDAO.class);
		Map<String, Object> params = new HashMap<>();
		params.put("userId", userId);
		params.put("pointReason", pointReason);
		int pointsAddedToday = pointsDAO.checkPointsAddedToday(params);
		if (pointsAddedToday == 0) {
			Integer totalPoints = pointsDAO.getTotalPoints(userId);
			int newPoints = pointsEarned;
			int updatedTotalPoints = totalPoints != null ? totalPoints + newPoints : newPoints;
			PointsDto pointsDto = new PointsDto();
			pointsDto.setUserId(userId);
			pointsDto.setPointsEarned(newPoints);
			pointsDto.setPointReason(pointReason);
			pointsDto.setTotalPoints(updatedTotalPoints);
			pointsDAO.addPoints(pointsDto);
		} else {
			System.out.println("Points already added today for userId: " + userId + ", pointReason: " + pointReason);
		}
	}
	
	//슬기언니추가
		public boolean updatevideoPoints(String userId, int pointsEarned, String pointReason, int quizId) {
		    System.out.println("Executing PointsCommand with userId: " + userId + ", quizId: " + quizId + ", pointsEarned: " + pointsEarned + ", pointReason: " + pointReason);
		    
		    if (userId == null || userId.isEmpty()) {
		        System.out.println("User ID is null or empty.");
		        return false;
		    }

		    PointsDAO pointsDAO = sqlSession.getMapper(PointsDAO.class);
		    Map<String, Object> params = new HashMap<>();
		    params.put("userId", userId);
		    params.put("pointReason", pointReason);
		    int pointsAddedToday = pointsDAO.checkPointsAddedToday(params);

		    if (pointsAddedToday == 0) {
		        Integer totalPoints = pointsDAO.getTotalPoints(userId);
		        int newPoints = pointsEarned;
		        int updatedTotalPoints = totalPoints != null ? totalPoints + newPoints : newPoints;
		        PointsDto pointsDto = new PointsDto();
		        pointsDto.setUserId(userId);
		        pointsDto.setPointsEarned(newPoints);
		        pointsDto.setPointReason(pointReason);
		        pointsDto.setTotalPoints(updatedTotalPoints);

		        pointsDAO.addPoints(pointsDto);
		        return true; // 포인트 적립 성공
		    } else {
		        System.out.println("Points already added today for userId: " + userId + ", pointReason: " + pointReason);
		        return false; // 포인트 중복 적립
		    }
		}
	
}
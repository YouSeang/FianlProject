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

//�ҹ̼���
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
			int newPoints = 500; // �⺻ ����Ʈ

			// ����Ʈ ������ ���� �ٸ� ����Ʈ�� ����
			if ("�⼮üũ".equals(pointReason)) {
				newPoints = 100; // �⼮üũ�� ��� 100 ����Ʈ
			}

			int updatedTotalPoints = totalPoints != null ? totalPoints + newPoints : newPoints;
			PointsDto pointsDto = new PointsDto();
			pointsDto.setUserId(userId);
			pointsDto.setPointsEarned(newPoints);
			pointsDto.setPointReason(pointReason);
			pointsDto.setTotalPoints(updatedTotalPoints);
			pointsDAO.addPoints(pointsDto);

			return "����Ʈ�� ������Ʈ �Ǿ����ϴ�!";
		} else {
			System.out.println("Points already added today for userId: " + userId + ", pointReason: " + pointReason);
			return "������ �̹� ü���� ���� ����Ʈ ������ �Ϸ�Ǿ����ϴ�.";
		}
	}

	// �ҹ��߰� - ����Ʈ���
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
			return "����Ʈ�� ���Ǿ����ϴ�.";
		} else {
			return "Not enough points.";
		}
	}

//�������߰�
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
	
	//�������߰�
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
		        return true; // ����Ʈ ���� ����
		    } else {
		        System.out.println("Points already added today for userId: " + userId + ", pointReason: " + pointReason);
		        return false; // ����Ʈ �ߺ� ����
		    }
		}
	
}
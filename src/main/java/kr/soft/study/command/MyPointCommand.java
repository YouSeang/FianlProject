package kr.soft.study.command;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import kr.soft.study.dao.MypageDao;
import kr.soft.study.dao.UserDao;
import kr.soft.study.dto.MypageDto;
import kr.soft.study.dto.UserDto;
import kr.soft.study.util.Constant;

@Component
public class MyPointCommand implements UCommand {

	@Override
	public void execute(Model model) {
		String userId = (String) model.getAttribute("userId");
		String selectedDate = (String) model.getAttribute("selectedDate");

		SqlSession sqlSession = Constant.sqlSession;
		MypageDao dao = sqlSession.getMapper(MypageDao.class);
		UserDao userdao = sqlSession.getMapper(UserDao.class);

		// ��ü ����Ʈ ������ ������
		ArrayList<MypageDto> pointList = dao.getUserPoints(userId);
		UserDto userInfo = userdao.getUserById(userId);

		// ���õ� ���� �ش��ϴ� ����Ʈ�� ���͸�
		List<MypageDto> filteredPoints = new ArrayList<>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");

		int accumulatedPoints = 0; // ���� ����Ʈ ����� ���� ����

		// ���õ� �� ������ ����Ʈ���� ���� ���
		for (MypageDto point : pointList) {
			String pointMonth = dateFormat.format(point.getPoint_time());

			if (pointMonth.compareTo(selectedDate) < 0) {
				accumulatedPoints += point.getPoints_earned() - Integer.parseInt(point.getPoints_used());
			}
		}

		// ���� ���õ� ���� ����Ʈ ��� �� ���� ����Ʈ ����
		for (MypageDto point : pointList) {
			String pointMonth = dateFormat.format(point.getPoint_time());

			if (pointMonth.equals(selectedDate)) {
				accumulatedPoints += point.getPoints_earned() - Integer.parseInt(point.getPoints_used());
				point.setTotal_points(accumulatedPoints); // ���� ����Ʈ�� ����
				filteredPoints.add(point);
			}
		}

		// ���͸��� ����Ʈ ����Ʈ�� ����� ������ �𵨿� �߰�
		model.addAttribute("pointList", filteredPoints);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("accumulatedPoints", accumulatedPoints); // ���� ����Ʈ�� �𵨿� �߰�
	}
}
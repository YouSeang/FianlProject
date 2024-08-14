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

		// 전체 포인트 내역을 가져옴
		ArrayList<MypageDto> pointList = dao.getUserPoints(userId);
		UserDto userInfo = userdao.getUserById(userId);

		// 선택된 월에 해당하는 포인트만 필터링
		List<MypageDto> filteredPoints = new ArrayList<>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");

		int accumulatedPoints = 0; // 누적 포인트 계산을 위한 변수

		// 선택된 월 이전의 포인트들을 누적 계산
		for (MypageDto point : pointList) {
			String pointMonth = dateFormat.format(point.getPoint_time());

			if (pointMonth.compareTo(selectedDate) < 0) {
				accumulatedPoints += point.getPoints_earned() - Integer.parseInt(point.getPoints_used());
			}
		}

		// 현재 선택된 월의 포인트 계산 및 누적 포인트 설정
		for (MypageDto point : pointList) {
			String pointMonth = dateFormat.format(point.getPoint_time());

			if (pointMonth.equals(selectedDate)) {
				accumulatedPoints += point.getPoints_earned() - Integer.parseInt(point.getPoints_used());
				point.setTotal_points(accumulatedPoints); // 누적 포인트를 설정
				filteredPoints.add(point);
			}
		}

		// 필터링된 포인트 리스트와 사용자 정보를 모델에 추가
		model.addAttribute("pointList", filteredPoints);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("accumulatedPoints", accumulatedPoints); // 누적 포인트를 모델에 추가
	}
}
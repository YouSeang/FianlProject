package kr.soft.study.command;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import kr.soft.study.dao.MypageDao;
import kr.soft.study.dao.UserDao;
import kr.soft.study.dto.MypageDto;
import kr.soft.study.dto.UserDto;
import kr.soft.study.util.Constant;

@Component
public class MypageCommand implements UCommand {

	@Override
	public void execute(Model model) {
		String userId = (String) model.getAttribute("userId"); //

		SqlSession sqlSession = Constant.sqlSession;
		MypageDao dao = sqlSession.getMapper(MypageDao.class);
		UserDao userdao = sqlSession.getMapper(UserDao.class);

		ArrayList<MypageDto> mylist = dao.myInfomation(userId);
		MypageDto coupon = dao.getCoupon(userId);
		UserDto userInfo = userdao.getUserById(userId);

		Integer totalPointsObj = dao.getUserTotalPoints(userId);
		int totalPoints = (totalPointsObj != null) ? totalPointsObj : 0;

		model.addAttribute("mylist", mylist);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("coupon", coupon);
		model.addAttribute("totalPoints", totalPoints);
	}
}
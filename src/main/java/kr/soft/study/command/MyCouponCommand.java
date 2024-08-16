package kr.soft.study.command;

import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import kr.soft.study.dao.MypageDao;
import kr.soft.study.dao.UserDao;
import kr.soft.study.dto.MypageDto;
import kr.soft.study.dto.UserDto;
import kr.soft.study.util.Constant;

@Component
public class MyCouponCommand implements UCommand {

	@Override
	public void execute(Model model) {
		String userId = (String) model.getAttribute("userId");

		SqlSession sqlSession = Constant.sqlSession;
		MypageDao dao = sqlSession.getMapper(MypageDao.class);
		UserDao userdao = sqlSession.getMapper(UserDao.class);

		ArrayList<MypageDto> couponList = dao.getUserCouponsDetail(userId);
		UserDto userInfo = userdao.getUserById(userId);

		// ���� ��¥�� �����ɴϴ�.
		Date currentDate = new Date();

		// �� ������ ���� ��ȿ�Ⱓ�� �������� ���θ� �����մϴ�.
		for (MypageDto coupon : couponList) {
			Date issueDate = coupon.getIssue_date();
			long diffInMillies = Math.abs(currentDate.getTime() - issueDate.getTime());
			long diffDays = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
			boolean isExpired = diffDays > 30;
			coupon.setExpired(isExpired);

			// �α� ���
			System.out.println("Coupon ID: " + coupon.getCoupon_id() + ", Issue Date: " + issueDate + ", Is Expired: "
					+ isExpired + ", Is Used: " + coupon.getIs_used());
		}

		// �𵨿� ����� �߰��մϴ�.
		model.addAttribute("couponList", couponList);
		model.addAttribute("userInfo", userInfo);
	}
}

package kr.soft.study.command;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import kr.soft.study.dao.CouponDao;
import kr.soft.study.util.Constant;

@Component
public class CouponCommand implements UCommand {

	@Override
	public void execute(Model model) {

		SqlSession sqlSession = Constant.sqlSession;
		CouponDao dao = sqlSession.getMapper(CouponDao.class);

		model.addAttribute("coupon_list", dao.getCoupon());

	}

	public String saveUserCoupon(String user_id, int couponId) {
		SqlSession sqlSession = Constant.sqlSession;
		CouponDao dao = sqlSession.getMapper(CouponDao.class);

		Map<String, Object> map = new HashMap<>();
		map.put("userId", user_id);
		map.put("couponId", couponId);
		System.out.println("ÄíÆùÀúÀå:" + user_id + couponId);

		try {
			dao.insertUserCoupon(map);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failure: " + e.getMessage();
		}
	}
}

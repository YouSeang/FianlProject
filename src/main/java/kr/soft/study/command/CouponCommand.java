package kr.soft.study.command;

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
}

package kr.soft.study.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.soft.study.command.CouponCommand;
import kr.soft.study.command.UCommand;
import kr.soft.study.util.Constant;

@Controller
public class CouponController {
	
	UCommand command = null; // UCommand 인터페이스 타입의 참조변수를 선언

	private SqlSession sqlSession;

	@Autowired
	public CouponController(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}

	@RequestMapping("/couponshop")
	public String content_view(Model model) {
		System.out.println("couponShop");

		command = new CouponCommand();
		command.execute(model);

		return "mypage/couponshop";
	}
}

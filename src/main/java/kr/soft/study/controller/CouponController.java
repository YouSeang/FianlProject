package kr.soft.study.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.soft.study.command.CouponCommand;
import kr.soft.study.command.UCommand;
import kr.soft.study.dto.UserDto;
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
	public String content_view(HttpSession session, Model model) {
		System.out.println("couponShop");

		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			// 사용자 정보가 세션에 저장되어 있지 않은 경우 처리
			return "redirect:/login";
		}

		String userId = user.getUser_id(); // user가 null이 아닌 경우에만 호출됨
		System.out.println(userId);

		// 사용자 ID를 모델에 추가
		model.addAttribute("userId", userId);

		command = new CouponCommand();
		command.execute(model);

		return "mypage/couponshop";
	}

}

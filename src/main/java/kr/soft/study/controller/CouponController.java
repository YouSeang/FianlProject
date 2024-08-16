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

	UCommand command = null; // UCommand �������̽� Ÿ���� ���������� ����

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
			// ����� ������ ���ǿ� ����Ǿ� ���� ���� ��� ó��
			return "redirect:/login";
		}

		String userId = user.getUser_id(); // user�� null�� �ƴ� ��쿡�� ȣ���
		System.out.println(userId);

		// ����� ID�� �𵨿� �߰�
		model.addAttribute("userId", userId);

		command = new CouponCommand();
		command.execute(model);

		return "mypage/couponshop";
	}

}

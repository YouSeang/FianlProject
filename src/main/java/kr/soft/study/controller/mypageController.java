package kr.soft.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.soft.study.command.ModifyActionCommand;
import kr.soft.study.command.ModifyCommand;
import kr.soft.study.command.MyCouponCommand;
import kr.soft.study.command.MyPointCommand;
import kr.soft.study.command.MypageCommand;
import kr.soft.study.command.UCommand;
import kr.soft.study.dto.UserDto;
import kr.soft.study.util.Constant;

/**
 * Handles requests for the application home page�׽�Ʈ.
 */
@Controller
public class mypageController {

	UCommand command = null; // UCommand �������̽� Ÿ���� ���������� ����

	private SqlSession sqlSession;

	@Autowired
	public mypageController(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}

	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		System.out.println("mypage");

		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			// ����� ������ ���ǿ� ����Ǿ� ���� ���� ��� ó��
			return "redirect:/login";
		}

		String userId = user.getUser_id(); // user�� null�� �ƴ� ��쿡�� ȣ���
		System.out.println("User ID: " + userId);

		// ����� ID�� �𵨿� �߰�
		model.addAttribute("userId", userId);

		command = new MypageCommand();
		command.execute(model);

		return "mypage/mypage";
	}

	@RequestMapping("/modify")
	public String modify(HttpSession session, Model model) {
		System.out.println("modify");

		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			// ����� ������ ���ǿ� ����Ǿ� ���� ���� ��� ó��
			return "redirect:/login";
		}

		String userId = user.getUser_id(); // user�� null�� �ƴ� ��쿡�� ȣ���
		System.out.println(userId);

		// ����� ID�� �𵨿� �߰�
		model.addAttribute("userId", userId);

		command = new ModifyCommand();
		command.execute(model);

		return "mypage/modify";

	}

	@RequestMapping("/modifyAction")
	public String modifyAction(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		System.out.println("modifyAction()");

		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			// ����� ������ ���ǿ� ����Ǿ� ���� ���� ��� ó��
			return "redirect:/login";
		}

		String userId = user.getUser_id(); // user�� null�� �ƴ� ��쿡�� ȣ���

		model.addAttribute("userId", userId);
		model.addAttribute("request", request);

		command = new ModifyActionCommand();
		command.execute(model);

		return "redirect:/mypage?success=true";
	}

	@RequestMapping("/mypoint")
	public String mypoint(HttpSession session, Model model) {
		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			// ����� ������ ���ǿ� ����Ǿ� ���� ���� ��� ó��
			return "redirect:/login";
		}

		String userId = user.getUser_id(); // user�� null�� �ƴ� ��쿡�� ȣ���
		System.out.println("User ID: " + userId);

		// ����� ID�� �𵨿� �߰�
		model.addAttribute("userId", userId);

		command = new MyPointCommand();
		command.execute(model);

		return "mypage/myPoint";
	}

	@RequestMapping("/myCoupon")
	public String myCoupon(HttpSession session, Model model) {
		System.out.println("myCoupon");

		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			// ����� ������ ���ǿ� ����Ǿ� ���� ���� ��� ó��
			return "redirect:/login";
		}

		String userId = user.getUser_id(); // user�� null�� �ƴ� ��쿡�� ȣ���
		System.out.println("User ID: " + userId);

		// ����� ID�� �𵨿� �߰�
		model.addAttribute("userId", userId);

		command = new MyCouponCommand();
		command.execute(model);

		return "mypage/myCoupon";
	}

	
}

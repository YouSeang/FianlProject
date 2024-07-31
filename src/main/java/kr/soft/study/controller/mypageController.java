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
 * Handles requests for the application home page占쌓쏙옙트.
 */
@Controller
public class mypageController {

	UCommand command = null; // UCommand 인터페이스 타입의 참조변수를 선언

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
			// 사용자 정보가 세션에 저장되어 있지 않은 경우 처리
			return "redirect:/login";
		}

		String userId = user.getUser_id(); // user가 null이 아닌 경우에만 호출됨
		System.out.println("User ID: " + userId);

		// 사용자 ID를 모델에 추가
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
			// 사용자 정보가 세션에 저장되어 있지 않은 경우 처리
			return "redirect:/login";
		}

		String userId = user.getUser_id(); // user가 null이 아닌 경우에만 호출됨
		System.out.println(userId);

		// 사용자 ID를 모델에 추가
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
			// 사용자 정보가 세션에 저장되어 있지 않은 경우 처리
			return "redirect:/login";
		}

		String userId = user.getUser_id(); // user가 null이 아닌 경우에만 호출됨

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
			// 사용자 정보가 세션에 저장되어 있지 않은 경우 처리
			return "redirect:/login";
		}

		String userId = user.getUser_id(); // user가 null이 아닌 경우에만 호출됨
		System.out.println("User ID: " + userId);

		// 사용자 ID를 모델에 추가
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
			// 사용자 정보가 세션에 저장되어 있지 않은 경우 처리
			return "redirect:/login";
		}

		String userId = user.getUser_id(); // user가 null이 아닌 경우에만 호출됨
		System.out.println("User ID: " + userId);

		// 사용자 ID를 모델에 추가
		model.addAttribute("userId", userId);

		command = new MyCouponCommand();
		command.execute(model);

		return "mypage/myCoupon";
	}

	
}

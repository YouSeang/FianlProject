package kr.soft.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.soft.study.command.UserLogin;
import kr.soft.study.command.UserSignup;
import kr.soft.study.command.UserValidator;
import kr.soft.study.dto.UserDto;
import kr.soft.study.service.EmailService;
import kr.soft.study.service.UserService;

@Controller
public class loginController {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private UserLogin userLogin;

	@Autowired
	private UserSignup userSignup;

	@Autowired
	private UserService userService;
	//되라

	@Autowired
	private EmailService emailService;

	@RequestMapping("/loginView")
	public String loginView(Model model) {
		model.addAttribute("userDto", new UserDto());
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("userDto") @Validated UserDto userDto, BindingResult result,
			HttpSession session, Model model, HttpServletRequest request) {
		UserValidator validator = new UserValidator();
		validator.validate(userDto, result);

		if (result.hasErrors()) {
			session.setAttribute("isLoggedIn", false); // 로그인 실패 시
			return "login";
		}

		model.addAttribute("request", request);
		userLogin.execute(model);

		String loginResult = (String) session.getAttribute("loginResult");
		if ("success".equals(loginResult)) {
			session.setAttribute("isLoggedIn", true); // 로그인 성공 시 세션에 true값 담음
			UserDto user = (UserDto) session.getAttribute("user");
			session.setAttribute("userId", user.getUser_id());
			System.out.println("User logged in: " + user.getUser_id());
			System.out.println("isLoggedIn: " + session.getAttribute("isLoggedIn"));

			String userRole = (String) session.getAttribute("userRole");
			if ("admin".equals(userRole)) {
				System.out.println("admin login");
				return "redirect:admin/admin";
			} else {
				return "redirect:/home";
			}
		} else {
			session.setAttribute("isLoggedIn", false); // 로그인 실패 시
			  // 실패 이유에 따라 SweetAlert 메시지를 전달합니다.
            if ("invalidId".equals(loginResult)) {
                model.addAttribute("loginError", "invalidId");
            } else if ("invalidPassword".equals(loginResult)) {
                model.addAttribute("loginError", "invalidPassword");
            } else {
                model.addAttribute("loginError", "unknownError");
            }

            System.out.println("Login error: " + loginResult);
            return "login";
        }
	}

	// 로그인 후 home 으로 이동
	@RequestMapping("/home")
	public String home(Model model) {
		return "home";
	}

	@RequestMapping("/test")
	public String test(Model model) {
		return "home2";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 무효화
		return "home";
	}

	@RequestMapping("/signupView")
	public String signupView(Model model) {
		model.addAttribute("userDto", new UserDto());
		return "signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(@ModelAttribute("userDto") @Validated UserDto userDto, BindingResult result, Model model,
			HttpServletRequest request) {
		UserValidator validator = new UserValidator();
		validator.validate(userDto, result);

		if (result.hasErrors()) {
			return "signup";
		}

		model.addAttribute("request", request);
		userSignup.execute(model);
		return "home";
	}

	@RequestMapping("/findpw")
	public String findpw(Model model) {
		return "findpw";
	}

	@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
	public String findPassword(@RequestParam("email") String email, Model model) {
		UserDto user = userService.findUserByEmail(email);
		if (user == null) {
			model.addAttribute("error", "해당 이메일로 등록된 사용자가 없습니다.");
			return "findpw"; // 비밀번호 찾기 페이지로 다시 이동
		}

		// 비밀번호 재설정 링크 생성 (임의의 토큰 생성)
		String resetToken = userService.createPasswordResetToken(user.getUser_id());

		// 이메일로 비밀번호 재설정 링크 전송
		String resetLink = "https://lockb.duckdns.org/resetPassword?token=" + resetToken;
		emailService.sendResetPasswordEmail(user.getEmail(), resetLink);

		model.addAttribute("message", "비밀번호 재설정 링크가 이메일로 전송되었습니다.");
		return "findpw"; // 성공 메시지와 함께 비밀번호 찾기 페이지로 다시 이동
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
	public String resetPasswordForm(@RequestParam("token") String token, Model model) {
		UserDto user = userService.validatePasswordResetToken(token);
		if (user == null) {
			model.addAttribute("error", "유효하지 않은 비밀번호 재설정 요청입니다.");
			return "resetPasswordError"; // 오류 페이지로 이동
		}
		model.addAttribute("token", token);
		return "resetPasswordForm"; // 비밀번호 재설정 폼 페이지로 이동
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public String resetPassword(@RequestParam("token") String token, @RequestParam("password") String password,
			Model model) {
		UserDto user = userService.validatePasswordResetToken(token);
		if (user == null) {
			model.addAttribute("error", "유효하지 않은 비밀번호 재설정 요청입니다.");
			return "resetPassword";
		}

		String encodedPassword = passwordEncoder.encode(password);
		userService.updatePassword(user.getUser_id(), encodedPassword);

		model.addAttribute("message", "비밀번호가 성공적으로 변경되었습니다.");
		return "login";
	}
}
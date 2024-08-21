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
	//�Ƕ�

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
			session.setAttribute("isLoggedIn", false); // �α��� ���� ��
			return "login";
		}

		model.addAttribute("request", request);
		userLogin.execute(model);

		String loginResult = (String) session.getAttribute("loginResult");
		if ("success".equals(loginResult)) {
			session.setAttribute("isLoggedIn", true); // �α��� ���� �� ���ǿ� true�� ����
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
			session.setAttribute("isLoggedIn", false); // �α��� ���� ��
			  // ���� ������ ���� SweetAlert �޽����� �����մϴ�.
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

	// �α��� �� home ���� �̵�
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
		session.invalidate(); // ���� ��ȿȭ
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
			model.addAttribute("error", "�ش� �̸��Ϸ� ��ϵ� ����ڰ� �����ϴ�.");
			return "findpw"; // ��й�ȣ ã�� �������� �ٽ� �̵�
		}

		// ��й�ȣ �缳�� ��ũ ���� (������ ��ū ����)
		String resetToken = userService.createPasswordResetToken(user.getUser_id());

		// �̸��Ϸ� ��й�ȣ �缳�� ��ũ ����
		String resetLink = "https://lockb.duckdns.org/resetPassword?token=" + resetToken;
		emailService.sendResetPasswordEmail(user.getEmail(), resetLink);

		model.addAttribute("message", "��й�ȣ �缳�� ��ũ�� �̸��Ϸ� ���۵Ǿ����ϴ�.");
		return "findpw"; // ���� �޽����� �Բ� ��й�ȣ ã�� �������� �ٽ� �̵�
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
	public String resetPasswordForm(@RequestParam("token") String token, Model model) {
		UserDto user = userService.validatePasswordResetToken(token);
		if (user == null) {
			model.addAttribute("error", "��ȿ���� ���� ��й�ȣ �缳�� ��û�Դϴ�.");
			return "resetPasswordError"; // ���� �������� �̵�
		}
		model.addAttribute("token", token);
		return "resetPasswordForm"; // ��й�ȣ �缳�� �� �������� �̵�
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public String resetPassword(@RequestParam("token") String token, @RequestParam("password") String password,
			Model model) {
		UserDto user = userService.validatePasswordResetToken(token);
		if (user == null) {
			model.addAttribute("error", "��ȿ���� ���� ��й�ȣ �缳�� ��û�Դϴ�.");
			return "resetPassword";
		}

		String encodedPassword = passwordEncoder.encode(password);
		userService.updatePassword(user.getUser_id(), encodedPassword);

		model.addAttribute("message", "��й�ȣ�� ���������� ����Ǿ����ϴ�.");
		return "login";
	}
}
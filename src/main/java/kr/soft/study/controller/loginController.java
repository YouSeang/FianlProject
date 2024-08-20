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

import kr.soft.study.command.UCommand;
import kr.soft.study.command.UserLogin;
import kr.soft.study.command.UserSignup;
import kr.soft.study.command.UserValidator;
import kr.soft.study.dto.UserDto;

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
            model.addAttribute("loginError", "invalidId");
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

    // 로그인 후 home으로 이동
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
}

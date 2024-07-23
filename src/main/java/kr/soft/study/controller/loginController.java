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
    public String login(@ModelAttribute("userDto") @Validated UserDto userDto, BindingResult result, HttpSession session, Model model, HttpServletRequest request) {
        UserValidator validator = new UserValidator();
        validator.validate(userDto, result);

        if (result.hasErrors()) {
            return "login";
        }

        model.addAttribute("request", request);
        userLogin.execute(model);

        String loginResult = (String) session.getAttribute("loginResult");
        if ("success".equals(loginResult)) {
            String userRole = (String) session.getAttribute("userRole");
            if ("admin".equals(userRole)) {
                return "redirect:/adminHome";
            } else {
                return "home";
            }
        } else {
            model.addAttribute("loginError", "Invalid username or password.");
            return "home";
        }
    }

    @RequestMapping("/signupView")
    public String signupView(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "signup";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signup(@ModelAttribute("userDto") @Validated UserDto userDto, BindingResult result, Model model, HttpServletRequest request) {
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

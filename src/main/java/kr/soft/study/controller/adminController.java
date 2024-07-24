package kr.soft.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {
	
    // 로그인 후 관리자 페이지로 이동
    @RequestMapping("/admin")
    public String adminView(Model model) {
        return "admin";
    }
	
    // 시나리오 관리
    @RequestMapping("/admin/adminPhishing")
    public String adminPhishing(Model model) {
        return "admin/adminPhishing";
    }

}

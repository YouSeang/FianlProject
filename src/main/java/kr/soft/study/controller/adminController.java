package kr.soft.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {
	
    // 로그인 후 관리자 페이지로 이동
    @RequestMapping("/admin/admin")
    public String adminView(Model model) {
        return "admin/admin";
    }
	
    // 시나리오 관리
    @RequestMapping("/admin/adminPhishing")
    public String adminPhishing(Model model) {
        return "admin/adminPhishing";
    }
    
    // 시나리오 관리(추가)
    @RequestMapping("/admin/addPhishing")
    public String addPhishing(Model model) {
        return "admin/addPhishing";
    }
    
    // user 관리
    @RequestMapping("/admin/adminUser")
    public String adminUser(Model model) {
        return "admin/adminUser";
    }
    

}

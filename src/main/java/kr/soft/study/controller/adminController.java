package kr.soft.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {
	
    // �α��� �� ������ �������� �̵�
    @RequestMapping("/admin")
    public String adminView(Model model) {
        return "admin";
    }
	
    // �ó����� ����
    @RequestMapping("/admin/adminPhishing")
    public String adminPhishing(Model model) {
        return "admin/adminPhishing";
    }

}

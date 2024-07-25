package kr.soft.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {
	
    // �α��� �� ������ �������� �̵�
    @RequestMapping("/admin/admin")
    public String adminView(Model model) {
        return "admin/admin";
    }
	
    // �ó����� ����
    @RequestMapping("/admin/adminPhishing")
    public String adminPhishing(Model model) {
        return "admin/adminPhishing";
    }
    
    // �ó����� ����(�߰�)
    @RequestMapping("/admin/addPhishing")
    public String addPhishing(Model model) {
        return "admin/addPhishing";
    }
    
    // user ����
    @RequestMapping("/admin/adminUser")
    public String adminUser(Model model) {
        return "admin/adminUser";
    }
    

}

package kr.soft.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.soft.study.command.AdminAddPhishing;

@Controller
public class adminController {
	
	@Autowired
	private AdminAddPhishing adminAddPhishing;
	
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
    
    // �ó����� �߰� ó��
    @RequestMapping(value = "/admin/addScenario", method = RequestMethod.POST)
    public String addScenario(
            @RequestParam("scenarioName") String scenarioName,
            @RequestParam("scenarioPrompt") String scenarioPrompt,
            @RequestParam("audioFile") MultipartFile audioFile,
            Model model) {
        model.addAttribute("scenarioName", scenarioName);
        model.addAttribute("scenarioPrompt", scenarioPrompt);
        model.addAttribute("audioFile", audioFile);
        adminAddPhishing.execute(model);
        return "redirect:/admin/adminPhishing";
    }
    
    // user ����
    @RequestMapping("/admin/adminUser")
    public String adminUser(Model model) {
        return "admin/adminUser";
    }
    
    

}

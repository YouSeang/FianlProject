package kr.soft.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.soft.study.command.RecentIncidentCommand;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/voice")
public class SearchController {

    @Autowired
    private RecentIncidentCommand recentIncidentCommand;

    @PostMapping("/search")
    @ResponseBody
    public Map<String, Object> search(@RequestBody Map<String, String> requestData, Model model) {
        String keyword = requestData.get("keyword");
        System.out.println("Keyword received: " + keyword);
        model.addAttribute("keyword", keyword);

        recentIncidentCommand.execute(model);

        
        
        Map<String, Object> response = new HashMap<>();
        response.put("newsList", model.getAttribute("newsList"));
        return response;
    }
}

package kr.soft.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.*;

import kr.soft.study.command.SCommand;
import kr.soft.study.dto.UserDto;

@Controller
public class SecureController {

    private SCommand secureCommand;

    @Autowired
    public SecureController(SCommand secureCommand) {
        this.secureCommand = secureCommand;
    }

    @RequestMapping(value = "/submitChecklist", method = RequestMethod.POST)
    public String submitChecklist(@RequestParam(value = "category1[]", required = false) String[] category1,
                                  @RequestParam(value = "category2[]", required = false) String[] category2,
                                  @RequestParam(value = "category3[]", required = false) String[] category3,
                                  HttpSession session, Map<String, Object> model) {

        UserDto user = (UserDto) session.getAttribute("user");
        Map<String, List<String>> responses = new HashMap<>();

        if (category1 != null) {
            responses.put("category1", Arrays.asList(category1));
        }
        if (category2 != null) {
            responses.put("category2", Arrays.asList(category2));
        }
        if (category3 != null) {
            responses.put("category3", Arrays.asList(category3));
        }

        Map<String, Object> commandMap = new HashMap<>();
        commandMap.put("userId", user != null ? user.getUser_id() : null);
        commandMap.put("responses", responses);
        
        // SecureCommand 실행
        secureCommand.execute(commandMap);

        // 모델에 팁과 이벤트 당첨 여부 저장
        model.put("tipsByCategory", commandMap.get("tipsByCategory"));
        model.put("totalScore", commandMap.get("totalScore"));
        model.put("temperatureMessage", commandMap.get("temperatureMessage"));
        model.put("rank", commandMap.get("rank"));
        int totalSubmissions = (int) commandMap.get("totalSubmissions");
        model.put("totalSubmissions", totalSubmissions);

        if (user != null) {
            model.put("eventWinner", commandMap.get("eventWinner"));
        }

        return "security/securityTempResult"; // 결과 페이지로 리디렉션
    }
}

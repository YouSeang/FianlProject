package kr.soft.study.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.soft.study.command.PCommand;
import kr.soft.study.dto.UserDto;

@Controller
public class PointsController {

	private PCommand pointsCommand;

	@Autowired
	public PointsController(PCommand pointsCommand) {
		this.pointsCommand = pointsCommand;
	}

	@RequestMapping(value = "/updatePoints", method = RequestMethod.POST)
	@ResponseBody
	public String updatePoints(HttpSession session, @RequestParam("pointReason") String pointReason) {
		UserDto user = (UserDto) session.getAttribute("user");
		if (user != null && user.getUser_id() != null) {
			System.out.println("User ID: " + user.getUser_id()); // 세션에 사용자 ID 출력
			Map<String, Object> map = new HashMap<>();
			map.put("userId", user.getUser_id());
			map.put("pointReason", pointReason); // 추가된 부분
			return pointsCommand.execute(map);
		} else {
			System.out.println("세션에 아이디 없음");
			return "User is not logged in.";
		}
	}
}

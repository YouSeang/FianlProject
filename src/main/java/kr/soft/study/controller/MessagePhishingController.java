package kr.soft.study.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.soft.study.command.PCommand;
import kr.soft.study.command.UCommand;
import kr.soft.study.dto.UserDto;
import kr.soft.study.util.Constant;

@Controller
public class MessagePhishingController {

	/*
	 * UCommand command = null; // UCommand 인터페이스 타입의 참조변수를 선언
	 */
	private PCommand pointsCommand;
	private SqlSession sqlSession;

	@Autowired
	public MessagePhishingController(SqlSession sqlSession, PCommand pointsCommand) {

		this.pointsCommand = pointsCommand;
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}

	@GetMapping("/response")
	@ResponseBody
	public String handleResponse(@RequestParam("response") String response) {
		if ("답변1".equals(response)) {
			return "메시지2";
		} else if ("답변2".equals(response)) {
			return "메시지2-1";
		} else {
			return "알 수 없는 응답";
		}
	}

	@PostMapping("/resultMessagePhishing")
	@ResponseBody
	public Map<String, Object> resultMessagePhishing(@RequestParam("pointReason") String pointReason,
			HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		System.out.println("메신저피싱 포인트");

		 // 로그인 확인
	    UserDto user = (UserDto) session.getAttribute("user");
	    if (user == null || user.getUser_id() == null) {
	        System.out.println("세션에서 사용자를 찾을 수 없습니다.");
	        //response.put("pointUpdateResult", "로그인 후 이용해주세요");
	        return response;
	    }
		String userId = user.getUser_id();
		System.out.println("User ID: " + userId); // 세션에 사용자 ID 출력

		Map<String, Object> map = new HashMap<>();
		map.put("userId", user.getUser_id());
		map.put("pointReason", pointReason);

		String result = pointsCommand.execute(map);
		response.put("pointUpdateResult", result);

		return response;
	}

}
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
	 * UCommand command = null; // UCommand �������̽� Ÿ���� ���������� ����
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
		if ("�亯1".equals(response)) {
			return "�޽���2";
		} else if ("�亯2".equals(response)) {
			return "�޽���2-1";
		} else {
			return "�� �� ���� ����";
		}
	}

	@PostMapping("/resultMessagePhishing")
	@ResponseBody
	public Map<String, Object> resultMessagePhishing(@RequestParam("pointReason") String pointReason,
			HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		System.out.println("�޽����ǽ� ����Ʈ");

		 // �α��� Ȯ��
	    UserDto user = (UserDto) session.getAttribute("user");
	    if (user == null || user.getUser_id() == null) {
	        System.out.println("���ǿ��� ����ڸ� ã�� �� �����ϴ�.");
	        //response.put("pointUpdateResult", "�α��� �� �̿����ּ���");
	        return response;
	    }
		String userId = user.getUser_id();
		System.out.println("User ID: " + userId); // ���ǿ� ����� ID ���

		Map<String, Object> map = new HashMap<>();
		map.put("userId", user.getUser_id());
		map.put("pointReason", pointReason);

		String result = pointsCommand.execute(map);
		response.put("pointUpdateResult", result);

		return response;
	}

}
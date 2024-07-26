package kr.soft.study.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.soft.study.command.UCommand;

@Controller
public class MessagePhishingController {

	UCommand command = null; // UCommand �������̽� Ÿ���� ���������� ����

	private SqlSession sqlSession;

	/*
	 * @RequestMapping("/voice/messagePhishing") public String voicePhishing(Model
	 * model) {
	 * 
	 * return "voice/messagePhishing"; }
	 */



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
}
package kr.soft.study.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.soft.study.command.UCommand;
import kr.soft.study.util.Constant;

/**
 * Handles requests for the application home page.
 */
@Controller
public class boardController {

	UCommand command = null; // UCommand 인터페이스 타입의 참조변수를 선언

	private SqlSession sqlSession;

	@Autowired
	public boardController(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}

	@RequestMapping("/board/notice")
	public String notice(Model model) {
		System.out.println("notice");
		return "board/notice";
	}

	@RequestMapping("/board/share")
	public String share(Model model) {
		System.out.println("notice");
		return "board/share";
	}


}

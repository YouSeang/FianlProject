package kr.soft.study.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.soft.study.dao.QuizDao;
import kr.soft.study.dao.VideoDao;
import kr.soft.study.util.Command;
import kr.soft.study.util.Constant;

@Service
public class AdminQuizCommand implements Command {

	@Override
	public void execute(Model model) {
		SqlSession sqlSession = Constant.sqlSession;
		
		QuizDao dao = sqlSession.getMapper(QuizDao.class);
		model.addAttribute("quizs", dao.getQuizs());
		
	}
}

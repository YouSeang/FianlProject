package kr.soft.study.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.soft.study.dao.VideoDao;
import kr.soft.study.util.Command;
import kr.soft.study.util.Constant;

@Service
public class AdminVideoCommand implements Command {

	@Override
	public void execute(Model model) {
		SqlSession sqlSession = Constant.sqlSession;
		VideoDao dao = sqlSession.getMapper(VideoDao.class);
		model.addAttribute("videos", dao.getVideos());
	}
}

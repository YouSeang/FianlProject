package kr.soft.study.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.soft.study.dao.ShareDao;
import kr.soft.study.dao.VideoDao;
import kr.soft.study.util.Command;
import kr.soft.study.util.Constant;

@Service
public class ShareCommand implements Command {

	@Override
	public void execute(Model model) {
		SqlSession sqlSession = Constant.sqlSession;
		
		ShareDao dao = sqlSession.getMapper(ShareDao.class);
		model.addAttribute("shareList", dao.list());
		
	}
}

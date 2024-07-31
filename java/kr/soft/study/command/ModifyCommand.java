package kr.soft.study.command;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import kr.soft.study.dao.MypageDao;
import kr.soft.study.dao.UserDao;
import kr.soft.study.dto.MypageDto;
import kr.soft.study.dto.UserDto;
import kr.soft.study.util.Constant;

@Component
public class ModifyCommand implements UCommand {

	@Override
	public void execute(Model model) {
		String userId = (String) model.getAttribute("userId"); 
		System.out.println(userId);

		SqlSession sqlSession = Constant.sqlSession;
		UserDao userdao = sqlSession.getMapper(UserDao.class);

		UserDto userInfo = userdao.getUserById(userId);

		System.out.println("UserInfo: " + userInfo);

		model.addAttribute("userInfo", userInfo);

	}

}

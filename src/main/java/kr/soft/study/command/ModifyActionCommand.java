package kr.soft.study.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import kr.soft.study.dao.UserDao;
import kr.soft.study.dto.UserDto;
import kr.soft.study.util.Constant;

@Component
public class ModifyActionCommand implements UCommand {

	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String Email = request.getParameter("email"); 
		String phone_number = request.getParameter("phone_number"); 

		String userId = (String) model.getAttribute("userId");
		System.out.println(userId);
		System.out.println(Email);

		SqlSession sqlSession = Constant.sqlSession;
		UserDao userdao = sqlSession.getMapper(UserDao.class);

		Map<String, Object> params = Map.of("user_id", userId, "email", Email, "phone_number", phone_number);

		UserDto userModify = userdao.getUserById(userId);

		// 이메일 업데이트 호출
		userdao.update(params);
	}

}

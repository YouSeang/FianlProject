package kr.soft.study.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import kr.soft.study.dao.UserDao;
import kr.soft.study.dto.UserDto;

@Component
public class UserLogin implements UCommand {

	private SqlSession sqlSession;
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public UserLogin(SqlSession sqlSession, BCryptPasswordEncoder passwordEncoder){
		this.sqlSession = sqlSession;
		this.passwordEncoder = passwordEncoder;
	}
	
	@Override
	public void execute(Model model) {
		
		System.out.println("UserLogin execute()");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		UserDto user = userDao.getUserById(user_id);
		
		if (user == null) {
			// 사용자 ID가 존재하지 않는 경우
			System.out.println("Invalid ID");
			session.setAttribute("loginResult", "invalidId");
		} else if (!passwordEncoder.matches(password, user.getPassword())) {
			// 비밀번호가 일치하지 않는 경우
			System.out.println("Invalid Password");
			session.setAttribute("loginResult", "invalidPassword");
		} else {
			// 로그인 성공
			System.out.println("Login successful");
			session.setAttribute("user", user);
			session.setAttribute("loginResult", "success");
			session.setAttribute("userRole", user.getRole());
		}
	}
}

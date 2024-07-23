package kr.soft.study.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import kr.soft.study.dao.UserDao;
import kr.soft.study.dto.UserDto;

@Component
public class UserSignup implements UCommand {

    private SqlSession sqlSession;
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public UserSignup(SqlSession sqlSession, BCryptPasswordEncoder passwordEncoder){
        this.sqlSession = sqlSession;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void execute(Model model) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");

        UserDto userDto = (UserDto) map.get("userDto");
        String encryptedPassword = passwordEncoder.encode(userDto.getPassword());
        userDto.setPassword(encryptedPassword);

        UserDao userDao = sqlSession.getMapper(UserDao.class);
        userDao.Join(userDto.getUser_id(), userDto.getName(), userDto.getEmail(), userDto.getPassword());
    }
}

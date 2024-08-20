package kr.soft.study.service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.soft.study.dao.UserDao;
import kr.soft.study.dto.UserDto;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	// 이메일로 사용자 조회
	public UserDto findUserByEmail(String email) {
		return userDao.findUserByEmail(email);
	}

	// 비밀번호 재설정 토큰 생성
	public String createPasswordResetToken(String userId) {
		String token = UUID.randomUUID().toString();
		Map<String, Object> params = new HashMap<>();
		params.put("user_id", userId);
		params.put("token", token);
		userDao.savePasswordResetToken(params);
		return token;
	}

	// 토큰을 통한 사용자 유효성 검사
	public UserDto validatePasswordResetToken(String token) {
		return userDao.findUserByResetToken(token);
	}

	// 새로운 비밀번호 업데이트
	public void updatePassword(String userId, String encodedPassword) {
		Map<String, Object> params = new HashMap<>();
		params.put("user_id", userId);
		params.put("password", encodedPassword);
		userDao.updatePassword(params);
	}
}

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

	// �̸��Ϸ� ����� ��ȸ
	public UserDto findUserByEmail(String email) {
		return userDao.findUserByEmail(email);
	}

	// ��й�ȣ �缳�� ��ū ����
	public String createPasswordResetToken(String userId) {
		String token = UUID.randomUUID().toString();
		Map<String, Object> params = new HashMap<>();
		params.put("user_id", userId);
		params.put("token", token);
		userDao.savePasswordResetToken(params);
		return token;
	}

	// ��ū�� ���� ����� ��ȿ�� �˻�
	public UserDto validatePasswordResetToken(String token) {
		return userDao.findUserByResetToken(token);
	}

	// ���ο� ��й�ȣ ������Ʈ
	public void updatePassword(String userId, String encodedPassword) {
		Map<String, Object> params = new HashMap<>();
		params.put("user_id", userId);
		params.put("password", encodedPassword);
		userDao.updatePassword(params);
	}
}

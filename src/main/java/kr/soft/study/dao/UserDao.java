package kr.soft.study.dao;

import java.util.Map;

import kr.soft.study.dto.UserDto;

public interface UserDao {

	// ȸ������
	public void Join(String user_id, String name, String email, String phone_number, String password);

	// �α���
	public UserDto getUserById(String user_id);

	// ���� ����
	public void update(Map<String, Object> params);

	// �̸��Ϸ� ����� ��ȸ
	UserDto findUserByEmail(String email);

	// ��й�ȣ �缳�� ��ū ����
	void savePasswordResetToken(Map<String, Object> params);

	// ��ū�� ���� ����� ��ȸ
	UserDto findUserByResetToken(String token);

	// ��й�ȣ ������Ʈ
	void updatePassword(Map<String, Object> params);

}

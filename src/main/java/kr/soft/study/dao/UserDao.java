package kr.soft.study.dao;

import java.util.List;
import java.util.Map;

import kr.soft.study.dto.UserDto;

public interface UserDao {

	// ȸ������
	public void Join(String user_id, String name, String email, String phone_number, String password);

	// �α���
	public UserDto getUserById(String user_id);

	// ���� ����
	public void update(Map<String, Object> params);

	// ��� ����� ��������
    public List<UserDto> getAllUsers();
   
    
}

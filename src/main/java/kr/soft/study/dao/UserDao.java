package kr.soft.study.dao;

import java.util.ArrayList;

import kr.soft.study.dto.UserDto;

public interface UserDao {

	// ȸ������
	public void Join(String user_id, String name, String email, String password);

	// �α���
	public UserDto getUserById(String user_id);

}

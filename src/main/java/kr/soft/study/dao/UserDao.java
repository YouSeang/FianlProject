package kr.soft.study.dao;

import kr.soft.study.dto.UserDto;

public interface UserDao {
	
	// 회원가입
	public void Join(String user_id, String name, String email, String password);
	
	// 로그인
	public UserDto getUserById(String user_id);

}

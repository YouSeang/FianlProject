package kr.soft.study.dao;

import java.util.List;
import java.util.Map;

import kr.soft.study.dto.UserDto;

public interface UserDao {

	// 회원가입
	public void Join(String user_id, String name, String email, String phone_number, String password);

	// 로그인
	public UserDto getUserById(String user_id);

	// 정보 수정
	public void update(Map<String, Object> params);

	// 모든 사용자 가져오기
    public List<UserDto> getAllUsers();
   
    
}

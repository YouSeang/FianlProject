package kr.soft.study.dao;

import java.util.Map;

import kr.soft.study.dto.UserDto;

public interface UserDao {

	// 회원가입
	public void Join(String user_id, String name, String email, String phone_number, String password);

	// 로그인
	public UserDto getUserById(String user_id);

	// 정보 수정
	public void update(Map<String, Object> params);

	// 이메일로 사용자 조회
	UserDto findUserByEmail(String email);

	// 비밀번호 재설정 토큰 저장
	void savePasswordResetToken(Map<String, Object> params);

	// 토큰을 통해 사용자 조회
	UserDto findUserByResetToken(String token);

	// 비밀번호 업데이트
	void updatePassword(Map<String, Object> params);

}

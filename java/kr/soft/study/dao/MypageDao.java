package kr.soft.study.dao;

import java.util.ArrayList;

import kr.soft.study.dto.MypageDto;

public interface MypageDao {
	
	// �� ���� ��������
	public ArrayList<MypageDto> myInfomation(String user_id);
	
	public MypageDto getCoupon(String userId);

}

package kr.soft.study.dao;

import java.util.ArrayList;

import kr.soft.study.dto.MypageDto;

public interface MypageDao {
	
	// 내 정보 가져오기
	public ArrayList<MypageDto> myInfomation(String user_id);
	
	public MypageDto getCoupon(String userId);

}

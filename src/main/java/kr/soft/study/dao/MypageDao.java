package kr.soft.study.dao;

import java.util.ArrayList;

import kr.soft.study.dto.MypageDto;

public interface MypageDao {

	// 내 정보 가져오기
	public ArrayList<MypageDto> myInfomation(String user_id);
	
	// 현재 사용가능한 총 포인트 구하기
	 int getUserTotalPoints(String user_id);
	 
	// 사용안한 쿠폰 개수 가져오기
	public MypageDto getCoupon(String user_id);

	// 포인트 상세내역 가져오기
	ArrayList<MypageDto> getUserPoints(String user_id);
	
}

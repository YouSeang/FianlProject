package kr.soft.study.dao;

import java.util.ArrayList;
import java.util.Map;

import kr.soft.study.dto.CouponDto;

public interface CouponDao {

	// 쿠폰 목록 가져오기
	public ArrayList<CouponDto> getCoupon();

	// 쿠폰 구매 이력 넣기
	void insertUserCoupon(Map<String, Object> map);

	// 쿠폰 추가하기
	void addCoupon(String couponType, String couponImage);

}

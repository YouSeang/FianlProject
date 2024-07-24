package kr.soft.study.dao;

import java.util.ArrayList;

import kr.soft.study.dto.CouponDto;

public interface CouponDao {

	// 쿠폰 목록 가져오기
	public ArrayList<CouponDto> getCoupon();
}

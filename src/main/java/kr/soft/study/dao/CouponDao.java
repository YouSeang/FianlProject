package kr.soft.study.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.soft.study.dto.CouponDto;

public interface CouponDao {

	// 쿠폰 목록 가져오기
	public ArrayList<CouponDto> getCoupon();

	// 쿠폰 구매 이력 넣기
	void insertUserCoupon(Map<String, Object> map);

	// 쿠폰 추가하기
	void addCoupon(@Param("coupon_type") String coupon_type, @Param("coupon_image") String coupon_image);

	// 쿠폰 수정하기
	void updateCoupon(@Param("couponId") int couponId, @Param("coupon_type") String coupon_type,
			@Param("coupon_image") String coupon_image);

	// 쿠폰 삭제하기
	void deleteCoupon(int couponId);
}

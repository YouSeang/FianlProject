package kr.soft.study.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.soft.study.dto.CouponDto;

public interface CouponDao {

	// ���� ��� ��������
	public ArrayList<CouponDto> getCoupon();

	// ���� ���� �̷� �ֱ�
	void insertUserCoupon(Map<String, Object> map);

	// ���� �߰��ϱ�
	void addCoupon(@Param("coupon_type") String coupon_type, @Param("coupon_image") String coupon_image);

	// ���� �����ϱ�
	void updateCoupon(@Param("couponId") int couponId, @Param("coupon_type") String coupon_type,
			@Param("coupon_image") String coupon_image);

	// ���� �����ϱ�
	void deleteCoupon(int couponId);
}

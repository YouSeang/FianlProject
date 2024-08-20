package kr.soft.study.dao;

import java.util.ArrayList;
import java.util.Map;

import kr.soft.study.dto.CouponDto;

public interface CouponDao {

	// ���� ��� ��������
	public ArrayList<CouponDto> getCoupon();

	// ���� ���� �̷� �ֱ�
	void insertUserCoupon(Map<String, Object> map);

	// ���� �߰��ϱ�
	void addCoupon(String couponType, String couponImage);

}

package kr.soft.study.dao;

import java.util.ArrayList;

import kr.soft.study.dto.MypageDto;

public interface MypageDao {

	// �� ���� ��������
	public ArrayList<MypageDto> myInfomation(String user_id);
	
	// ���� ��밡���� �� ����Ʈ ���ϱ�
	 int getUserTotalPoints(String user_id);
	 
	// ������ ���� ���� ��������
	public MypageDto getCoupon(String user_id);

	// ����Ʈ �󼼳��� ��������
	ArrayList<MypageDto> getUserPoints(String user_id);
	
}

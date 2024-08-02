package kr.soft.study.dao;

import java.util.List;

import kr.soft.study.dto.GuideDto;

public interface AdminGuideDao {

	// ��� ������ ��������
	List<GuideDto> getAllGuides();

	void addGuide(GuideDto guide);

	void updateGuide(GuideDto guide);

	void deleteGuide(int id);

}

package kr.soft.study.dao;

import java.util.List;

import kr.soft.study.dto.GuideDto;

public interface AdminGuideDao {

	// 모든 예방요령 가져오기
	List<GuideDto> getAllGuides();

	void addGuide(GuideDto guide);

	void updateGuide(GuideDto guide);

	void deleteGuide(int id);

}

package kr.soft.study.dao;

import java.util.List;

import kr.soft.study.dto.SmishingDto;

public interface AdminSmishingDao {

	// 모든 스미싱 케이스 가져오기
	List<SmishingDto> getAllSmishings();

	// 스미싱 케이스 추가
	void addSmishing(SmishingDto smishingCase);

	// 업데이트
	void updateSmishing(SmishingDto smishingCase);

	// 삭제
	void deleteSmishing(int id);
	
	// 해당 케이스의 정보가져오기
    SmishingDto getSmishingByType(String type);

}

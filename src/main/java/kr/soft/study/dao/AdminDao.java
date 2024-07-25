package kr.soft.study.dao;

import java.util.Map;

public interface AdminDao {
	
	void insertScenario(Map<String, Object> paramMap); // 시나리오 삽입
    int countByScenarioName(String scenarioName); // 시나리오 이름으로 오디오 파일 존재 여부 확인
    void updateAudioFile(Map<String, Object> paramMap); // 오디오 파일 업데이트(기존에 오디오 파일이 있다면)
    void insertAudioFile(Map<String, Object> paramMap); // 오디오 파일 삽입(없다면)
}

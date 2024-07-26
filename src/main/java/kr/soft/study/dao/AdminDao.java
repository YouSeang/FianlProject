package kr.soft.study.dao;

import kr.soft.study.dto.Scenario;

import java.util.List;
import java.util.Map;

public interface AdminDao {

    void insertScenario(Map<String, Object> paramMap); // 시나리오 삽입

    int countByScenarioName(String scenarioName); // 시나리오 이름으로 오디오 파일 존재 여부 확인

    void updateAudioFile(Map<String, Object> paramMap); // 오디오 파일 업데이트(기존에 오디오 파일이 있다면)

    void insertAudioFile(Map<String, Object> paramMap); // 오디오 파일 삽입(없다면)

    void deleteAudioFile(Map<String, Object> paramMap); // 오디오 파일 삭제

    void deleteAudioFilesByScenarioId(int scenarioId); // 시나리오 ID로 오디오 파일 삭제

    int getMaxAudioIdByScenarioName(String scenarioName); // 시나리오 이름으로 최대 오디오 ID 가져오기

    List<Scenario> getAllScenarios(); // 모든 시나리오 가져오기

    Scenario getScenarioById(int scenarioId); // 시나리오 ID로 시나리오 가져오기

    void updateScenario(Map<String, Object> paramMap); // 시나리오 업데이트

    void deleteScenario(int scenarioId); // 시나리오 삭제
}

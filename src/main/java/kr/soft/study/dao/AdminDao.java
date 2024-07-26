package kr.soft.study.dao;

import kr.soft.study.dto.Scenario;

import java.util.List;
import java.util.Map;

public interface AdminDao {

    void insertScenario(Map<String, Object> paramMap); // �ó����� ����

    int countByScenarioName(String scenarioName); // �ó����� �̸����� ����� ���� ���� ���� Ȯ��

    void updateAudioFile(Map<String, Object> paramMap); // ����� ���� ������Ʈ(������ ����� ������ �ִٸ�)

    void insertAudioFile(Map<String, Object> paramMap); // ����� ���� ����(���ٸ�)

    void deleteAudioFile(Map<String, Object> paramMap); // ����� ���� ����

    void deleteAudioFilesByScenarioId(int scenarioId); // �ó����� ID�� ����� ���� ����

    int getMaxAudioIdByScenarioName(String scenarioName); // �ó����� �̸����� �ִ� ����� ID ��������

    List<Scenario> getAllScenarios(); // ��� �ó����� ��������

    Scenario getScenarioById(int scenarioId); // �ó����� ID�� �ó����� ��������

    void updateScenario(Map<String, Object> paramMap); // �ó����� ������Ʈ

    void deleteScenario(int scenarioId); // �ó����� ����
}

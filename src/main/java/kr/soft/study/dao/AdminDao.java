package kr.soft.study.dao;

import java.util.Map;

public interface AdminDao {
	
	void insertScenario(Map<String, Object> paramMap); // �ó����� ����
    int countByScenarioName(String scenarioName); // �ó����� �̸����� ����� ���� ���� ���� Ȯ��
    void updateAudioFile(Map<String, Object> paramMap); // ����� ���� ������Ʈ(������ ����� ������ �ִٸ�)
    void insertAudioFile(Map<String, Object> paramMap); // ����� ���� ����(���ٸ�)
}

package kr.soft.study.dao;

import java.util.List;

import kr.soft.study.dto.SmishingDto;

public interface AdminSmishingDao {

	// ��� ���̽� ���̽� ��������
	List<SmishingDto> getAllSmishings();

	// ���̽� ���̽� �߰�
	void addSmishing(SmishingDto smishingCase);

	// ������Ʈ
	void updateSmishing(SmishingDto smishingCase);

	// ����
	void deleteSmishing(int id);
	
	// �ش� ���̽��� ������������
    SmishingDto getSmishingByType(String type);

}

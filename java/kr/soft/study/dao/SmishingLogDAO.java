package kr.soft.study.dao;

import java.time.LocalDateTime;
import org.apache.ibatis.annotations.Param;
import kr.soft.study.dto.SmishingLogDto;

public interface SmishingLogDAO {

	// ���� �߼��ߴ��� Ȯ��
	boolean hasSentToday(@Param("userId") String userId, @Param("startOfDay") LocalDateTime startOfDay);

	// �߼� �α� ����
	void saveLog(@Param("userId") String userId);
}

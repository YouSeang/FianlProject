package kr.soft.study.dao;

import java.time.LocalDateTime;
import org.apache.ibatis.annotations.Param;
import kr.soft.study.dto.SmishingLogDto;

public interface SmishingLogDAO {

	// 오늘 발송했는지 확인
	boolean hasSentToday(@Param("userId") String userId, @Param("startOfDay") LocalDateTime startOfDay);

	// 발송 로그 저장
	void saveLog(@Param("userId") String userId);
}

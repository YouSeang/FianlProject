package kr.soft.study.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.soft.study.dto.AttendanceDto;

public interface AttendanceDao {

	// 현재까지 출석한 목록
	List<AttendanceDto> getAttendance(@Param("userId") String userId);

	// 오늘 출석여부 확인
	AttendanceDto findByUserIdAndDate(@Param("userId") String userId, @Param("date") LocalDate date);

	// 오늘 출석하면 넣기
	void insertAttendance(@Param("userId") String userId, @Param("date") LocalDate date);
}
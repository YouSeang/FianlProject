package kr.soft.study.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.soft.study.dto.AttendanceDto;

public interface AttendanceDao {

	// ������� �⼮�� ���
	List<AttendanceDto> getAttendance(@Param("userId") String userId);

	// ���� �⼮���� Ȯ��
	AttendanceDto findByUserIdAndDate(@Param("userId") String userId, @Param("date") LocalDate date);

	// ���� �⼮�ϸ� �ֱ�
	void insertAttendance(@Param("userId") String userId, @Param("date") LocalDate date);
}
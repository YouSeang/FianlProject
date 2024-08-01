package kr.soft.study.command;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import kr.soft.study.dao.AttendanceDao;
import kr.soft.study.dto.AttendanceDto;
import kr.soft.study.util.Constant;

@Component
public class AttendanceCommand implements UCommand {

	@Override
	public void execute(Model model) {
		try {
			String userId = (String) model.getAttribute("userId");
			SqlSession sqlSession = Constant.sqlSession;
			AttendanceDao attendanceDao = sqlSession.getMapper(AttendanceDao.class);

			List<AttendanceDto> attendance_list = attendanceDao.getAttendance(userId);
			model.addAttribute("attendance_list", attendance_list);
		} catch (Exception e) {
			System.err.println("Error in AttendanceCommand: " + e.getMessage());
			throw e; // 예외를 다시 던져서 호출자에게 알림
		}
	}
}
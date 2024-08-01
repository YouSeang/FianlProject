package kr.soft.study.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.soft.study.command.AttendanceCommand;
import kr.soft.study.dao.AttendanceDao;
import kr.soft.study.dto.AttendanceDto;
import kr.soft.study.dto.UserDto;
import kr.soft.study.util.Constant;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AttendanceController {
	@Autowired
	private AttendanceCommand command;

	private SqlSession sqlSession;

	@Autowired
	public AttendanceController(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}

	@RequestMapping("/board/attendance")
	public String event(Model model) {
		System.out.println("event");
		return "board/attendance";
	}

	@GetMapping("/getAttendance")
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> getAttendance(HttpSession session, Model model) {
		System.out.println("getAttendance");
		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
		}

		String userId = user.getUser_id();
		model.addAttribute("userId", userId);

		try {
			command.execute(model);
			List<AttendanceDto> attendances = (List<AttendanceDto>) model.getAttribute("attendance_list");

			List<Map<String, Object>> events = new ArrayList<>();
			for (AttendanceDto attendance : attendances) {
				Map<String, Object> event = new HashMap<>();
				event.put("title", "출석체크");
				event.put("start", attendance.getCheck_in_date().toString());
				events.add(event);
			}
			return ResponseEntity.ok(events);
		} catch (Exception e) {
			System.err.println("Error in getAttendance: " + e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/checkAttendance")
	@ResponseBody
	public ResponseEntity<String> checkAttendance(HttpSession session, @RequestParam("date") String dateStr) {
	    System.out.println("/checkAttendance");

	    UserDto user = (UserDto) session.getAttribute("user");
	    if (user == null) {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not logged in");
	    }

	    String userId = user.getUser_id();
	    LocalDate today = LocalDate.now(); // 서버의 현재 날짜를 사용
	    LocalDate tomorrow = today.plusDays(1); // 현재 날짜보다 하루를 더한 날짜
	    System.out.println(userId + " 투데이: " + today +  " 내일: " + tomorrow);

	    LocalDate date;
	  
	    try {
	        date = LocalDate.parse(dateStr); // 클라이언트에서 보내는 yyyy-MM-dd 형식의 날짜를 파싱
	        System.out.println(date);
	    } catch (Exception e) {
	        System.err.println("Error parsing date: " + e.getMessage());
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid date format");
	    }

	    if (!date.isEqual(today)) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Attendance can only be checked for today");
	    }

	    try {
	        AttendanceDao dao = sqlSession.getMapper(AttendanceDao.class);

	        // 출석체크 여부 확인
	        AttendanceDto existingAttendance = dao.findByUserIdAndDate(userId, tomorrow);
	        if (existingAttendance != null) {
	            System.out.println("이미 출석체크가 완료된 날짜: " + existingAttendance.getCheck_in_date());
	            return ResponseEntity.status(HttpStatus.CONFLICT).body("Already checked in today");
	        }

	        // 출석체크 기록 추가
	        dao.insertAttendance(userId, tomorrow);
	        System.out.println("Attendance checked successfully");
	        return ResponseEntity.ok("Attendance checked successfully");
	    } catch (Exception e) {
	        System.err.println("Error in checkAttendance: " + e.getMessage());
	        e.printStackTrace(); // 예외의 스택 트레이스를 출력
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error checking attendance");
	    }
	}
}
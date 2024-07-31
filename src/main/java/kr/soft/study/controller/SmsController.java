package kr.soft.study.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.soft.study.command.PCommand;
import kr.soft.study.dao.SmishingLogDAO;
import kr.soft.study.dto.UserDto;
import kr.soft.study.service.MessageService;
import kr.soft.study.util.Constant;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

@Controller
public class SmsController {

	private PCommand pointsCommand;
	private SqlSession sqlSession;
	private final MessageService messageService;
	private final SmishingLogDAO smishingLogDAO;

	@Autowired
	public SmsController(SqlSession sqlSession, PCommand pointsCommand, SmishingLogDAO smishingLogDAO) {
		this.messageService = new MessageService();
		this.pointsCommand = pointsCommand;
		this.smishingLogDAO = smishingLogDAO;
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}

	/*
	 * @GetMapping("/sendSms") public String showSmsForm() { return "sendSms"; }
	 */
	/*
	 * @PostMapping("/sendSms") public String sendSms(@RequestParam("to") String
	 * to, @RequestParam("text") String text,
	 * 
	 * @RequestParam("couponImageUrl") String couponImageUrl, Model model) { try {
	 * messageService.sendMessage(to, text, couponImageUrl);
	 * model.addAttribute("message", "SMS 발송 성공!"); } catch (Exception e) {
	 * model.addAttribute("message", "SMS 발송 실패: " + e.getMessage()); } return
	 * "sendSms"; }
	 */

	/*
	 * @GetMapping("/sendMms") public String showMmsForm() { return "sendMms"; }
	 */

	// 쿠폰재발송을 위한
	@GetMapping("/resendCouponForm")
	public String showResendCouponForm(@RequestParam("couponId") String couponId, Model model) {
		model.addAttribute("couponId", couponId);
		return "mypage/resendCouponForm";
	}

	@PostMapping("/sendMms")
	public String sendMms(HttpSession session, @RequestParam("to") String to, @RequestParam("text") String text,
			@RequestParam("selectedCouponId") String selectedCouponId,
			@RequestParam("couponImageUrl") String couponImageUrl, Model model, RedirectAttributes redirectAttributes) {
		String imageToSend;

		// 선택된 쿠폰 ID에 따라 전송할 이미지 결정
		switch (selectedCouponId) {
		case "1":
			imageToSend = "커피쿠폰.jpg"; // 쿠폰 ID 1에 대한 이미지
			break;
		case "2":
			imageToSend = "적금쿠폰.jpg"; // 쿠폰 ID 2에 대한 이미지
			break;
		// 추가 쿠폰 ID와 이미지 매핑
		case "3":
			imageToSend = "CU쿠폰.jpg"; // 쿠폰 ID 2에 대한 이미지
			break;
		default:
			imageToSend = "커피쿠폰.jpg"; // 기본 이미지
			break;
		}

		// 파일 경로를 클래스패스로 변환
		ClassLoader classLoader = getClass().getClassLoader();
		java.net.URL resource = classLoader.getResource(imageToSend);

		if (resource == null) {
			redirectAttributes.addFlashAttribute("message", "MMS 발송 실패: 파일이 존재하지 않습니다 - " + imageToSend);
			redirectAttributes.addFlashAttribute("success", false);
			return "redirect:/couponshop";
		}

		try {
			SingleMessageSentResponse response = messageService.sendMms(session, to, text, imageToSend);
			redirectAttributes.addFlashAttribute("message", "선택하신 쿠폰이 발송되었습니다");
			redirectAttributes.addFlashAttribute("success", true);
		} catch (IOException e) {
			redirectAttributes.addFlashAttribute("message", "파일 업로드 실패: " + e.getMessage());
			redirectAttributes.addFlashAttribute("success", false);
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", "MMS 발송 실패: " + e.getMessage());
			redirectAttributes.addFlashAttribute("success", false);
		}

		return "redirect:/couponshop";
	}

	// 스미싱문자
	@PostMapping("/sendSmishing")
	@ResponseBody
	public Map<String, Object> sendSmishing(@RequestParam("to") String phoneNumber,
			@RequestParam("text") String messageText, @RequestParam("buttonType") String buttonType,
			@RequestParam("pointReason") String pointReason, HttpSession session) {
		Map<String, Object> response = new HashMap<>();

		// 로그인 확인
		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null || user.getUser_id() == null) {
			response.put("isSent", false);
			response.put("message", "로그인 후 이용해주세요");
			return response;
		}

		String userId = user.getUser_id();
		System.out.println("User ID: " + userId); // 세션에 사용자 ID 출력

		/*
		 * // 오늘 발송했는지 확인 LocalDateTime startOfDay = LocalDateTime.of(LocalDate.now(),
		 * LocalTime.MIDNIGHT); boolean hasSentToday =
		 * smishingLogDAO.hasSentToday(userId, startOfDay);
		 * System.out.println("Has sent today: " + hasSentToday);
		 * 
		 * if (hasSentToday) { response.put("isSent", false); response.put("message",
		 * "스미싱 체험은 하루에 한 번만 가능합니다."); return response; }
		 */

		String imageUrl;
		String adminText;
		if ("delivery".equals(buttonType)) {
			imageUrl = "http://211.37.179.32:8080/smishing";
			adminText = "[KB국민은행] 주문하신 물품이 오늘 도착예정입니다.";
		} else if ("invitation".equals(buttonType)) {
			imageUrl = "http://211.37.179.32:8080/smishing";
			adminText = "[KB국민은행] 저희의 결혼식에 와서 함께 축하해주세요!";
		} else {
			throw new IllegalArgumentException("Invalid button type");
		}

		// 문자 메시지 발송
		boolean isSent = false;
		try {
			isSent = messageService.sendSmishing(phoneNumber, messageText, imageUrl, adminText);
			System.out.println("Message sent: " + isSent);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("isSent", false);
			response.put("message", "문자 발송에 실패했습니다. 오류: " + e.getMessage());
			return response;
		}

		// 문자 발송 결과에 따른 응답 생성
		response.put("isSent", isSent);

		if (isSent) {
			// 문자 발송 이력 저장
			smishingLogDAO.saveLog(userId);

			Map<String, Object> map = new HashMap<>();
			map.put("userId", user.getUser_id());
			map.put("pointReason", pointReason);

			String result = pointsCommand.execute(map);
			response.put("pointUpdateResult", result);
		}

		return response;
	}

	@GetMapping("/smishing")
	public String showSmishingImage(@RequestParam(value = "buttonType", required = false) String buttonType,
			Model model) {
		String imageUrl;
		if ("delivery".equals(buttonType)) {
			imageUrl = "스미싱예방.jpg";
		} else if ("invitation".equals(buttonType)) {
			imageUrl = "스미싱예방.jpg";
		} else {
			// 기본 이미지 또는 오류 처리
			imageUrl = "스미싱예방.jpg";
		}

		model.addAttribute("imageUrl", imageUrl);
		return "voice/smishingimage";
	}
}
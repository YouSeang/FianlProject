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
	 * model.addAttribute("message", "SMS �߼� ����!"); } catch (Exception e) {
	 * model.addAttribute("message", "SMS �߼� ����: " + e.getMessage()); } return
	 * "sendSms"; }
	 */

	/*
	 * @GetMapping("/sendMms") public String showMmsForm() { return "sendMms"; }
	 */

	// ������߼��� ����
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

		// ���õ� ���� ID�� ���� ������ �̹��� ����
		switch (selectedCouponId) {
		case "1":
			imageToSend = "Ŀ������.jpg"; // ���� ID 1�� ���� �̹���
			break;
		case "2":
			imageToSend = "��������.jpg"; // ���� ID 2�� ���� �̹���
			break;
		// �߰� ���� ID�� �̹��� ����
		case "3":
			imageToSend = "CU����.jpg"; // ���� ID 2�� ���� �̹���
			break;
		default:
			imageToSend = "Ŀ������.jpg"; // �⺻ �̹���
			break;
		}

		// ���� ��θ� Ŭ�����н��� ��ȯ
		ClassLoader classLoader = getClass().getClassLoader();
		java.net.URL resource = classLoader.getResource(imageToSend);

		if (resource == null) {
			redirectAttributes.addFlashAttribute("message", "MMS �߼� ����: ������ �������� �ʽ��ϴ� - " + imageToSend);
			redirectAttributes.addFlashAttribute("success", false);
			return "redirect:/couponshop";
		}

		try {
			SingleMessageSentResponse response = messageService.sendMms(session, to, text, imageToSend);
			redirectAttributes.addFlashAttribute("message", "�����Ͻ� ������ �߼۵Ǿ����ϴ�");
			redirectAttributes.addFlashAttribute("success", true);
		} catch (IOException e) {
			redirectAttributes.addFlashAttribute("message", "���� ���ε� ����: " + e.getMessage());
			redirectAttributes.addFlashAttribute("success", false);
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", "MMS �߼� ����: " + e.getMessage());
			redirectAttributes.addFlashAttribute("success", false);
		}

		return "redirect:/couponshop";
	}

	// ���̹̽���
	@PostMapping("/sendSmishing")
	@ResponseBody
	public Map<String, Object> sendSmishing(@RequestParam("to") String phoneNumber,
			@RequestParam("text") String messageText, @RequestParam("buttonType") String buttonType,
			@RequestParam("pointReason") String pointReason, HttpSession session) {
		Map<String, Object> response = new HashMap<>();

		// �α��� Ȯ��
		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null || user.getUser_id() == null) {
			response.put("isSent", false);
			response.put("message", "�α��� �� �̿����ּ���");
			return response;
		}

		String userId = user.getUser_id();
		System.out.println("User ID: " + userId); // ���ǿ� ����� ID ���

		/*
		 * // ���� �߼��ߴ��� Ȯ�� LocalDateTime startOfDay = LocalDateTime.of(LocalDate.now(),
		 * LocalTime.MIDNIGHT); boolean hasSentToday =
		 * smishingLogDAO.hasSentToday(userId, startOfDay);
		 * System.out.println("Has sent today: " + hasSentToday);
		 * 
		 * if (hasSentToday) { response.put("isSent", false); response.put("message",
		 * "���̽� ü���� �Ϸ翡 �� ���� �����մϴ�."); return response; }
		 */

		String imageUrl;
		String adminText;
		if ("delivery".equals(buttonType)) {
			imageUrl = "http://211.37.179.32:8080/smishing";
			adminText = "[KB��������] �ֹ��Ͻ� ��ǰ�� ���� ���������Դϴ�.";
		} else if ("invitation".equals(buttonType)) {
			imageUrl = "http://211.37.179.32:8080/smishing";
			adminText = "[KB��������] ������ ��ȥ�Ŀ� �ͼ� �Բ� �������ּ���!";
		} else {
			throw new IllegalArgumentException("Invalid button type");
		}

		// ���� �޽��� �߼�
		boolean isSent = false;
		try {
			isSent = messageService.sendSmishing(phoneNumber, messageText, imageUrl, adminText);
			System.out.println("Message sent: " + isSent);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("isSent", false);
			response.put("message", "���� �߼ۿ� �����߽��ϴ�. ����: " + e.getMessage());
			return response;
		}

		// ���� �߼� ����� ���� ���� ����
		response.put("isSent", isSent);

		if (isSent) {
			// ���� �߼� �̷� ����
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
			imageUrl = "���̽̿���.jpg";
		} else if ("invitation".equals(buttonType)) {
			imageUrl = "���̽̿���.jpg";
		} else {
			// �⺻ �̹��� �Ǵ� ���� ó��
			imageUrl = "���̽̿���.jpg";
		}

		model.addAttribute("imageUrl", imageUrl);
		return "voice/smishingimage";
	}
}
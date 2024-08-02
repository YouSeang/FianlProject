package kr.soft.study.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.soft.study.command.CouponCommand;
import kr.soft.study.command.PCommand;
import kr.soft.study.dto.UserDto;

@Controller
public class PointsController {

	private PCommand pointsCommand;

	private CouponCommand couponCommand;

	@Autowired
	public PointsController(PCommand pointsCommand, CouponCommand couponCommand) {
		this.pointsCommand = pointsCommand;
		this.couponCommand = couponCommand;
	}

	@RequestMapping(value = "/updatePoints", method = RequestMethod.POST)
	@ResponseBody
	public String updatePoints(HttpSession session, @RequestParam("pointReason") String pointReason) {
		System.out.println("��������� ����?");
		UserDto user = (UserDto) session.getAttribute("user");
		if (user != null && user.getUser_id() != null) {
			System.out.println("User ID: " + user.getUser_id()); // ���ǿ� ����� ID ���
			Map<String, Object> map = new HashMap<>();
			map.put("userId", user.getUser_id());
			map.put("pointReason", pointReason); // �߰��� �κ�
			return pointsCommand.execute(map);
		} else {
			System.out.println("���ǿ� ���̵� ����");
			return "User is not logged in.";
		}
	}

	// ����Ʈ ��� �� �������� �߰�
	@RequestMapping(value = "/subtractPoints", method = RequestMethod.POST)
	@ResponseBody
	public String subtractPoints(HttpSession session, @RequestParam("pointReason") String pointReason,
			@RequestParam("couponId") int couponId) {
		UserDto user = (UserDto) session.getAttribute("user");
		if (user != null && user.getUser_id() != null) {
			Map<String, Object> map = new HashMap<>();
			map.put("userId", user.getUser_id());
			map.put("pointReason", pointReason);
			String result = pointsCommand.useExecute(map);
			if (result.contains("successfully")) {
				// ���� �̷� ����
				String couponResult = couponCommand.saveUserCoupon(user.getUser_id(), couponId);
				if (couponResult.equals("success")) {
					return "Points subtracted and coupon issued successfully.";
				} else {
					return "Failed to save coupon history: " + couponResult;
				}
			} else {
				return "Failed to subtract points: " + result;
			}
		} else {
			return "User is not logged in.";
		}
	}
}

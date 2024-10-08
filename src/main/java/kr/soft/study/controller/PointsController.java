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

	@RequestMapping(value = "/updatePoints", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String updatePoints(HttpSession session, @RequestParam("pointReason") String pointReason) {
		System.out.println("여기까지는 오나?");
		UserDto user = (UserDto) session.getAttribute("user");
		if (user != null && user.getUser_id() != null) {
			System.out.println("User ID: " + user.getUser_id()); // 세션에 사용자 ID 출력
			Map<String, Object> map = new HashMap<>();
			map.put("userId", user.getUser_id());
			map.put("pointReason", pointReason); // 추가된 부분
			return pointsCommand.execute(map);
		} else {
			System.out.println("세션에 아이디 없음");
			return "이미 포인트가 지급되었습니다."; //이 문구 추후 수정필요할수도
		}
	}

	// 포인트 사용 및 유저쿠폰 추가
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

	        System.out.println("포인트 차감 결과: " + result); // 포인트 차감 결과 로그 출력

	        if (result.contains("success.")) {
	            // 쿠폰 이력 저장
	            String couponResult = couponCommand.saveUserCoupon(user.getUser_id(), couponId);
	            System.out.println("쿠폰 저장 결과: " + couponResult); // 쿠폰 저장 결과 로그 출력

	            if (couponResult.equals("success")) {
	                return "Points subtracted and coupon issued successfully.";
	            } else {
	                return "Failed to save coupon history: " + couponResult;
	            }
	        } else {
	            return "Failed to subtract points: " + result;
	        }
	    } else {
	        return "로그인 후 이용해주세요";
	    }
	}
}

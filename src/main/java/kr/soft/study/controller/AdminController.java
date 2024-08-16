package kr.soft.study.controller;

import kr.soft.study.command.AdminAddPhishing;
import kr.soft.study.command.AdminUpdatePhishing;
import kr.soft.study.dao.AdminDao;
import kr.soft.study.dao.CouponDao;
import kr.soft.study.dto.Scenario;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Map;

@Controller
public class AdminController {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private ServletContext context;

	@Autowired
	private AdminDao adminDao;

	// 로그인 후 관리자 페이지로 이동
	@RequestMapping("/admin/admin")
	public String adminView(Model model) {
		return "admin/admin";
	}

	// 사용자 관리 페이지
	@RequestMapping("/admin/adminUser")
	public String adminUser(Model model) {
		return "admin/adminUser";
	}

	// 시나리오 관리 페이지
	@RequestMapping("/admin/adminPhishing")
	public String adminPhishing(Model model) {
		List<Scenario> scenarios = adminDao.getAllScenarios();
		model.addAttribute("scenarios", scenarios);
		return "admin/adminPhishing";
	}

	// 시나리오 추가 처리
	@PostMapping("/admin/addScenario")
	public String addScenario(@RequestParam("scenarioName") String scenarioName,
			@RequestParam("scenarioPrompt") String scenarioPrompt,
			@RequestParam("audioFiles") List<MultipartFile> audioFiles, Model model) {
		AdminAddPhishing command = new AdminAddPhishing(adminDao, context);
		model.addAttribute("scenarioName", scenarioName);
		model.addAttribute("scenarioPrompt", scenarioPrompt);
		model.addAttribute("audioFiles", audioFiles);
		command.execute(model.asMap());

		return "redirect:/admin/adminPhishing";
	}

	// 시나리오 업데이트 처리
	@PostMapping("/admin/updateScenario")
	public String updateScenario(@RequestParam("scenarioId") int scenarioId,
			@RequestParam("scenarioName") String scenarioName, @RequestParam("scenarioPrompt") String scenarioPrompt,
			@RequestParam(value = "audioFiles", required = false) List<MultipartFile> audioFiles,
			@RequestParam(value = "existingAudioFiles", required = false) List<String> existingAudioFiles,
			Model model) {
		AdminUpdatePhishing command = new AdminUpdatePhishing(adminDao, context);
		model.addAttribute("scenarioId", scenarioId);
		model.addAttribute("scenarioName", scenarioName);
		model.addAttribute("scenarioPrompt", scenarioPrompt);
		model.addAttribute("audioFiles", audioFiles);
		model.addAttribute("existingAudioFiles", existingAudioFiles);
		command.execute(model.asMap());

		return "redirect:/admin/adminPhishing";
	}

	@PostMapping("/admin/deleteScenario")
	public String deleteScenario(@RequestParam("scenarioId") int scenarioId) {
		adminDao.deleteScenario(scenarioId);
		return "redirect:/admin/adminPhishing";
	}

	// 쿠폰 관리 페이지
	@RequestMapping("/admin/adminCoupon")
	public String adminCoupon(Model model) {
		CouponDao dao = sqlSession.getMapper(CouponDao.class);

		model.addAttribute("coupon_list", dao.getCoupon());

		return "admin/adminCoupon";
	}

	 // 쿠폰 추가 처리
    @PostMapping("/admin/addCoupon")
    public String addCoupon(@RequestParam("couponType") String couponType,
                            @RequestParam("couponImage") String couponImage,
                            Model model) {
        CouponDao dao = sqlSession.getMapper(CouponDao.class);
        dao.addCoupon(couponType, couponImage);
        return "redirect:/admin/adminCoupon";
    }
}

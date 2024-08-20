package kr.soft.study.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.soft.study.dto.GuideDto;
import kr.soft.study.service.GuideService;
import kr.soft.study.util.Constant;

/**
 * Handles requests for the application home page.
 */
@Controller
public class GuideController {

	private SqlSession sqlSession;

	@Autowired
	private GuideService guideService;

	@Autowired
	public GuideController(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}

	@RequestMapping("/board/guide")
	public String guide(Model model) {
		System.out.println("guide");

		List<GuideDto> guidelists = guideService.getAllGuides();
		model.addAttribute("guidelists", guidelists);
		return "board/guide";
	}

	// 어드민 관련
	@GetMapping("/admin/adminGuide")
	public String adminGuide(Model model) {
		List<GuideDto> guidelists = guideService.getAllGuides();
		model.addAttribute("guidelists", guidelists);
		return "admin/adminGuide";
	}

	@PostMapping("/admin/addGuide")
	public String addGuide(@RequestParam("guideTitleNew") String guideTitle,
			@RequestParam("guideContentNew") String guideContents,
			@RequestParam("guideFileNew") MultipartFile guideFile) {
		String fileName = guideFile.getOriginalFilename();
		String filePath = "path/to/save/files/" + fileName;
		try {
			guideFile.transferTo(new File(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}

		GuideDto guide = new GuideDto(0, guideTitle, guideContents, filePath);
		guideService.addGuide(guide);

		return "redirect:/admin/adminGuide"; // 관리자 목록 페이지로 리디렉션
	}

	@PostMapping("/admin/deleteGuide")
	public String deleteGuide(@RequestParam("guideId") int guideId) {
		guideService.deleteGuide(guideId);
		return "redirect:/admin/adminGuide"; // 삭제 후 관리자 목록 페이지로 리디렉션
	}

	@PostMapping("/admin/updateGuide")
	public String updateGuide(@RequestParam("guideId") int guideId, @RequestParam("guideTitle") String guideTitle,
			@RequestParam("guideContents") String guideContents,
			@RequestParam(value = "guideFile", required = false) MultipartFile guideFile) {

		String filePath = null;
		if (guideFile != null && !guideFile.isEmpty()) {
			String fileName = guideFile.getOriginalFilename();
			filePath = "path/to/save/files/" + fileName;
			try {
				guideFile.transferTo(new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		GuideDto guide = new GuideDto(guideId, guideTitle, guideContents, filePath);
		guideService.updateGuide(guide);

		return "redirect:/admin/adminGuide"; // 수정 후 관리자 목록 페이지로 리디렉션
	}
}
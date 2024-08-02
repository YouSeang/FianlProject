package kr.soft.study.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.soft.study.dto.SmishingDto;
import kr.soft.study.service.AdminSmishingService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SmishingController {

	@Autowired
	private AdminSmishingService service;

	@RequestMapping("/voice/smishing")
	public String smishing(Model model) {
		List<SmishingDto> smishingCases = service.getAllSmishings();
		model.addAttribute("scenarios", smishingCases);
		return "voice/smishing";
	}

}

package kr.soft.study.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.soft.study.dto.SmishingDto;
import kr.soft.study.service.AdminSmishingService;

@Controller
public class AdminSmishingController {

	@Autowired
	private AdminSmishingService service;

	@GetMapping("/admin/adminSmishing")
	public String adminSmishing(Model model) {
		List<SmishingDto> smishingCases = service.getAllSmishings();
		model.addAttribute("scenarios", smishingCases);
		return "admin/adminSmishing";
	}

	@PostMapping("/admin/addSmisingCase")
	public String addScenario(@RequestParam("type") String type, @RequestParam("description") String description,
			@RequestParam("imageUrl") String imageUrl) {
		SmishingDto newScenario = new SmishingDto();
		newScenario.setType(type);
		newScenario.setDescription(description);
		newScenario.setImageUrl(imageUrl);

		service.addSmishing(newScenario);
		return "redirect:/admin/adminSmishing";
	}

	/*
	 * @PostMapping("/admin/updateScenario") public String
	 * updateScenario(@RequestParam("id") int id, @RequestParam("type") String type,
	 * 
	 * @RequestParam("description") String description, @RequestParam("imageUrl")
	 * String imageUrl) { SmishingDto updatedScenario = new SmishingDto();
	 * updatedScenario.setId(id); updatedScenario.setType(type);
	 * updatedScenario.setDescription(description);
	 * updatedScenario.setImageUrl(imageUrl);
	 * 
	 * service.updateSmishing(updatedScenario); return
	 * "redirect:/admin/adminSmishing"; }
	 * 
	 * @PostMapping("/admin/deleteScenario") public String
	 * deleteScenario(@RequestParam("id") int id) { service.deleteSmishing(id);
	 * return "redirect:/admin/adminSmishing"; }
	 */
}

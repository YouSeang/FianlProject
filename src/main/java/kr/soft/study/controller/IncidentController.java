package kr.soft.study.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.soft.study.command.RecentIncidentCommand;
import kr.soft.study.util.Command;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IncidentController {

	Command command = null;

	@RequestMapping("/voice/incidentsOverview")
	public String incidentsOverview(Locale locale, Model model) {

		return "voice/incidentsOverview";
	}

	@RequestMapping("/voice/recentIncidents")
	public String recentIncidents(HttpServletRequest request, Model model) {
		System.out.println("최근사례기법 페이지");
		model.addAttribute("request", request);
		command = new RecentIncidentCommand();
		command.execute(model);
		return "voice/recentIncidents";
	}

	@RequestMapping("/voice/smishing")
	public String smishing(Model model) {

		return "voice/smishing";
	}

	@RequestMapping("/voice/voicePhishing")
	public String voicePhishing(Model model) {

		return "voice/voicePhishing";
	}

	@RequestMapping("/voice/newVoicePhishing")
	public String openVoicePhishing(Model model) {

		return "voice/newVoicePhishing";
	}

	@RequestMapping("/security/securityGuide")
	public String securityGuide(Model model) {

		return "security/securityGuide";
	}

	@RequestMapping("/security/securityTemp")
	public String securityTemp(Model model) {

		return "security/securityTemp";
	}

	// 소미추가
	@RequestMapping("/voice/messagePhishing")
	public String messagePhishing(Model model) {

		return "voice/messagePhishing";
	}

	@RequestMapping("/voice/newMessagePhishing")
	public String openMessagePhishing(Model model) {

		return "voice/newMessagePhishing";
	}

}

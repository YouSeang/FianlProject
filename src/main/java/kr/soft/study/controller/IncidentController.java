package kr.soft.study.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IncidentController {

	@RequestMapping("/voice/incidentsOverview")
	public String incidentsOverview(Locale locale, Model model) {

		return "voice/incidentsOverview";
	}

	@RequestMapping("/voice/recentIncidents")
	public String recentIncidents(Model model) {

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

}

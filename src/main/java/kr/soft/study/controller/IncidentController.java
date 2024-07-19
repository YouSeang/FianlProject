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
	
	
	/*
	 * @RequestMapping("/incidentsOverview") public String incidentsOverview(Locale
	 * locale, Model model) {
	 * 
	 * return "incidentsOverview"; }
	 */

	@RequestMapping("/recentIncidents")
	public String recentIncidents(Model model) {

		return "recentIncidents";
	}

	@RequestMapping("/smishing")
	public String smishing(Model model) {

		return "smishing";
	}

	@RequestMapping("/voicePhishing")
	public String voicePhishing(Model model) {

		return "voicePhishing";
	}

	@RequestMapping("/securityGuide")
	public String securityGuide(Model model) {

		return "securityGuide";
	}

	@RequestMapping("/securityTemp")
	public String securityTemp(Model model) {

		return "securityTemp";
	}
	
	
}

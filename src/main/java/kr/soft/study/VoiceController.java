package kr.soft.study;

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
public class VoiceController {
	
	
	@RequestMapping("/incidentsOverview")
	public String incidentsOverview(Locale locale, Model model) {
		
		return "incidentsOverview";
	}
	
	
	
	@RequestMapping("/recentIncidents")
	public String recentIncidents(Locale locale, Model model) {
		
		return "recentIncidents";
	}
	
	
	
	@RequestMapping("/smishing")
	public String smishing(Locale locale, Model model) {
		
		return "smishing";
	}
	
	@RequestMapping("/voicePhishing")
	public String voicePhishing(Locale locale, Model model) {
		
		return "voicePhishing";
	}
	
	@RequestMapping("/securityGuide")
	public String securityGuide(Locale locale, Model model) {
		
		return "securityGuide";
	}
	
	@RequestMapping("/securityTemp")
	public String securityTemp(Locale locale, Model model) {
		
		return "securityTemp";
	}
	
}

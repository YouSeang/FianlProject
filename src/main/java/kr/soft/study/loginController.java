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
public class loginController {
	
	

	@RequestMapping("/login")
	public String login(Locale locale, Model model) {
		
		return "login";
	}
	
	
	@RequestMapping("/incidentsOverview")
	public String incidentsOverview(Locale locale, Model model) {
		
		return "incidentsOverview";
	}
	
	
}

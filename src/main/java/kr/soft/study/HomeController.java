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
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping("/signup")
	public String signup(Model model) {
		System.out.println("signup");
		return "signup";
	}
	
	
	@RequestMapping("/sbjoin")
	public String sbjoin(Model model) {
		System.out.println("sbjoin");
		return "sbjoin";
	}
	
	@RequestMapping("/sbtransfer")
	public String sbexperience(Model model) {
		System.out.println("sbtransfer");
		return "sbtransfer";
	}
	@RequestMapping("/sbsavings")
	public String sbsavings(Model model) {
		System.out.println("sbtransfer");
		return "sbsavings";
	}
	@RequestMapping("/sbfund")
	public String sbfund(Model model) {
		System.out.println("sbtransfer");
		return "sbfund";
	}
	
	@RequestMapping("/ibjoin")
	public String ibjoin(Model model) {
		System.out.println("ibjoin");
		return "ibjoin";
	}
	@RequestMapping("/ibtransfer")
	public String ibexperience(Model model) {
		System.out.println("ibtransfer");
		return "ibtransfer";
	}
	@RequestMapping("/ibsavings")
	public String ibsavings(Model model) {
		System.out.println("ibtransfer");
		return "ibsavings";
	}
	@RequestMapping("/ibfund")
	public String ibfund(Model model) {
		System.out.println("ibtransfer");
		return "ibfund";
	}
	@RequestMapping("/quiz")
	public String quiz(Model model) {
		System.out.println("quiz");
		return "quiz";
	}
	@RequestMapping("/eduvideo")
	public String eduvideo(Model model) {
		System.out.println("eduvideo");
		return "eduvideo";
	}
	
}

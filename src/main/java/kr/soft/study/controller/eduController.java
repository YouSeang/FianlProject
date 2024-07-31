package kr.soft.study.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.soft.study.command.AdminVideoCommand;
import kr.soft.study.dao.VideoDao;
import kr.soft.study.util.Command;

/**
 * Handles requests for the application home page.
 */
@Controller
public class eduController {
	Command command = null;
	
	@Autowired
	private VideoDao videoDao;

	private static final Logger logger = LoggerFactory.getLogger(eduController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	@RequestMapping("/edu/sbjoin")
	public String sbjoin(Model model) {
		System.out.println("sbjoin");
		return "edu/sbjoin";
	}
	
	@RequestMapping("/edu/sbtransfer")
	public String sbexperience(Model model) {
		System.out.println("sbtransfer");
		return "edu/sbtransfer";
	}
	@RequestMapping("/edu/sbsavings2")
	public String sbsavingss(Model model) {
		System.out.println("sbtransfer");
		return "edu/sbsavings2";
	}
	@RequestMapping("/edu/sbsavings")
	public String sbsavings(Model model) {
		System.out.println("sbtransfer");
		return "edu/sbsavings";
	}
	
	@RequestMapping("/edu/ibjoin")
	public String ibjoin(Model model) {
		System.out.println("ibjoin");
		return "edu/ibjoin";
	}
	@RequestMapping("/edu/ibtransfer")
	public String ibexperience(Model model) {
		System.out.println("ibtransfer");
		return "edu/ibtransfer";
	}
	@RequestMapping("/edu/ibsavings")
	public String ibsavings(Model model) {
		System.out.println("ibtransfer");
		return "edu/ibsavings";
	}

	
	@RequestMapping("/edu/findcrime")
	public String find(Model model) {
		System.out.println("quiz");
		return "edu/findcrime";
	}
	
	@RequestMapping("/edu/eduvideo")
	public String eduVideo(HttpServletRequest request, Model model) {
		 System.out.println("±³À°¿µ»ó");
		 model.addAttribute("request", request);
		 command = new AdminVideoCommand();
	     command.execute(model);
		return "edu/eduvideo";
	}
	
	
	@RequestMapping("/game/quiz")
	public String quiz(Model model) {
		System.out.println("quiz");
		return "game/quiz";
	}
	
	
	
}

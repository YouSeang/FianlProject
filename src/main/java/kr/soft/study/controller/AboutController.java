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
public class AboutController {

	Command command = null;

	@RequestMapping("/aboutLocKB")
	public String aboutLocKB(Locale locale, Model model) {

		return "aboutLocKB";
	}

	

}

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
 * Handles requests for the application home page�׽�Ʈ.
 */
@Controller
public class mypageController {

	private static final Logger logger = LoggerFactory.getLogger(mypageController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping("/mypage")
	public String mypage(Locale locale, Model model) {

		return "mypage/mypage";
	}

	@RequestMapping("/couponshop")
	public String couponshop(Locale locale, Model model) {

		return "mypage/couponshop";
	}

	@RequestMapping("/modify")
	public String modify(Locale locale, Model model) {

		return "mypage/modify";
	}
}

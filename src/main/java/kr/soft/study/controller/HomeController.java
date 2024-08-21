package kr.soft.study.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.soft.study.dao.VideoDao;
import kr.soft.study.dto.VideoDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
    private VideoDao videoDao;
	
		  @RequestMapping(value = "/", method = RequestMethod.GET) public String
		  home(Locale locale, Model model) {
		  logger.info("Welcome home! The client locale is {}.", locale);
		  
		  Date date = new Date(); DateFormat dateFormat =
		  DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		  
		  String formattedDate = dateFormat.format(date);
		  
		  model.addAttribute("serverTime", formattedDate );
		  
		  List<VideoDto> recentVideos = videoDao.getRecentVideos(2);
	      model.addAttribute("recentVideos", recentVideos);
		 
		  return "home"; }
		  
		 
	@RequestMapping("/index")
	public String index(Model model) {
		System.out.println("index");
		return "index";
	}
	
	@RequestMapping("/home3")
	public String home3(Model model) {
		System.out.println("index");
		return "home3";
	}

}

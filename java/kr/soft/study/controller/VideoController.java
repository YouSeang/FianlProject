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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.soft.study.command.AdminVideoCommand;
import kr.soft.study.dao.VideoDao;
import kr.soft.study.dto.VideoDto;
import kr.soft.study.util.Command;

/**
 * Handles requests for the application home page.
 */
@Controller
public class VideoController {

	Command command = null;
	
	@Autowired
	private VideoDao videoDao;


	@RequestMapping("/admin/adminVideo")
	public String adminVideo(HttpServletRequest request, Model model) {
		 System.out.println("어드민 비디오 관리");
		 model.addAttribute("request", request);
		 command = new AdminVideoCommand();
	     command.execute(model);
		return "admin/adminVideo";
	}
	
	@RequestMapping("/admin/videoAdd")
	public String addVideo(Model model) {
		model.addAttribute("video", new VideoDto());
		return "admin/adminVideoAdd";
	}

	@RequestMapping("/admin/videoEdit")
	public String editVideo(@RequestParam("id") int id, Model model) {
		VideoDto video = videoDao.getVideoById(id);
		model.addAttribute("video", video);
		return "admin/videoForm";
	}

	@RequestMapping(value = "/admin/videoSave", method = RequestMethod.POST)
	public String saveVideo(@ModelAttribute("video") VideoDto video) {
		if (video.getId() > 0) {
			videoDao.updateVideo(video);
		} else {
			videoDao.addVideo(video);
		}
		return "redirect:/admin/adminVideo";
	}

	@RequestMapping(value = "/admin/videoDelete", method = RequestMethod.POST)
	public String deleteVideo(@RequestParam("id") int id) {
		videoDao.deleteVideo(id);
		return "redirect:/admin/adminVideo";
	}



}

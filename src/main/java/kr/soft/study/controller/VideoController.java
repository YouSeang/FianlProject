package kr.soft.study.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.soft.study.command.AdminVideoCommand;
import kr.soft.study.command.PointsCommand;
import kr.soft.study.dao.VideoDao;
import kr.soft.study.dto.UserDto;
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
    @Autowired
    private PointsCommand pointsCommand;

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
	@RequestMapping(value = "/edu/eduvideo/increaseViews", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> increaseViews(@RequestParam("videoId") int videoId) {
	    VideoDto video = videoDao.getVideoById(videoId);
	    if (video != null) {
	        int updatedViews = video.getViews() + 1;
	        video.setViews(updatedViews);
	        videoDao.updateVideo(video); // Make sure this updates the database correctly
	        return ResponseEntity.ok(updatedViews);
	    }
	    return ResponseEntity.badRequest().body(null);
	}

	@RequestMapping(value = "/edu/eduvideo/updatePoints", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> updateVideoPoints(HttpSession session, @RequestBody Map<String, Object> pointsData) {
	    Map<String, String> response = new HashMap<>();
	    UserDto user = (UserDto) session.getAttribute("user");
	    
	    if (user == null || user.getUser_id() == null) {
	        response.put("status", "fail");
	        response.put("message", "User is not logged in.");
	        return response;
	    }

	    try {
	        String userId = user.getUser_id();
	        int pointsEarned = ((Number) pointsData.get("pointsEarned")).intValue();
	        String pointReason = (String) pointsData.get("pointReason");
	        int videoId = ((Number) pointsData.get("quizId")).intValue();
	        String fullPointReason = pointReason;

	        // 포인트 업데이트 로직
	        boolean isPointsUpdated = pointsCommand.updatevideoPoints(userId, pointsEarned, fullPointReason, videoId);

	        if (isPointsUpdated) {
	            response.put("status", "success");
	            response.put("message", "포인트가 성공적으로 적립되었습니다.");
	        } else {
	            response.put("status", "fail");
	            response.put("message", "이미 포인트가 적립되었습니다.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "error");
	        response.put("message", "포인트 적립 중 오류가 발생했습니다.");
	    }

	    return response;
	}
}

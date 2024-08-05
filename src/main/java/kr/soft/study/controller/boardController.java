package kr.soft.study.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.soft.study.command.ShareCommand;
import kr.soft.study.dao.ShareDao;
import kr.soft.study.dto.ShareDto;
import kr.soft.study.util.Command;
import kr.soft.study.util.Constant;

/**
 * Handles requests for the application home page.
 */
@Controller
public class boardController {

	Command command = null;

	@Autowired
	private ShareDao shareDao;

	private static final Logger logger = LoggerFactory.getLogger(boardController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	private SqlSession sqlSession;

	@Autowired
	public boardController(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}

	@RequestMapping("/board/share")
	public String share(HttpServletRequest request, Model model) {

		 model.addAttribute("request", request);
		 command = new ShareCommand();
	     command.execute(model);
		return "board/share";
	}

	@RequestMapping("/board/shareWrite")
	public String shareWrite(Model model) {

		return "board/shareWrite";
	}

	@PostMapping("/board/shareWriteProcess")
	public String writeProcess(@RequestParam("title") String title, @RequestParam("contents") String contents,
			@RequestParam(value = "image", required = false) MultipartFile image, @RequestParam("userId") String userId,
			@RequestParam(value = "postType", defaultValue = "main") String postType, Model model) {

	    System.out.println("Login userId: " + userId);

	    System.out.println("userId: " + userId);

	    
	    
        ShareDto shareDto = new ShareDto();
        shareDto.setTitle(title);
        shareDto.setContents(contents);
        shareDto.setUserId(userId);
        shareDto.setPostType(postType);
        ZonedDateTime now = ZonedDateTime.now(ZoneId.of("UTC"));
        Timestamp timestamp = Timestamp.from(now.toInstant());
        shareDto.setWritetime(timestamp);
        

        if (image != null && !image.isEmpty()) {
        	String uploadDir = new File("uploads").getAbsolutePath();
        	System.out.println("업로드디렉토리: " + uploadDir);
        
            String originalFilename = image.getOriginalFilename();
            String uniqueFilename = UUID.randomUUID().toString() + "_" + originalFilename;
            String filePath = uploadDir + File.separator + uniqueFilename;
        	System.out.println("파일경로: " + filePath);
            try {
                File uploadFile = new File(filePath);
                image.transferTo(uploadFile);
                // 웹에서 접근 가능한 경로로 설정
                String webPath = "/uploads/" + uniqueFilename;
                shareDto.setImage(webPath);
            } catch (IOException e) {
                e.printStackTrace();
        }
        }
        shareDao.writeShare(shareDto);
        return "redirect:/board/share"; 

    }
    
    @GetMapping("/board/detail")
    public String detail(@RequestParam("id") int id, Model model) {
        ShareDto shareDto = shareDao.getCasebyId(id);
        model.addAttribute("share", shareDto);
        return "board/shareDetail";  

    }

}

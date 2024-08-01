package kr.soft.study.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.TimeZone;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.soft.study.command.ShareCommand;
import kr.soft.study.dao.ShareDao;
import kr.soft.study.dto.ShareDto;
import kr.soft.study.util.Command;

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
	
	
	@RequestMapping("/board/notice")
	public String notice(Model model) {
		System.out.println("notice");
		return "board/notice";
	}
	
	@RequestMapping("/board/share")
	public String share(HttpServletRequest request, Model model) {
		 System.out.println("��ʰ���");
		 model.addAttribute("request", request);
		 command = new ShareCommand();
	     command.execute(model);
		return "board/share";
	}
	
	@RequestMapping("/board/shareWrite")
	public String shareWrite(Model model) {
		 System.out.println("��ʰ����ۼ�");
		return "board/shareWrite";
	}
	
	@PostMapping("/board/shareWriteProcess")
    public String writeProcess(@RequestParam("title") String title,
                               @RequestParam("contents") String contents,
                               @RequestParam(value = "image", required = false) MultipartFile image,
                               @RequestParam("userId") String userId,
                               @RequestParam(value = "postType", defaultValue = "main") String postType,
                               Model model) {

		
		 // ����� �α� ���
	    System.out.println("�α����� userId: " + userId);
	    
	    
        ShareDto shareDto = new ShareDto();
        shareDto.setTitle(title);
        shareDto.setContents(contents);
        shareDto.setUserId(userId);
        shareDto.setPostType(postType);
        ZonedDateTime now = ZonedDateTime.now(ZoneId.of("UTC"));
        Timestamp timestamp = Timestamp.from(now.toInstant());
        shareDto.setWritetime(timestamp);
        
        // �̹��� ���ε� ó��
        if (image != null && !image.isEmpty()) {
            String uploadDir = "uploads/";
            String originalFilename = image.getOriginalFilename();
            String uniqueFilename = UUID.randomUUID().toString() + "_" + originalFilename;
            String filePath = uploadDir + uniqueFilename;
            
            try {
                File uploadFile = new File(filePath);
                image.transferTo(uploadFile);
                shareDto.setImage(filePath);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        shareDao.writeShare(shareDto);
        return "redirect:/board/share";  // ���� �� ����Ʈ �������� �����̷�Ʈ
    }
    
    @GetMapping("/board/detail")
    public String detail(@RequestParam("id") int id, Model model) {
        ShareDto shareDto = shareDao.getCasebyId(id);
        model.addAttribute("share", shareDto);
        return "board/shareDetail";  // �󼼺��� �������� �̵�
    }
}

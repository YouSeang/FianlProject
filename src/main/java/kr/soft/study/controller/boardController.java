package kr.soft.study.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.List;
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

@Controller
public class boardController {

    @Autowired
    private ShareDao shareDao;

    private static final Logger logger = LoggerFactory.getLogger(boardController.class);

    private final SqlSession sqlSession;

    @Autowired
    public boardController(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
        Constant.sqlSession = this.sqlSession;
    }

    @RequestMapping("/board/share")
    public String share(HttpServletRequest request, Model model) {
        model.addAttribute("request", request);
        Command command = new ShareCommand();
        command.execute(model);
        return "board/share";
    }

    @RequestMapping("/board/shareWrite")
    public String shareWrite(Model model) {
        return "board/shareWrite";
    }

    @PostMapping("/board/shareWriteProcess")
    public String writeProcess(
            @RequestParam("title") String title, 
            @RequestParam("contents") String contents,
            @RequestParam(value = "image", required = false) MultipartFile image, 
            @RequestParam("userId") String userId,
            @RequestParam(value = "postType", defaultValue = "main") String postType, 
            HttpServletRequest request) {

        ShareDto shareDto = new ShareDto();
        shareDto.setTitle(title);
        shareDto.setContents(contents);
        shareDto.setUserId(userId);
        shareDto.setPostType(postType);

        // 현재 시간을 KST (UTC+9) 시간대로 설정
        ZonedDateTime now = ZonedDateTime.now(ZoneId.of("Asia/Seoul"));
        Timestamp timestamp = Timestamp.from(now.toInstant());
        shareDto.setWritetime(timestamp);

        if (image != null && !image.isEmpty()) {
            // 설정된 경로를 사용하여 파일을 저장
            String uploadDir = "/var/www/uploads";
            File uploadDirFile = new File(uploadDir);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdirs();
            }

            String originalFilename = image.getOriginalFilename();
            String uniqueFilename = UUID.randomUUID().toString() + "_" + originalFilename;
            String filePath = uploadDirFile.getAbsolutePath() + File.separator + uniqueFilename;
            try {
                File uploadFile = new File(filePath);
                image.transferTo(uploadFile);
                
                // 클라이언트가 접근할 수 있는 URL 경로 설정
                String webPath = "/uploads/" + uniqueFilename;
                shareDto.setImage(webPath);
            } catch (IOException e) {
                logger.error("File upload error", e);
            }
        }

        shareDao.writeShare(shareDto);
        return "redirect:/board/share";
    }


    @GetMapping("/board/detail")
    public String detail(@RequestParam("id") int id, Model model) {
        ShareDto shareDto = shareDao.getCasebyId(id);
        model.addAttribute("share", shareDto);

        List<ShareDto> commentlist = shareDao.commentlist(id);
        model.addAttribute("commentlist", commentlist);
        return "board/shareDetail";
    }

    @PostMapping("/board/addComment")
    public String addComment(
            @RequestParam("shareId") int shareId, 
            @RequestParam("shareTitle") String shareTitle, 
            @RequestParam("commentContent") String commentContent,
            HttpServletRequest request) {

        // �쁽�옱 濡쒓렇�씤�맂 �궗�슜�옄�쓽 ID瑜� �꽭�뀡�뿉�꽌 媛��졇�샃�땲�떎.
        String userId = (String) request.getSession().getAttribute("userId");
        if (userId == null) {
            // userId媛� �뾾�쑝硫� 濡쒓렇�씤 �럹�씠吏�濡� 由щ떎�씠�젆�듃�븯嫄곕굹 �삤瑜� 泥섎━
            return "redirect:/login"; // �삉�뒗 �삤瑜� �럹�씠吏�濡� �씠�룞
        }

        ShareDto commentDto = new ShareDto();
        commentDto.setTitle(shareTitle); // �뙎湲��씠 �떖由� 寃뚯떆臾쇱쓽 �젣紐⑹쓣 �궗�슜
        commentDto.setContents(commentContent);
        commentDto.setUserId(userId);
        commentDto.setPostType("comment"); // �뙎湲��쓣 �굹���궡�뒗 'comment' �꽕�젙
        commentDto.setWritetime(new Timestamp(System.currentTimeMillis()));

        shareDao.writeShare(commentDto);
        return "redirect:/board/detail?id=" + shareId;
    }

}

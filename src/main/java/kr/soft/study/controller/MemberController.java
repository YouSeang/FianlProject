package kr.soft.study.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.soft.study.dao.PointsDAO;
import kr.soft.study.dao.UserDao;
import kr.soft.study.dto.MemberDto;
import kr.soft.study.dto.PointsDto;
import kr.soft.study.dto.UserDto;

@Controller
public class MemberController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private PointsDAO pointsDao;

    @GetMapping("/admin/adminUser")
    public String getMemberList(Model model) {
        // Fetch all users
        List<UserDto> users = userDao.getAllUsers();

        // Create a list to hold the combined data
        List<MemberDto> memberInfoList = new ArrayList<>();

        // Iterate over users to populate MemberDto
        for (UserDto user : users) {
        	  
        	    
            MemberDto memberInfo = new MemberDto();
            memberInfo.setUser_id(user.getUser_id());
            memberInfo.setName(user.getName());
            memberInfo.setEmail(user.getEmail());
            memberInfo.setPhone_number(user.getPhone_number());

      	  
            // Fetch and set total points for each user
            int totalPoints = pointsDao.getTotalPoints(user.getUser_id());
            memberInfo.setTotalPoints(totalPoints);

            memberInfoList.add(memberInfo);
        }

        // Add the list to the model
        model.addAttribute("memberList", memberInfoList);
        return "admin/adminUser";  // JSP page name where data will be displayed
    }
    
   
}

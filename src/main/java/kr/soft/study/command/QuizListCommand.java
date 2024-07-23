package kr.soft.study.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import kr.soft.study.dao.QuizDao;
import kr.soft.study.dto.QuizDto;
import kr.soft.study.util.Command;
import kr.soft.study.util.Constant;

public class QuizListCommand implements Command{

	@Override
    public void execute(Model model) {

		QuizDao dao = Constant.quizDao;    	   
        ArrayList<QuizDto> dtos = dao.list();
        
        System.out.println("리스트 길이: " + dtos.size());
        
        model.addAttribute("list", dtos);
    }
	
}

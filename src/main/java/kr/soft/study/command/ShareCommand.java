package kr.soft.study.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.soft.study.dao.ShareDao;
import kr.soft.study.dao.VideoDao;
import kr.soft.study.util.Command;
import kr.soft.study.util.Constant;
@Service
public class ShareCommand implements Command {

    @Override
    public void execute(Model model) {
        SqlSession sqlSession = Constant.sqlSession;
        
        if (sqlSession == null) {
            throw new IllegalStateException("SqlSession is not initialized. Please check the configuration.");
        }
        
        ShareDao dao = sqlSession.getMapper(ShareDao.class);
        
        if (dao == null) {
            throw new IllegalStateException("ShareDao could not be initialized.");
        }
        
        try {
            model.addAttribute("shareList", dao.list());
            // Assuming shareId is supposed to be passed in some way; check if it's null
            Integer shareId = (Integer) model.getAttribute("shareId");
            if (shareId != null) {
                model.addAttribute("commentList", dao.commentlist(shareId));
            }
        } catch (NullPointerException e) {
            // Log the exception and throw a more descriptive error
            throw new RuntimeException("An error occurred while executing the ShareCommand. Please check the model attributes and DAO methods.", e);
        }
    }
}

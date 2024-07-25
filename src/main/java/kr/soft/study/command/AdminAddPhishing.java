package kr.soft.study.command;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

@Component
public class AdminAddPhishing implements ADCommand {
	
	 @Autowired
	    private SqlSession sqlSession;

	    @Autowired
	    private ServletContext context;

	    @Override
	    public void execute(Model model) {
	        String scenarioName = (String) model.asMap().get("scenarioName");
	        String scenarioPrompt = (String) model.asMap().get("scenarioPrompt");
	        MultipartFile audioFile = (MultipartFile) model.asMap().get("audioFile");

	        // �ó����� DB ����
	        Map<String, Object> scenarioMap = new HashMap<>();
	        scenarioMap.put("scenarioName", scenarioName);
	        scenarioMap.put("scenarioPrompt", scenarioPrompt);
	        sqlSession.insert("kr.soft.study.util.ScenarioDao.insertScenario", scenarioMap);
	        
	        // ����� ���� ó�� ����
	        String audioFileName = null;
	        if (audioFile != null && !audioFile.isEmpty()) {
	            try {
	                String originalFilename = audioFile.getOriginalFilename();
	                audioFileName = UUID.randomUUID().toString() + "_" + originalFilename;
	                String uploadDir = context.getRealPath("/uploads/");
	                String uploadPath = uploadDir + audioFileName;
	                File dir = new File(uploadDir);
	                if (!dir.exists()) {
	                    dir.mkdirs();
	                }
	                audioFile.transferTo(new File(uploadPath));

	                // ����� ������ ������ �����ϴ��� Ȯ���ϰ� ������Ʈ �Ǵ� ����
	                Map<String, Object> audioMap = new HashMap<>();
	                audioMap.put("id", scenarioName);  // �ó����� �̸��� id�� ���
	                audioMap.put("voicePath", audioFileName);
	                int count = sqlSession.selectOne("kr.soft.study.util.AudioDao.countByScenarioName", scenarioName);
	                if (count > 0) {
	                    sqlSession.update("kr.soft.study.util.AudioDao.updateAudioFile", audioMap);
	                } else {
	                    sqlSession.insert("kr.soft.study.util.AudioDao.insertAudioFile", audioMap);
	                }
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	    }
}

package kr.soft.study.command;

import kr.soft.study.dao.AdminDao;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class AdminUpdatePhishing {

    private AdminDao adminDao;
    private ServletContext context;

    public AdminUpdatePhishing(AdminDao adminDao, ServletContext context) {
        this.adminDao = adminDao;
        this.context = context;
    }

    public void execute(Map<String, Object> model) {
        int scenarioId = (int) model.get("scenarioId");
        String scenarioName = (String) model.get("scenarioName");
        String scenarioPrompt = (String) model.get("scenarioPrompt");
        List<MultipartFile> audioFiles = (List<MultipartFile>) model.get("audioFiles");
        List<MultipartFile> finalAudioFiles = (List<MultipartFile>) model.get("finalAudioFiles"); //추가
        List<String> existingAudioFiles = (List<String>) model.get("existingAudioFiles");
        List<String> existingFinalAudioFiles = (List<String>) model.get("existingFinalAudioFiles"); //추가
        
        // Update scenario
        adminDao.updateScenario(model);

        // Handle existing audio files
        adminDao.deleteAudioFilesByScenarioId(scenarioId);
        
        // Reset all is_final to 0 for this scenario before adding new files
        adminDao.resetIsFinalByScenarioName(scenarioName);

        // Handle new audio files
        int fileId = 0; // 0번 오디오부터 등록됨
        if (existingAudioFiles != null) {
            for (String voicePath : existingAudioFiles) {
                adminDao.insertAudioFile(Map.of("id", fileId++, "scenarioName", scenarioName, "voicePath", voicePath, "isFinal", 0));
            }
        }
        
        if (audioFiles != null) {
            for (MultipartFile file : audioFiles) {
                if (!file.isEmpty()) {
                    String fileName = saveFile(file);
                    adminDao.insertAudioFile(Map.of("id", fileId++, "scenarioName", scenarioName, "voicePath", fileName, "isFinal", 0));
                }
            }
        }

        // 결말 오디오 파일에 대해 새로운 fileId를 사용
        int finalFileId = fileId; // 새롭게 시작하는 fileId

        // 기존 결말 오디오 파일 처리
        if (existingFinalAudioFiles != null) {
            for (String voicePath : existingFinalAudioFiles) {
                adminDao.insertAudioFile(Map.of("id", finalFileId++, "scenarioName", scenarioName, "voicePath", voicePath, "isFinal", 1));
            }
        }

        // 새로운 결말 오디오 파일 처리
        if (finalAudioFiles != null) {
            for (MultipartFile file : finalAudioFiles) {
                if (!file.isEmpty()) {
                    String fileName = saveFile(file);
                    adminDao.insertAudioFile(Map.of("id", finalFileId++, "scenarioName", scenarioName, "voicePath", fileName, "isFinal", 1));
                }
            }
        }

        // 마지막 결말 오디오 파일을 isFinal=1로 설정
        if (finalFileId > fileId) { // 결말 오디오 파일이 추가된 경우
            adminDao.updateIsFinal(Map.of("id", finalFileId - 1, "scenarioName", scenarioName));
        } else if (fileId > 0) { // 결말 오디오 파일이 추가되지 않았지만 일반 파일이 있는 경우
            adminDao.updateIsFinal(Map.of("id", fileId - 1, "scenarioName", scenarioName));
        }
        
		/*
		 * // Set the isFinal of the last file to 1 int maxId =
		 * adminDao.getMaxAudioIdByScenarioName(scenarioName);
		 * adminDao.updateIsFinal(Map.of("id", maxId, "scenarioName", scenarioName)); }
		 * else { // If no new audio files are added, ensure the last existing file is
		 * set to isFinal = 1 int maxId =
		 * adminDao.getMaxAudioIdByScenarioName(scenarioName); if (maxId > 0) {
		 * adminDao.updateIsFinal(Map.of("id", maxId, "scenarioName", scenarioName)); }
		 * }
		 */
    }

    private String saveFile(MultipartFile file) {
        String uploadDir = context.getRealPath("/resources/audios/");
        String fileName = file.getOriginalFilename();
        try {
            File uploadFile = new File(uploadDir, fileName);
            file.transferTo(uploadFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fileName;
    }
}

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
        List<MultipartFile> finalAudioFiles = (List<MultipartFile>) model.get("finalAudioFiles"); //�߰�
        List<String> existingAudioFiles = (List<String>) model.get("existingAudioFiles");
        List<String> existingFinalAudioFiles = (List<String>) model.get("existingFinalAudioFiles"); //�߰�
        
        // Update scenario
        adminDao.updateScenario(model);

        // Handle existing audio files
        adminDao.deleteAudioFilesByScenarioId(scenarioId);
        
        // Reset all is_final to 0 for this scenario before adding new files
        adminDao.resetIsFinalByScenarioName(scenarioName);

        // Handle new audio files
        int fileId = 0; // 0�� ��������� ��ϵ�
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

        // �ḻ ����� ���Ͽ� ���� ���ο� fileId�� ���
        int finalFileId = fileId; // ���Ӱ� �����ϴ� fileId

        // ���� �ḻ ����� ���� ó��
        if (existingFinalAudioFiles != null) {
            for (String voicePath : existingFinalAudioFiles) {
                adminDao.insertAudioFile(Map.of("id", finalFileId++, "scenarioName", scenarioName, "voicePath", voicePath, "isFinal", 1));
            }
        }

        // ���ο� �ḻ ����� ���� ó��
        if (finalAudioFiles != null) {
            for (MultipartFile file : finalAudioFiles) {
                if (!file.isEmpty()) {
                    String fileName = saveFile(file);
                    adminDao.insertAudioFile(Map.of("id", finalFileId++, "scenarioName", scenarioName, "voicePath", fileName, "isFinal", 1));
                }
            }
        }

        // ������ �ḻ ����� ������ isFinal=1�� ����
        if (finalFileId > fileId) { // �ḻ ����� ������ �߰��� ���
            adminDao.updateIsFinal(Map.of("id", finalFileId - 1, "scenarioName", scenarioName));
        } else if (fileId > 0) { // �ḻ ����� ������ �߰����� �ʾ����� �Ϲ� ������ �ִ� ���
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

package kr.soft.study.command;

import kr.soft.study.dao.AdminDao;

import java.util.Map;

public class AdminDeletePhishing {

    private AdminDao adminDao;

    public AdminDeletePhishing(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    public void execute(Map<String, Object> model) {
        int scenarioId = (int) model.get("scenarioId");

        // Delete scenario
        adminDao.deleteScenario(scenarioId);

        // Optionally, delete associated audio files here if needed
    }
}

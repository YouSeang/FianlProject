package kr.soft.study.dto;

import java.util.List;

public class Scenario {
    private int id;
    private String scenarioName;
    private String scenarioPrompt;
    private List<CriminalVoiceDTO> audioFiles;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getScenarioName() {
        return scenarioName;
    }

    public void setScenarioName(String scenarioName) {
        this.scenarioName = scenarioName;
    }

    public String getScenarioPrompt() {
        return scenarioPrompt;
    }

    public void setScenarioPrompt(String scenarioPrompt) {
        this.scenarioPrompt = scenarioPrompt;
    }

    public List<CriminalVoiceDTO> getAudioFiles() {
        return audioFiles;
    }

    public void setAudioFiles(List<CriminalVoiceDTO> audioFiles) {
        this.audioFiles = audioFiles;
    }
    
    
}

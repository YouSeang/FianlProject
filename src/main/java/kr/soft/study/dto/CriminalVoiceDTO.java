package kr.soft.study.dto;

public class CriminalVoiceDTO {
    private int idx;
    private String id;
    private String voicePath;
    private boolean isFinal;
    private String scenarioName; // ���� �߰�

    public String getScenarioName() {
		return scenarioName;
	}

	public void setScenarioName(String scenarioName) {
		this.scenarioName = scenarioName;
	}

	public void setFinal(boolean isFinal) {
		this.isFinal = isFinal;
	}

	// �⺻ ������
    public CriminalVoiceDTO() {}

    // ������
    public CriminalVoiceDTO(int idx, String id, String voicePath, boolean isFinal, String scenarioName) {
        this.idx = idx;
        this.id = id;
        this.voicePath = voicePath;
        this.isFinal = isFinal;
        this.scenarioName = scenarioName;
    }

    // Getter �� Setter �޼���
    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getVoicePath() {
        return voicePath;
    }

    public void setVoicePath(String voicePath) {
        this.voicePath = voicePath;
    }

    public boolean getIsFinal() {
        return isFinal;
    }

    public void setIsFinal(boolean isFinal) {
        this.isFinal = isFinal;
    }
}

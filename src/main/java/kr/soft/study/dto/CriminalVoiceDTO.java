package kr.soft.study.dto;

public class CriminalVoiceDTO {
    private int idx;
    private String id;
    private String voicePath;
    private boolean isFinal;

    // �⺻ ������
    public CriminalVoiceDTO() {}

    // ������
    public CriminalVoiceDTO(int idx, String id, String voicePath, boolean isFinal) {
        this.idx = idx;
        this.id = id;
        this.voicePath = voicePath;
        this.isFinal = isFinal;
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

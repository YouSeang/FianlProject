package kr.soft.study.dto;

public class GuideDto {
	private int id;
	private String guideTitle;
	private String guideContents;
	private String guideFiles;

	public GuideDto() {
		super();
	}

	public GuideDto(int id, String guideTitle, String guideContents, String guideFiles) {
		super();
		this.id = id;
		this.guideTitle = guideTitle;
		this.guideContents = guideContents;
		this.guideFiles = guideFiles;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGuideTitle() {
		return guideTitle;
	}

	public void setGuideTitle(String guideTitle) {
		this.guideTitle = guideTitle;
	}

	public String getGuideContents() {
		return guideContents;
	}

	public void setGuideContents(String guideContents) {
		this.guideContents = guideContents;
	}

	public String getGuideFiles() {
		return guideFiles;
	}

	public void setGuideFiles(String guideFiles) {
		this.guideFiles = guideFiles;
	}
}

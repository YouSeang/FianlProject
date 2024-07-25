package kr.soft.study.dto;

import java.sql.Timestamp;

public class PointsDto {
    private int id;
    private String userId;
    private Timestamp pointTime;
    private String pointReason;
    private int pointsEarned;
    private int pointsUsed;
    private Timestamp usageTime;
    private String usageType;
    private int totalPoints;

    // 기본 생성자
    public PointsDto() {}

    // 필드별 getter 및 setter 메서드
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Timestamp getPointTime() {
        return pointTime;
    }

    public void setPointTime(Timestamp pointTime) {
        this.pointTime = pointTime;
    }

    public String getPointReason() {
        return pointReason;
    }

    public void setPointReason(String pointReason) {
        this.pointReason = pointReason;
    }

    public int getPointsEarned() {
        return pointsEarned;
    }

    public void setPointsEarned(int pointsEarned) {
        this.pointsEarned = pointsEarned;
    }

    public int getPointsUsed() {
        return pointsUsed;
    }

    public void setPointsUsed(int pointsUsed) {
        this.pointsUsed = pointsUsed;
    }

    public Timestamp getUsageTime() {
        return usageTime;
    }

    public void setUsageTime(Timestamp usageTime) {
        this.usageTime = usageTime;
    }

    public String getUsageType() {
        return usageType;
    }

    public void setUsageType(String usageType) {
        this.usageType = usageType;
    }

    public int getTotalPoints() {
        return totalPoints;
    }

    public void setTotalPoints(int totalPoints) {
        this.totalPoints = totalPoints;
    }
}

package kr.soft.study.dao;

import java.util.Map;

import kr.soft.study.dto.PointsDto;

public interface PointsDAO {
    int checkPointsAddedToday(Map<String, Object> params);
    Integer getTotalPoints(String userId);
    void addPoints(PointsDto pointsDto);
}
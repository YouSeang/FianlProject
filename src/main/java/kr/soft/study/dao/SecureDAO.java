package kr.soft.study.dao;

import kr.soft.study.dto.PointsDto;
import kr.soft.study.dto.TipDto;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SecureDAO {
    int checkPointsAddedToday(@Param("userId") String userId);
    int getTotalPoints(@Param("userId") String userId);
    void addPoints(PointsDto pointsDto);
    List<TipDto> getTips();

    // New methods
    void addSecurityScore(@Param("userId") String userId, @Param("score") int score);
    int getScoreRank(@Param("score") int score);
    int getTotalSubmissions();
}

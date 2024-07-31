package kr.soft.study.dao;

import java.util.Map;

//import org.apache.ibatis.annotations.Select;
import kr.soft.study.dto.CriminalVoiceDTO;

public interface CriminalVoiceDAO {

    //@Select("SELECT * FROM criminal_voice WHERE id = #{id}")
    CriminalVoiceDTO getVoiceById(Map<String, Object> params);
    String getPromptByScenarioName(String scenarioName);
}

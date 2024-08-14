package kr.soft.study.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.soft.study.dto.QuizDto;
import kr.soft.study.dto.RentSettingsDTO;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface RentSettingsDAO {	 
	
    RentSettingsDTO getSettingsByPropertyType(String propertyType);
    void updateSettings(RentSettingsDTO settings);
}

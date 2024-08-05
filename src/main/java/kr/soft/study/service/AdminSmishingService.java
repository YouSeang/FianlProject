package kr.soft.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.soft.study.dao.AdminSmishingDao;
import kr.soft.study.dto.SmishingDto;

@Service
public class AdminSmishingService {

	@Autowired
	private AdminSmishingDao dao;

	public List<SmishingDto> getAllSmishings() {
		return dao.getAllSmishings();
	}

	public void addSmishing(SmishingDto smishingCase) {
		dao.addSmishing(smishingCase);
	}

	public void updateSmishing(SmishingDto smishingCase) {
		dao.updateSmishing(smishingCase);
	}

	public void deleteSmishing(int id) {
		dao.deleteSmishing(id);
	}

	// 해당 케이스의 정보가져오기
	public SmishingDto getSmishingByType(String type) {
		return dao.getSmishingByType(type);
	}

}

package kr.soft.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.soft.study.dao.AdminGuideDao;
import kr.soft.study.dto.GuideDto;
import kr.soft.study.dto.SmishingDto;

@Service
public class GuideService {

	@Autowired
	private AdminGuideDao dao;

	public List<GuideDto> getAllGuides() {
		return dao.getAllGuides();
	}

	public void addGuide(GuideDto guide) {
		dao.addGuide(guide);
	}

	public void updateGuide(GuideDto guide) {
		dao.updateGuide(guide);
	}

	public void deleteGuide(int id) {
		dao.deleteGuide(id);
	}

}

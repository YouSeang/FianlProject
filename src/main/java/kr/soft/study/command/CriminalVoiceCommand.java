package kr.soft.study.command;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.soft.study.dao.CriminalVoiceDAO;
import kr.soft.study.dto.CriminalVoiceDTO;

@Component
public class CriminalVoiceCommand implements CCommand {

	private static final Logger logger = LoggerFactory.getLogger(CriminalVoiceCommand.class);
	private SqlSession sqlSession;

	@Autowired
	public CriminalVoiceCommand(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public String execute(Map<String, Object> map) {
		String id = (String) map.get("id");
		logger.debug("Requested ID: {}", id);

		CriminalVoiceDAO criminalVoiceDAO = sqlSession.getMapper(CriminalVoiceDAO.class);
		CriminalVoiceDTO criminalVoiceDTO = criminalVoiceDAO.getVoiceById(id);

		if (criminalVoiceDTO == null) {
			return "{\"audioPath\": null, \"isFinal\": false, \"voiceNotFound\": true}";
		} else {
			boolean isFinal = criminalVoiceDTO.getIsFinal();
			String voicePath = criminalVoiceDTO.getVoicePath();
			return String.format("{\"audioPath\": \"%s\", \"isFinal\": %b, \"voiceNotFound\": false}", voicePath, isFinal);
		}
	}
}

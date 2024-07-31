package kr.soft.study.command;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.soft.study.dao.AdminDao;
import kr.soft.study.dto.Scenario;

@Component
public class GetAllScenariosCommand {

	private SqlSession sqlSession;

	@Autowired
	public GetAllScenariosCommand(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<Scenario> execute() {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		return adminDao.getAllScenarios();
	}
}

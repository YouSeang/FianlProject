package kr.soft.study.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.soft.study.dto.QuizDto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public interface QuizDao {
	
	public ArrayList <QuizDto> list();

}


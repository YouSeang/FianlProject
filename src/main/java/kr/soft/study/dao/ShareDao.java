package kr.soft.study.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.soft.study.dto.ShareDto;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface ShareDao {	 
	
	ShareDto getCasebyId(int id);
	public ArrayList<ShareDto> list();
	public void writeShare(ShareDto share);
	public void updateShare(ShareDto share);
	public void deleteShare(int id);
	public  ArrayList<ShareDto> commentlist(int shareId);

	}


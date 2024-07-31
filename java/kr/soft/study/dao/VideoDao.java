package kr.soft.study.dao;

import java.util.ArrayList;

import kr.soft.study.dto.VideoDto;

public interface VideoDao {
	  VideoDto getVideoById(int id);
	  public ArrayList<VideoDto> getVideos();
	  public void addVideo(VideoDto video);
	  public void updateVideo(VideoDto video);
	  public void deleteVideo(int id);
}

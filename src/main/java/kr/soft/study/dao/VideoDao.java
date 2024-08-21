package kr.soft.study.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.soft.study.dto.VideoDto;

public interface VideoDao {
	  VideoDto getVideoById(int id);
	  public ArrayList<VideoDto> getVideos();
	  public void addVideo(VideoDto video);
	  public void updateVideo(VideoDto video);
	  public void deleteVideo(int id);
	  @Select("SELECT id, category, video_name AS videoName, views, points, link FROM Videos ORDER BY id DESC LIMIT #{limit}")
	  List<VideoDto> getRecentVideos(int limit);
}

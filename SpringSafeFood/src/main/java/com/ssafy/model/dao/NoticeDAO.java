package com.ssafy.model.dao;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Board;
import com.ssafy.model.dto.Notice;

@Mapper
public interface NoticeDAO {
	public Notice search(String no); 
	public List<Notice> searchAll();
	public void insert(Notice notice);
	public void update(Notice notice);
	public void delete(String no);
}

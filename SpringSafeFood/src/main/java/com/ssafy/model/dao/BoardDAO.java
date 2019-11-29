package com.ssafy.model.dao;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Board;

@Mapper
public interface BoardDAO {
	public Board search(String no); 
	public List<Board> searchAll();
	public void insert(Board board);
	public void update(Board board);
	public void reply(Board board);
	public void delete(String no);
}

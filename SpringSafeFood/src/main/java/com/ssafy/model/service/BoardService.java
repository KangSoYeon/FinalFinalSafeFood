package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Board;

public interface BoardService {
	public Board search(String no); 
	public List<Board> searchAll();
	public void insert(Board board);
	public void update(Board board);
	public void reply(Board board);
	public void delete(String no);
}

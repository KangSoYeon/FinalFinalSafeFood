package com.ssafy.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Search;

@Mapper
public interface SearchDAO {
	public void insert(Search search);
	public void update(Search search);
	public List<Search> searchAll();
	public Search search(String skey);
}

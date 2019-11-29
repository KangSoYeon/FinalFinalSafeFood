package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Search;


public interface SearchService {
	public void update(Search search,String skey);
	public List<Search> searchAll();
	public Search search(String skey);
}

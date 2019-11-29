package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.SearchDAO;
import com.ssafy.model.dto.Search;
import com.ssafy.model.dto.SearchException;

@Service
public class SearchServiceImp implements SearchService{

	@Autowired
	SearchDAO dao;
	
	@Override
	public void update(Search search,String skey) {
		try {
			Search s = dao.search(skey);
			if(s==null) {
				dao.insert(search);
			}else {
				int cnt = search.getScnt();
				search.setScnt(cnt+1);
				dao.update(search);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SearchException("검색어 횟수 입력 중 오류 발생");
		}
		
	}

	@Override
	public List<Search> searchAll() {
		try {
			List<Search> list = dao.searchAll();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			throw new SearchException("인기 검색어 목록 조회 중 오류 발생");
		}
	}

	@Override
	public Search search(String skey) {
		try {
			return dao.search(skey);
		} catch (Exception e) {
			e.printStackTrace();
			throw new SearchException("검색어 조회 중 오류 발생");
		}
	}


}

package com.ssafy.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.MyDiet;
import com.ssafy.model.dto.TotalDiet;

public interface MyDietService {
	public List<MyDiet> search(String id);
	public List<MyDiet> week(String id);
	public List<MyDiet> month(String id);
	public List<MyDiet> year(String id);
	public List<MyDiet> searchAll();
	public void insert(MyDiet mydiet, HttpServletRequest request);
	public void delete(int dno, HttpServletRequest request);
	public List<TotalDiet> total(String id);
	public List<TotalDiet> best();
}

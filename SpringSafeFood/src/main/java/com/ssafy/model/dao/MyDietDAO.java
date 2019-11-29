package com.ssafy.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.MyDiet;
import com.ssafy.model.dto.TotalDiet;

@Mapper
public interface MyDietDAO {
	public List<MyDiet> search(String id);
	public List<MyDiet> week(String id);
	public List<MyDiet> month(String id);
	public List<MyDiet> year(String id);
	public List<MyDiet> searchAll();
	public void insert(MyDiet mydiet);
	public void delete(int dno);
	public List<TotalDiet> total(String id);
	public List<TotalDiet> best();
}

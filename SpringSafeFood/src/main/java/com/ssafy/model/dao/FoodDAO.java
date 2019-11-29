package com.ssafy.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Food;
@Mapper
public interface FoodDAO {
	public Food search(String code) ;

	public List<Food> searchAll() ;
	public List<Food> searchAllName(String name) ;
	public List<Food> searchAllMaker(String maker) ;
	public List<Food> searchAllMaterial(String material) ;
	public void insert(Food food);
	public void delete(String code);
	public void delete_cart(String code);
	public void delete_mydiet(String code);
	public void update(Food food);

}

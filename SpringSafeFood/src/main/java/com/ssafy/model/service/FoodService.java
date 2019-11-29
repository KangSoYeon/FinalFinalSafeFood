package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Food;


public interface FoodService {
	public Food search(String code);
	public List<Food> searchAll();
	public List<Food> searchAllName(String name);
	public List<Food> searchAllMaker(String maker);
	public List<Food> searchAllMaterial(String material);
	public void insert(Food food);
	public void delete(String code);
	public void update(Food food);
}

package com.ssafy.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Cart;

public interface CartService {
	public List<Cart> search(String id);
	public List<Cart> week(String id);
	public List<Cart> month(String id);
	public List<Cart> year(String id);
	public List<Cart> searchAll();
	public void insert(Cart cart, HttpServletRequest request);
	public void delete(int cno, HttpServletRequest request);
}

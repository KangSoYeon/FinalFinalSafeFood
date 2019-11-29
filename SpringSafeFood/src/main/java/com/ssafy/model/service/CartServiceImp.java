package com.ssafy.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.CartDAO;
import com.ssafy.model.dto.Cart;
import com.ssafy.model.dto.CartException;

@Service
public class CartServiceImp implements CartService {
	
	@Autowired
	private CartDAO dao;
	@Override
	public List<Cart> search(String id) {
		try {
			List<Cart> cart = dao.search(id);
			if(cart == null) {
				throw new CartException("등록되지 않은 식품입니다.");
			} else {
				return cart;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			throw new CartException();
		}
	}

	@Override
	public List<Cart> searchAll() {
		try {
			return dao.searchAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new CartException();
		}
	}
	
	@Override
	public void insert(Cart cart, HttpServletRequest request) {
		try {
			dao.insert(cart);
			request.setAttribute("msg", "내 식품에 추가되었습니다!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "추가 중 오류가 발생하였습니다.");
			throw new CartException("추가 중 오류가 발생하였습니다.");
		}
	}
	

	@Override
	public void delete(int cno, HttpServletRequest request) {
		try {
			dao.delete(cno);
			request.setAttribute("msg", "내 식품이 삭제되었습니다!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "삭제 중 오류가 발생하였습니다.");
			throw new CartException("삭제 중 오류가 발생하였습니다.");
		}
	}

	@Override
	public List<Cart> week(String id) {
		try {
			List<Cart> cart = dao.week(id);
			if(cart == null) {
				throw new CartException("등록되지 않은 식품입니다.");
			} else {
				return cart;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			throw new CartException();
		}
	}

	@Override
	public List<Cart> month(String id) {
		try {
			List<Cart> cart = dao.month(id);
			if(cart == null) {
				throw new CartException("등록되지 않은 식품입니다.");
			} else {
				return cart;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			throw new CartException();
		}
	}

	@Override
	public List<Cart> year(String id) {
		try {
			List<Cart> cart = dao.year(id);
			if(cart == null) {
				throw new CartException("등록되지 않은 식품입니다.");
			} else {
				return cart;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			throw new CartException();
		}
	}
	
	
	
}

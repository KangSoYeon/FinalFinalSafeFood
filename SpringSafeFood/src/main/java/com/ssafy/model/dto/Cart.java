package com.ssafy.model.dto;

import java.util.List;

public class Cart {
	private int cno;
	private Food food;
	private String regdate;
	private int amount;
	private String code;
	private String id;
	
	public Cart() {}

	public Cart(int cno, Food food, String regdate, int amount, String code, String id) {
		super();
		this.cno = cno;
		this.food = food;
		this.regdate = regdate;
		this.amount = amount;
		this.code = code;
		this.id = id;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Cart [cno=" + cno + ", food=" + food + ", regdate=" + regdate + ", amount=" + amount + ", code=" + code
				+ ", id=" + id + "]";
	}
	
	
	
	
	
	
	
}

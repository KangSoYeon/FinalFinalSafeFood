package com.ssafy.model.dto;

public class TotalDiet {
	String name;
	String amount;
	
	public TotalDiet() {}

	public TotalDiet(String name, String amount) {
		super();
		this.name = name;
		this.amount = amount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "TotalDiet [name=" + name + ", amount=" + amount + "]";
	}
	
}

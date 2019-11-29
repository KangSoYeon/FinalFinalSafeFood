package com.ssafy.model.dto;

public class FoodException extends RuntimeException {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public FoodException() {
		super("상품 정보 처리 중 오류 발생");
	}

	public FoodException(String msg) {
		super(msg);
	}
}

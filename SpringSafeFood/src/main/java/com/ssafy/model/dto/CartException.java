package com.ssafy.model.dto;

public class CartException extends RuntimeException {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public CartException() {
		super("사원 정보 처리 중 오류 발생");
	}

	public CartException(String msg) {
		super(msg);
	}
}

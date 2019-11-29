package com.ssafy.model.dto;

public class MyDietException extends RuntimeException {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public MyDietException() {
		super("사원 정보 처리 중 오류 발생");
	}

	public MyDietException(String msg) {
		super(msg);
	}
}

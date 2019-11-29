package com.ssafy.model.dto;

public class BoardException extends RuntimeException {
	public BoardException() {}
	public BoardException(String msg) {
		super(msg);
	}
}

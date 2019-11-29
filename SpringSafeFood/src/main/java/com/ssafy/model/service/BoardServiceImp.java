package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.BoardDAO;
import com.ssafy.model.dto.Board;
import com.ssafy.model.dto.BoardException;

@Service
public class BoardServiceImp implements BoardService {
	
	@Autowired
	private BoardDAO dao;
	
	@Override
	public Board search(String no) {
		try {
			return dao.search(no);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시물 조회 중 오류 발생");
		}
	}

	@Override
	public List<Board> searchAll() {
		try {
			return dao.searchAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시판 목록 조회 중 오류 발생");
		}
	}

	@Override
	public void insert(Board board) {
		try {
			dao.insert(board);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시물 등록 중 오류 발생");
		}
	}

	@Override
	public void update(Board board) {
		try {
			dao.update(board);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시물 수정 중 오류 발생");
		}
	}

	@Override
	public void reply(Board board) {
		try {
			dao.reply(board);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시물 답변 중 오류 발생");
		}
	}

	@Override
	public void delete(String no) {
		try {
			dao.delete(no);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시물 삭제 중 오류 발생");
		}
	}

}

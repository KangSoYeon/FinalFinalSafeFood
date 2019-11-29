package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.NoticeDAO;
import com.ssafy.model.dto.Notice;
import com.ssafy.model.dto.NoticeException;

@Service
public class NoticeServiceImp implements NoticeService {

	@Autowired
	private NoticeDAO dao;
	
	@Override
	public Notice search(String no) {
		try {
			return dao.search(no);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NoticeException("공지글 조회 중 오류 발생");
		}
	}

	@Override
	public List<Notice> searchAll() {
		try {
			return dao.searchAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new NoticeException("공지사항 목록 조회 중 오류 발생");
		}
	}

	@Override
	public void insert(Notice notice) {
		try {
			dao.insert(notice);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NoticeException("공지사항 등록 중 오류 발생");
		}

	}

	@Override
	public void update(Notice notice) {
		try {
			dao.update(notice);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NoticeException("공지글 수정 중 오류 발생");
		}

	}

	@Override
	public void delete(String no) {
		try {
			dao.delete(no);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NoticeException("공지글 삭제 중 오류 발생");
		}

	}

}

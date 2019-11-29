package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.MemberDAO;
import com.ssafy.model.dto.Member;
import com.ssafy.model.dto.MemberException;

@Service
public class MemberServiceImp implements MemberService {
	@Autowired
	private MemberDAO dao;

	@Override
	public Member search(String id) {
		try {
			Member member = dao.search(id);
			if (member == null) {
				throw new MemberException("등록되지 않은 아이디입니다.");
			} else {
				return member;
			}
		} catch (MemberException e) {
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
			throw new MemberException();
		}
	}

	@Override
	public List<Member> searchAll() {
		try {
			return dao.searchAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MemberException();
		}
	}

	@Override
	public boolean login(String id, String pw) {
		try {
			Member member = dao.search(id);
			if (member == null) {
				throw new MemberException("등록되지 않은 회원 아이디입니다.");
			} else {
				if (pw.equals(member.getPassword())) {
					return true;
				} else {
					throw new MemberException("비밀 번호가 틀렸습니다.");
				}
			}
		} catch (MemberException e) {
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
			throw new MemberException();
		}
	}

	@Override
	public boolean checkID(String id) {
		try {
			Member member = dao.search( id);
			if (member == null) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new MemberException();
		}
	}

	@Override
	public void update(Member member) {
		try {
			Member find = dao.search(member.getId());
			if (find == null) {
				throw new MemberException("수정할 회원 정보가 없습니다.");
			} else {
				dao.update(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new MemberException();
		}
	}

	@Override
	public void delete(String id) {
		try {
			Member find = dao.search(id);
			if (find == null) {
				throw new MemberException("탈퇴할 회원 정보가 없습니다.");
			} else {
				dao.delete_faq(id);
				dao.delete_notice(id);
				dao.delete_cart(id);
				dao.delete_mydiet(id);
				dao.delete(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new MemberException();
		}
	}

	@Override
	public void insert(Member member) {
		try {
			if(member.getId()==null) {
				throw new MemberException("아이디를 입력해주세요.");
			}
			if(member.getPassword()==null) {
				throw new MemberException("비밀번호를 입력해주세요.");
			}
			Member find = dao.search(member.getId());
			if (find != null) {
				throw new MemberException("이미 등록된 아이디입니다.");
			} else {
				dao.insert(member);
			}
		} catch(MemberException e) {
			throw e;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new MemberException();
		}
	}

	
}

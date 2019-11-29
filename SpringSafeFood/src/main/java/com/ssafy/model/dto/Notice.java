package com.ssafy.model.dto;

import java.io.Serializable;

public class Notice implements Serializable{
	private int no        	 ;
	private String id        ;
	private String title     ;
	private String contents  ;
	private int viewcnt    ;
	public Notice() {};
	public Notice(String id, String title, String contents) {
		this.id = id;
		this.title = title;
		this.contents = contents;
	}
	public Notice(int no, String id, String title, String contents, int viewcnt) {
		super();
		this.no = no;
		this.id = id;
		this.title = title;
		this.contents = contents;
		this.viewcnt = viewcnt;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	@Override
	public String toString() {
		return "Notice [no=" + no + ", id=" + id + ", title=" + title + ", contents=" + contents + ", viewcnt="
				+ viewcnt + "]";
	}
	
}

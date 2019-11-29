package com.ssafy.model.dto;

public class PageBean {
	private int pageNo;
	private int interval = 5;
	private String pageLink;
	public PageBean() {}
	
	public PageBean(int pageNo) {
		setPageNo(pageNo);
	}
	public PageBean(String pageNo) {
		setPageNo(pageNo);
	}
	private void setPageNo(String pageNo) {
		try {
			this.pageNo = Integer.parseInt(pageNo);
		} catch (Exception e) {
			this.pageNo = 1;
		}
	}
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public void setPageLink(String pageLink) {
		this.pageLink = pageLink;
		
	}

	public String getPageLink() {
		return pageLink;
	}
	public int getInterval() {
		return interval;
	}

	public void setInterval(int interval) {
		this.interval = interval;
	}

	@Override
	public String toString() {
		return "PageBean [pageNo=" + pageNo + ", interval=" + interval + "]";
	}
	
}

package com.ssafy.model.dto;

public class Search {
	String skey;
	int scnt;
	int soption;
	
	public Search() {}

	public Search(String skey, int scnt, int soption) {
		super();
		this.skey = skey;
		this.scnt = scnt;
		this.soption = soption;
	}

	public String getSkey() {
		return skey;
	}

	public void setSkey(String skey) {
		this.skey = skey;
	}

	public int getScnt() {
		return scnt;
	}

	public void setScnt(int scnt) {
		this.scnt = scnt;
	}

	public int getSoption() {
		return soption;
	}

	public void setSoption(int soption) {
		this.soption = soption;
	}

	@Override
	public String toString() {
		return "Search [skey=" + skey + ", scnt=" + scnt + ", soption=" + soption + "]";
	}
	
	
}


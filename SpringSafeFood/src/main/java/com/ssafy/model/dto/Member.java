package com.ssafy.model.dto;

public class Member {
	private String id;
	private String password;
	private String name;
	private String email;
	private String gender;
	private String weight;
	private int du;
	private int cong;
	private int milk;
	private int crab;
	private int shi;
	private int tu;
	private int sal;
	private int suk;
	private int cow;
	private int chi;
	private int pig;
	private int peach;
	private int mind;
	private int egg;

	public Member() {
	}

	public Member(String id, String name, String email, String weight) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.weight = weight;
	}

	public Member(String id, String password, String name, String email, String gender, String weight) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.weight = weight;
	}
	
	public Member(String id, String password, String name, String email,String gender, String weight,  int du, int cong,
			int milk, int crab, int shi, int tu, int sal, int suk, int cow, int chi, int pig, int peach, int mind,
			int egg) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.weight = weight;
		this.du = du;
		this.cong = cong;
		this.milk = milk;
		this.crab = crab;
		this.shi = shi;
		this.tu = tu;
		this.sal = sal;
		this.suk = suk;
		this.cow = cow;
		this.chi = chi;
		this.pig = pig;
		this.peach = peach;
		this.mind = mind;
		this.egg = egg;
	}

	public int getDu() {
		return du;
	}

	public void setDu(int du) {
		this.du = du;
	}

	public int getCong() {
		return cong;
	}

	public void setCong(int cong) {
		this.cong = cong;
	}

	public int getMilk() {
		return milk;
	}

	public void setMilk(int milk) {
		this.milk = milk;
	}

	public int getCrab() {
		return crab;
	}

	public void setCrab(int crab) {
		this.crab = crab;
	}

	public int getShi() {
		return shi;
	}

	public void setShi(int shi) {
		this.shi = shi;
	}

	public int getTu() {
		return tu;
	}

	public void setTu(int tu) {
		this.tu = tu;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public int getSuk() {
		return suk;
	}

	public void setSuk(int suk) {
		this.suk = suk;
	}

	public int getCow() {
		return cow;
	}

	public void setCow(int cow) {
		this.cow = cow;
	}

	public int getChi() {
		return chi;
	}

	public void setChi(int chi) {
		this.chi = chi;
	}

	public int getPig() {
		return pig;
	}

	public void setPig(int pig) {
		this.pig = pig;
	}

	public int getPeach() {
		return peach;
	}

	public void setPeach(int peach) {
		this.peach = peach;
	}

	public int getMind() {
		return mind;
	}

	public void setMind(int mind) {
		this.mind = mind;
	}

	public int getEgg() {
		return egg;
	}

	public void setEgg(int egg) {
		this.egg = egg;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", weight="
				+ weight + ", gender=" + gender + ", du=" + du + ", cong=" + cong + ", milk=" + milk + ", crab=" + crab
				+ ", shi=" + shi + ", tu=" + tu + ", sal=" + sal + ", suk=" + suk + ", cow=" + cow + ", chi=" + chi
				+ ", pig=" + pig + ", peach=" + peach + ", mind=" + mind + ", egg=" + egg + "]";
	}
	
}

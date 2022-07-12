package com.kh.redding.attachment.model.vo;

public class Attachment implements java.io.Serializable{
	private int aid;
	private String originname;
	private String changename;
	private String filepath;
	private int adivision;
	private int bid;
	private int mno;
	private int couponCode;
	private String cno_div;
	
	public Attachment () {}

	public Attachment(int aid, String originname, String changename, String filepath, int adivision, int bid, int mno,
			String acontent, int couponCode, String cno_div) {
		super();
		this.aid = aid;
		this.originname = originname;
		this.changename = changename;
		this.filepath = filepath;
		this.adivision = adivision;
		this.bid = bid;
		this.mno = mno;
		this.couponCode = couponCode;
		this.cno_div = cno_div;
	}

	public String getCno_div() {
		return cno_div;
	}

	public void setCno_div(String cno_div) {
		this.cno_div = cno_div;
	}

	public int getAid() {
		return aid;
	}

	public String getOriginname() {
		return originname;
	}

	public String getChangename() {
		return changename;
	}

	public String getFilepath() {
		return filepath;
	}

	public int getAdivision() {
		return adivision;
	}

	public int getBid() {
		return bid;
	}

	public int getMno() {
		return mno;
	}


	public int getCouponCode() {
		return couponCode;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public void setOriginname(String originname) {
		this.originname = originname;
	}

	public void setChangename(String changename) {
		this.changename = changename;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public void setAdivision(int adivision) {
		this.adivision = adivision;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}


	public void setCouponCode(int couponCode) {
		this.couponCode = couponCode;
	}

	@Override
	public String toString() {
		return "Attachment [aid=" + aid + ", originname=" + originname + ", changename=" + changename + ", filepath="
				+ filepath + ", adivision=" + adivision + ", bid=" + bid + ", mno=" + mno + ","
				+ ", couponCode=" + couponCode + "]";
	}


	
}

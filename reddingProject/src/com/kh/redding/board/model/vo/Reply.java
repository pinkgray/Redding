package com.kh.redding.board.model.vo;

import java.sql.Date;

public class Reply implements java.io.Serializable{
	private int reply_code;
	private Date reply_date;
	private String reply_content;
	private int mno;
	private int bid;
	private Date reply_modify_date;
	
	public Reply() {
		
	}
	
	public Reply(int reply_code, Date reply_date, String reply_content, int mno, int bid, Date reply_modify_date) {
		super();
		this.reply_code = reply_code;
		this.reply_date = reply_date;
		this.reply_content = reply_content;
		this.mno = mno;
		this.bid = bid;
		this.reply_modify_date = reply_modify_date;
	}
	public int getReply_code() {
		return reply_code;
	}
	public void setReply_code(int reply_code) {
		this.reply_code = reply_code;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public Date getReply_modify_date() {
		return reply_modify_date;
	}
	public void setReply_modify_date(Date reply_modify_date) {
		this.reply_modify_date = reply_modify_date;
	}
	
	@Override
	public String toString() {
		return "Reply [reply_code=" + reply_code + ", reply_date=" + reply_date + ", reply_content=" + reply_content
				+ ", mno=" + mno + ", bid=" + bid + ", reply_modify_date=" + reply_modify_date + "]";
	}
	
	

}

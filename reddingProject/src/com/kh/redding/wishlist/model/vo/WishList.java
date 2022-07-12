package com.kh.redding.wishlist.model.vo;

public class WishList  implements java.io.Serializable{
	private int mno;	//회원번호
	private int upno;	//제품코드
	
	public WishList() {}
	
	public WishList(int mno, int upno) {
		super();
		this.mno = mno;
		this.upno = upno;
	}

	public int getMno() {
		return mno;
	}

	public int getUpno() {
		return upno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public void setUpno(int upno) {
		this.upno = upno;
	}

	@Override
	public String toString() {
		return "WishList [mno=" + mno + ", upno=" + upno + "]";
	}
	
	
	
	
}



package com.kh.redding.reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reservation implements Serializable{
	private String userName;       //사용자 이름
	private String userPhone;      //사용자 전화번호
	private String rapplyDate;     //예약일
	private String status;         //예약 상태
	private String startDate;      //제품 이용 시간
	private String endDate;        //제품 이용 마감시간
	private String productName;    //상품명
	private Date completedDate;    //완료 날짜
	private int resNo;             //예약 번호
	private int uNum;              //수량
	private String useDate;        //사용가능 날짜
	private int uPno;              //제품 번호
	
	public Reservation() {}

	

	public Reservation(String userName, String userPhone, String rapplyDate, String status, String startDate,
			String endDate, String productName, Date completedDate, int resNo, int uNum, String useDate, int uPno) {
		super();
		this.userName = userName;
		this.userPhone = userPhone;
		this.rapplyDate = rapplyDate;
		this.status = status;
		this.startDate = startDate;
		this.endDate = endDate;
		this.productName = productName;
		this.completedDate = completedDate;
		this.resNo = resNo;
		this.uNum = uNum;
		this.useDate = useDate;
		this.uPno = uPno;
	}

	


	public int getuNum() {
		return uNum;
	}



	public void setuNum(int uNum) {
		this.uNum = uNum;
	}



	public String getUseDate() {
		return useDate;
	}



	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}



	public int getuPno() {
		return uPno;
	}



	public void setuPno(int uPno) {
		this.uPno = uPno;
	}



	public int getResNo() {
		return resNo;
	}


	public void setResNo(int resNo) {
		this.resNo = resNo;
	}


	public Date getCompletedDate() {
		return completedDate;
	}



	public void setCompletedDate(Date completedDate) {
		this.completedDate = completedDate;
	}



	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getRapplyDate() {
		return rapplyDate;
	}

	public void setRapplyDate(String rapplyDate) {
		this.rapplyDate = rapplyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "Reservation [userName=" + userName + ", userPhone=" + userPhone + ", rapplyDate=" + rapplyDate
				+ ", status=" + status + ", startDate=" + startDate + ", endDate=" + endDate + ", productName="
				+ productName + ", completedDate=" + completedDate + ", resNo=" + resNo + ", uNum=" + uNum
				+ ", useDate=" + useDate + ", uPno=" + uPno + "]";
	}
	
}

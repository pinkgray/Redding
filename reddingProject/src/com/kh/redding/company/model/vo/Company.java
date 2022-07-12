package com.kh.redding.company.model.vo;

import java.sql.Date;

public class Company implements java.io.Serializable {
	
	private int CNO;   //업체번호 
	private int Com_Rep_Num; //사업자번호
	private String RepName; //대표자번호 
	private String ComAddress; //주소
	private String ComUrl; //홈페이지
	private String OpenTime; //시작시간
	private String EndTime; //종료시간
	private int AccountCode;  //은행코드
	private String AccountNum;  //계좌번호
	private String AccountName; //예금주
	private String ComType;  //업체타입
	private int ComLike; //추천수
	private String holiday;  //휴무일
	
	public Company() {
		
	}
	
	

	public Company(int cNO, int com_Rep_Num, String repName, String comAddress, String comUrl, String openTime,
			String endTime, int accountCode, String accountNum, String accountName, String comType, int comLike,
			String holiday) {
		super();
		CNO = cNO;
		Com_Rep_Num = com_Rep_Num;
		RepName = repName;
		ComAddress = comAddress;
		ComUrl = comUrl;
		OpenTime = openTime;
		EndTime = endTime;
		AccountCode = accountCode;
		AccountNum = accountNum;
		AccountName = accountName;
		ComType = comType;
		ComLike = comLike;
		this.holiday = holiday;
	}



	public int getCNO() {
		return CNO;
	}

	public void setCNO(int cNO) {
		CNO = cNO;
	}

	public int getCom_Rep_Num() {
		return Com_Rep_Num;
	}

	public void setCom_Rep_Num(int com_Rep_Num) {
		Com_Rep_Num = com_Rep_Num;
	}

	public String getRepName() {
		return RepName;
	}

	public void setRepName(String repName) {
		RepName = repName;
	}

	public String getComAddress() {
		return ComAddress;
	}

	public void setComAddress(String comAddress) {
		ComAddress = comAddress;
	}

	public String getComUrl() {
		return ComUrl;
	}

	public void setComUrl(String comUrl) {
		ComUrl = comUrl;
	}

	public String getOpenTime() {
		return OpenTime;
	}

	public void setOpenTime(String openTime) {
		OpenTime = openTime;
	}

	public String getEndTime() {
		return EndTime;
	}

	public void setEndTime(String endTime) {
		EndTime = endTime;
	}

	public int getAccountCode() {
		return AccountCode;
	}

	public void setAccountCode(int accountCode) {
		AccountCode = accountCode;
	}

	public String getAccountNum() {
		return AccountNum;
	}

	public void setAccountNum(String accountNum) {
		AccountNum = accountNum;
	}

	public String getAccountName() {
		return AccountName;
	}

	public void setAccountName(String accountName) {
		AccountName = accountName;
	}

	public String getComType() {
		return ComType;
	}

	public void setComType(String comType) {
		ComType = comType;
	}

	public int getComLike() {
		return ComLike;
	}

	public void setComLike(int comLike) {
		ComLike = comLike;
	}

	public String getHoliday() {
		return holiday;
	}

	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}

	@Override
	public String toString() {
		return "Company [CNO=" + CNO + ", Com_Rep_Num=" + Com_Rep_Num + ", RepName=" + RepName + ", ComAddress="
				+ ComAddress + ", ComUrl=" + ComUrl + ", OpenTime=" + OpenTime + ", EndTime=" + EndTime
				+ ", AccountCode=" + AccountCode + ", AccountNum=" + AccountNum + ", AccountName=" + AccountName
				+ ", ComType=" + ComType + ", ComLike=" + ComLike + ", holiday=" + holiday + "]";
	}
	
	

	
	
	
	

	
}

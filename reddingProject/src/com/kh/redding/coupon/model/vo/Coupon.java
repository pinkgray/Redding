package com.kh.redding.coupon.model.vo;

import java.sql.Date;

public class Coupon implements java.io.Serializable {
	private int couponCode;
	private String couponName;
	private String couponDescrition;
	private String couponCategory;
	private String discountType;
	private String discountRate;
	private String discountAmount;
	private String couponStatus;
	private String couponStartDate;
	private String couponEndDate;
	
	public Coupon() {}

	public Coupon(int couponCode, String couponName, String couponDescrition, String couponCategory,
			String discountType, String discountRate, String discountAmount, String couponStatus,
			String couponStartDate, String couponEndDate) {
		super();
		this.couponCode = couponCode;
		this.couponName = couponName;
		this.couponDescrition = couponDescrition;
		this.couponCategory = couponCategory;
		this.discountType = discountType;
		this.discountRate = discountRate;
		this.discountAmount = discountAmount;
		this.couponStatus = couponStatus;
		this.couponStartDate = couponStartDate;
		this.couponEndDate = couponEndDate;
	}

	public int getCouponCode() {
		return couponCode;
	}

	public String getCouponName() {
		return couponName;
	}

	public String getCouponDescrition() {
		return couponDescrition;
	}

	public String getCouponCategory() {
		return couponCategory;
	}

	public String getDiscountType() {
		return discountType;
	}

	public String getDiscountRate() {
		return discountRate;
	}

	public String getDiscountAmount() {
		return discountAmount;
	}

	public String getCouponStatus() {
		return couponStatus;
	}

	public String getCouponStartDate() {
		return couponStartDate;
	}

	public String getCouponEndDate() {
		return couponEndDate;
	}

	public void setCouponCode(int couponCode) {
		this.couponCode = couponCode;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public void setCouponDescrition(String couponDescrition) {
		this.couponDescrition = couponDescrition;
	}

	public void setCouponCategory(String couponCategory) {
		this.couponCategory = couponCategory;
	}

	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}

	public void setDiscountRate(String discountRate) {
		this.discountRate = discountRate;
	}

	public void setDiscountAmount(String discountAmount) {
		this.discountAmount = discountAmount;
	}

	public void setCouponStatus(String couponStatus) {
		this.couponStatus = couponStatus;
	}

	public void setCouponStartDate(String couponStartDate) {
		this.couponStartDate = couponStartDate;
	}

	public void setCouponEndDate(String couponEndDate) {
		this.couponEndDate = couponEndDate;
	}

	@Override
	public String toString() {
		return "Coupon [couponCode=" + couponCode + ", couponName=" + couponName + ", couponDescrition="
				+ couponDescrition + ", couponCategory=" + couponCategory + ", discountType=" + discountType
				+ ", discountRate=" + discountRate + ", discountAmount=" + discountAmount + ", couponStatus="
				+ couponStatus + ", couponStartDate=" + couponStartDate + ", couponEndDate=" + couponEndDate + "]";
	}

	

	
	
}

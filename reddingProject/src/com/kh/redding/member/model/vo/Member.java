package com.kh.redding.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable {
	private int mno;   //회원번호
	private String memberId; //회원아이디
	private String memberPwd; //회원비밀번호
	private String memberName; //회원이름
	private String nickName; //닉네임
	private String phone; //전화번호 
	private String emergenCon; //비상연락주소
	private String email; //이메일
	private String emailCheck; //이메일인증
	private String gender; //성별 
	private Date enrollDate; //등록날짜
	private Date modifyDate; //수정날짜
	private String status; //상태
	private int memberType; //회원타입
	private Date OutDate; //탈퇴날짜
	private Date WeddingDate; //결혼날짜
	private int mnotiType; //신고횟수
	
	public Member() {}

	public Member(int mno, String memberId, String memberPwd, String memberName, String nickName, String phone,
			String emergenCon, String email, String emailCheck, String gender, Date enrollDate, Date modifyDate,
			String status, int memberType, Date outDate, Date weddingDate, int mnotiType) {
		super();
		this.mno = mno;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.nickName = nickName;
		this.phone = phone;
		this.emergenCon = emergenCon;
		this.email = email;
		this.emailCheck = emailCheck;
		this.gender = gender;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.memberType = memberType;
		OutDate = outDate;
		WeddingDate = weddingDate;
		this.mnotiType = mnotiType;
	}



	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmergenCon() {
		return emergenCon;
	}

	public void setEmergenCon(String emergenCon) {
		this.emergenCon = emergenCon;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailCheck() {
		return emailCheck;
	}

	public void setEmailCheck(String emailCheck) {
		this.emailCheck = emailCheck;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMemberType() {
		return memberType;
	}

	public void setMemberType(int string) {
		this.memberType = string;
	}

	public Date getOutDate() {
		return OutDate;
	}

	public void setOutDate(Date outDate) {
		OutDate = outDate;
	}

	public Date getWeddingDate() {
		return WeddingDate;
	}

	public void setWeddingDate(Date weddingDate) {
		WeddingDate = weddingDate;
	}

	public int getMnotiType() {
		return mnotiType;
	}

	public void setMnotiType(int mnotiType) {
		this.mnotiType = mnotiType;
	}

	@Override
	public String toString() {
		return "Member [mno=" + mno + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", nickName=" + nickName + ", phone=" + phone + ", emergenCon=" + emergenCon + ", email="
				+ email + ", emailCheck=" + emailCheck + ", gender=" + gender + ", enrollDate=" + enrollDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + ", memberType=" + memberType + ", OutDate="
				+ OutDate + ", WeddingDate=" + WeddingDate + ", mnotiType=" + mnotiType + "]";
	}

	
	
	
}

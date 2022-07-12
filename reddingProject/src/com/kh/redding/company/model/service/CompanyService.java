package com.kh.redding.company.model.service;

import static com.kh.redding.common.JDBCTemplate.close;
import static com.kh.redding.common.JDBCTemplate.commit;
import static com.kh.redding.common.JDBCTemplate.getConnection;
import static com.kh.redding.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.admin.model.dao.AdminDao;
import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.company.model.dao.CompanyDao;
import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.vo.Member;
import com.kh.redding.wishlist.model.dao.WishListDao;

public class CompanyService {

	//아이디 중복 조회
	public int registerCheck(String userId) {
		Connection con = getConnection();
		
		int result = new CompanyDao().registerCheck(con,userId);
		
		close(con);
		
		return result;
		
	}

	//업체 insert -> 회원가입
	public int insertCompany(Member joinMember, Company joinCompany, Attachment joinAttach) {
		Connection con = getConnection();
		
		int mem_result = new CompanyDao().insertMember(con,joinMember);
		int com_result = 0;
		
		if (mem_result > 0) {
			int mno = new CompanyDao().selectMID(con);
			
			joinCompany.setCNO(mno);
			
			joinAttach.setMno(mno);
			
			System.out.println("cno :"+joinCompany.getCNO());
			
			int att_result = new CompanyDao().insertRegNum(con, joinAttach);
			
			if (att_result > 0) {
				int reg_num = new CompanyDao().selectRegNum(con);
				
				joinCompany.setCom_Rep_Num(reg_num);
				
				com_result = new CompanyDao().insertCompany(con,joinCompany);
			}
			
		}
				
		if (com_result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return com_result;
	}

	//업체 정보 조회 
	public HashMap<String, Object> selectCompanyInf(Member loginUser) {
		//업체 정보를 담아놓는 객체
		Connection con = getConnection();
		
		HashMap<String,Object> loginCompany= new CompanyDao().selectCompanyInf(con,loginUser);
		
		close(con);
		
		return loginCompany;
	}

	public int UpdateMemberPasword(String password, String changepassword, String memberId) {
		Connection con = getConnection();
		
		int result = new CompanyDao().UpdateMemberPassword(con, password, changepassword , memberId);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		return result;
	}

	public int UpdateCompany(Member joinMember, Company joinCompany, Attachment joinAttach) {
		Connection con = getConnection();
		
		int totalresult = 0;
		
		int result = new CompanyDao().UpdateMember(con,joinMember);
		
		if (result > 0) {
			int mno = new CompanyDao().selectCNO(con, joinMember.getMemberId() , joinMember.getMemberPwd());
			
			joinCompany.setCNO(mno);
			
			joinAttach.setMno(mno);
			
			int result2 = new CompanyDao().updateAttachment(con, joinAttach);
			
			if (result2 > 0) {
				
				totalresult = new CompanyDao().UpdateCompany(con, joinCompany);
			}
			
		}

		
		if (totalresult > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		
		return totalresult;
	}

	

	public int UpdateCompany(Member joinMember, Company joinCompany, int aid) {
		Connection con = getConnection();
		
		int totalresult = 0;
		
		int result = new CompanyDao().UpdateMember(con,joinMember);
		
		if (result > 0) {
			int mno = new CompanyDao().selectCNO(con, joinMember.getMemberId() , joinMember.getMemberPwd());
			
			joinCompany.setCNO(mno);
			
			joinCompany.setCom_Rep_Num(aid);
			
			totalresult = new CompanyDao().UpdateCompany(con, joinCompany);
		
		}

		
		if (totalresult > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		
		return totalresult;
	}

	public int insertAttachment(Member loginUser, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		
		int result = new CompanyDao().inserAttachment(con, loginUser.getMno() , fileList);
		
		if (result == fileList.size()) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return result;
	}


	public ArrayList<Attachment> selectCompanyPhoto(int mno) {
		Connection con = getConnection();
		
		ArrayList<Attachment> list = new CompanyDao().selectCompanyPhoto(con,mno);
		
		close(con);
		
		return list;
	}

	//사업자등록증을 뺀 업체 사진이 있는지 확인용
	public int PhotoCount(int cno) {
		Connection con = getConnection();
		
		int count = new CompanyDao().CompanyphotoCount(con, cno);
		
		close(con);
		
		return count;
	}

	//업체 수정
	public int updateAttachment(Attachment changeAttach) {
		Connection con = getConnection();
		
		int result = new CompanyDao().updateAttachment(con , changeAttach);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public HashMap<String, Object> DeletePhoto(int aid) {
		Connection con = getConnection();
		
		HashMap<String,Object> resultHmap = new HashMap<String, Object>();
		
		Attachment attachment = new CompanyDao().selectAttachmemt(con,aid);
		
		resultHmap.put("attachment", attachment);
		
		int result = new CompanyDao().delteAttachment(con,attachment.getAid());
		
		resultHmap.put("result", result);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return resultHmap;
	}

	
	
	//업체 정산 목록 조회 (정연)
	public ArrayList<HashMap<String, Object>> showMonCalc(int mno) {
		Connection con = getConnection();

		ArrayList<HashMap<String, Object>> list = new CompanyDao().showMonCalc(con, mno);

		close(con);

		return list;
	}

	
	//업체가 관리자한테 정산금액 확인 답변 메소드(정연)
	public int answerCalc(int calccode) {
		Connection con = getConnection();

		int result = new CompanyDao().answerCalc(con, calccode);

		if(result>0) {
			commit(con);
		}else{
			rollback(con);
		}
		close(con);


		return result;
	}

	
	//업체 정산 내역 조회(정연)
	public ArrayList<HashMap<String, Object>> calcComHistory(int mno) {
		Connection con = getConnection();

		ArrayList<HashMap<String, Object>> list = new CompanyDao().calcComHistory(con, mno);

		close(con);

		return list;
		
	}

	
	//업체 정산 월별 조건 조회(정연)
	public ArrayList<HashMap<String, Object>> searchMonCalc(int mno, int month) {
		Connection con = getConnection();

		ArrayList<HashMap<String, Object>> list = new CompanyDao().searchMonCalc(con, mno, month);

		close(con);

		return list;

	}

	
}

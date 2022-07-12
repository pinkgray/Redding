package com.kh.redding.company.model.dao;

import static com.kh.redding.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.vo.Member;

public class CompanyDao {

	Properties prop = new Properties();
	
	public CompanyDao() {
		
		String fileName = CompanyDao.class.getResource("/sql/company/company-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//id중복체크
	public int registerCheck(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("idCheck"));
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				 result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return result;
	}

	//업체 회원가입 시 회원용
	public int insertMember(Connection con, Member joinMember) {
		PreparedStatement pstmt =null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, joinMember.getMemberId());
			pstmt.setString(2, joinMember.getMemberPwd());
			pstmt.setString(3, joinMember.getMemberName());
			pstmt.setString(4, joinMember.getEmail());
			pstmt.setString(5, joinMember.getEmailCheck());
			pstmt.setString(6, joinMember.getPhone());
			pstmt.setInt(7, 20);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	//회원가입 시 멤버 db에 넣고 그 id 조회
	public int selectMID(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int mno = 0;
		
		String query = prop.getProperty("selectMNO");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if (rset.next()) {
				mno = rset.getInt("currval");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return mno;
	}

	//업체 등록
	public int insertCompany(Connection con, Company joinCompany) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCompany");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, joinCompany.getCNO());
			pstmt.setInt(2, joinCompany.getCom_Rep_Num());
			pstmt.setString(3, joinCompany.getRepName());
			pstmt.setString(4, joinCompany.getComAddress());
			pstmt.setString(5, joinCompany.getComUrl());
			pstmt.setString(6, joinCompany.getOpenTime());
			pstmt.setString(7, joinCompany.getEndTime());
			pstmt.setInt(8, joinCompany.getAccountCode());
			pstmt.setString(9, joinCompany.getAccountNum());
			pstmt.setString(10, joinCompany.getAccountName());
			pstmt.setString(11, joinCompany.getComType());
			pstmt.setString(12, joinCompany.getHoliday());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//업체 사업자등록 파일 등록
	public int insertRegNum(Connection con, Attachment joinAttach) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertRegNum");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, joinAttach.getOriginname());
			pstmt.setString(2, joinAttach.getChangename());
			pstmt.setString(3, joinAttach.getFilepath());
			pstmt.setInt(4, joinAttach.getMno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	//업체 사업자등록 번호 조회
	public int selectRegNum(Connection con) {
		Statement pstmt = null;
		ResultSet rset = null;
		int reg_num = 0;
		
		String query = prop.getProperty("selectRegNum");
		
		try {
			pstmt = con.createStatement();
			
			rset= pstmt.executeQuery(query);
			
			if (rset.next()) {
				reg_num = rset.getInt(1);
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return reg_num;
	}

	//업체 정보 불러오기
	public HashMap<String, Object> selectCompanyInf(Connection con, Member loginUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String,Object> loginCompany =null;
		Company company = null;
		Member member = null;
		Attachment attachment = null;
		
		String query = prop.getProperty("selectCompany");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, loginUser.getMno());
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				loginCompany = new HashMap<String,Object>();
				
				member = new Member();
				company = new Company();
				attachment = new Attachment();
				
				member.setMno(rset.getInt("MNO"));
				member.setMemberId(rset.getString("MID"));
				member.setMemberPwd(rset.getString("MPWD"));
				member.setMemberName(rset.getString("MNAME"));
				member.setEmail(rset.getString("EMAIL"));
				member.setEmailCheck(rset.getString("EMAIL_CHECK"));
				member.setPhone(rset.getString("PHONE"));
				
				company.setCNO(rset.getInt("MNO"));
				company.setCom_Rep_Num(rset.getInt("AID"));
				company.setRepName(rset.getString("rep_name"));
				company.setComAddress(rset.getString("com_address"));
				company.setComUrl(rset.getString("com_url"));
				company.setOpenTime(rset.getString("open_times"));
				company.setEndTime(rset.getString("close_times"));
				company.setAccountCode(rset.getInt("account_code"));
				company.setAccountNum(rset.getString("account_num"));
				company.setAccountName(rset.getString("account_name"));
				company.setComType(rset.getString("com_type"));
				company.setHoliday(rset.getString("holiday"));
				
				attachment.setAid(rset.getInt("AID"));
				attachment.setOriginname(rset.getString("origin_name"));
				attachment.setChangename(rset.getString("CHANGE_NAME"));
				attachment.setFilepath(rset.getString("FILE_PATH"));
				attachment.setAdivision(rset.getInt("ADIVISION"));		
			}
			
			loginCompany.put("member", member);
			loginCompany.put("company", company);
			loginCompany.put("attachment", attachment);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return loginCompany;
	}

	//업체 비밀번호 변경
	public int UpdateMemberPassword(Connection con, String password, String changepassword, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("UpdatePassword");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, changepassword);
			pstmt.setString(2, memberId);
			pstmt.setString(3, password);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	//업체 개인정보 수정
	public int UpdateCompany(Connection con, Company joinCompany) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("UpdateCompany");
		
		try {
			pstmt = con.prepareStatement(query);
		
		
			pstmt.setString(1, joinCompany.getRepName());
			pstmt.setString(2, joinCompany.getComAddress());
			pstmt.setString(3, joinCompany.getComUrl());
			pstmt.setInt(4, joinCompany.getAccountCode());
			pstmt.setString(5, joinCompany.getAccountNum());
			pstmt.setString(6, joinCompany.getAccountName());
			pstmt.setString(7, joinCompany.getComType());
			pstmt.setInt(8, joinCompany.getCNO());
			pstmt.setInt(9, joinCompany.getCom_Rep_Num());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		
		return result;
	}

	public int UpdateMember(Connection con, Member joinMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("UpdateMember");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setString(1, joinMember.getMemberName());
			pstmt.setString(2, joinMember.getEmail());
			pstmt.setString(3, joinMember.getEmailCheck());
			pstmt.setString(4, joinMember.getPhone());
			pstmt.setString(5, joinMember.getMemberId());
			pstmt.setString(6, joinMember.getMemberPwd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		
		return result;
	}

	public int updateAttachment(Connection con, Attachment joinAttach) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("UpdateAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
		
			
			pstmt.setString(1, joinAttach.getOriginname());
			pstmt.setString(2, joinAttach.getChangename());
			pstmt.setInt(3, joinAttach.getAid());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		
		return result;
	}

	public int selectCNO(Connection con, String memberId, String memberPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int cno = 0;
		
		String query = prop.getProperty("selectCNO");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				cno = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return cno;
	}

	public int inserAttachment(Connection con, int mno, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query  = prop.getProperty("insertAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			
			for (int i = 0 ; i < fileList.size() ; i++) {
				pstmt.setString(1, fileList.get(i).getOriginname());
				pstmt.setString(2, fileList.get(i).getChangename());
				pstmt.setString(3, fileList.get(i).getFilepath());
				pstmt.setInt(4, mno);
				pstmt.setString(5, fileList.get(i).getCno_div());
				
				result += pstmt.executeUpdate();
			}
		
			System.out.println("완료" + result);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public ArrayList<Attachment> selectCompanyPhoto(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ArrayList<Attachment> list = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			
			while(rset.next()) {
				Attachment at = new Attachment();
	         
	            at.setAid(rset.getInt("AID"));
	            at.setOriginname(rset.getString("ORIGIN_NAME"));
	            at.setChangename(rset.getString("CHANGE_NAME"));
	            at.setFilepath(rset.getString("file_path"));
	            at.setMno(rset.getInt("mno"));
	            at.setCno_div(rset.getString("cno_div"));
				
				list.add(at);	
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	//업체 사진 숫자
	public int CompanyphotoCount(Connection con, int cno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("selectPhotoCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return count;
	}

	public Attachment selectAttachmemt(Connection con, int aid) {
		PreparedStatement pstmt = null;
		Attachment attach = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOneAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, aid);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				attach = new Attachment();
				
				attach.setChangename(rset.getString("CHANGE_NAME"));
				attach.setFilepath(rset.getString("FILE_PATH"));
				attach.setAid(rset.getInt("AID"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return attach;
	}

	public int delteAttachment(Connection con, int aid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, aid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	
	//업체 정산 목록 조회 (정연)
	public ArrayList<HashMap<String, Object>> showMonCalc(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
	
		
		String query = prop.getProperty("showMonCalc");
		
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			
			rset= pstmt.executeQuery();

			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap =new HashMap<String, Object>();
				
				hmap.put("calccode", rset.getInt("CALCCODE"));
				hmap.put("final", rset.getInt("FINAL"));
				hmap.put("caldate", rset.getDate("CALCDATE"));
				hmap.put("confirm", rset.getString("CONFIRM"));
				hmap.put("answer", rset.getString("ANSWER"));
				hmap.put("checkdate", rset.getDate("CHECKDATE"));
				hmap.put("repcalc", rset.getInt("REPCALC"));
				hmap.put("cno", rset.getInt("CNO"));
				hmap.put("cname", rset.getString("CNAME"));
				hmap.put("month", rset.getString("MON"));
				
				list.add(hmap);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	
	//업체가 관리자한테 정산금액 확인 답변 메소드(정연)
	public int answerCalc(Connection con, int calccode) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("answerCalc");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, calccode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	//업체 정산 내역 조회(정연)
	public ArrayList<HashMap<String, Object>> calcComHistory(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
	
		
		String query = prop.getProperty("calcComHistory");
		
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			
			rset= pstmt.executeQuery();

			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap =new HashMap<String, Object>();
				
				hmap.put("calccode", rset.getInt("CALCCODE"));
				hmap.put("final", rset.getInt("FINAL"));
				hmap.put("caldate", rset.getDate("CALCDATE"));
				hmap.put("confirm", rset.getString("CONFIRM"));
				hmap.put("answer", rset.getString("ANSWER"));
				hmap.put("checkdate", rset.getDate("CHECKDATE"));
				hmap.put("repcalc", rset.getInt("REPCALC"));
				hmap.put("cno", rset.getInt("CNO"));
				hmap.put("cname", rset.getString("CNAME"));
				hmap.put("month", rset.getString("MON"));
				
				list.add(hmap);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	
	
	//업체 정산 월별 조건 조회(정연)
	public ArrayList<HashMap<String, Object>> searchMonCalc(Connection con, int mno, int month) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("searchMonCalc");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			pstmt.setInt(2, month);

			rset= pstmt.executeQuery();

			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("calccode", rset.getInt("CALCCODE"));
				hmap.put("price", rset.getInt("FINAL"));
				hmap.put("caldate", rset.getDate("CALCDATE"));
				hmap.put("confirm", rset.getString("CONFIRM"));
				hmap.put("answer", rset.getString("ANSWER"));
				hmap.put("checkdate", rset.getDate("CHECKDATE"));
				hmap.put("repcalc", rset.getInt("REPCALC"));
				hmap.put("cno", rset.getInt("CNO"));
				hmap.put("cname", rset.getString("CNAME"));
				hmap.put("month", rset.getString("MON"));
				
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	


}

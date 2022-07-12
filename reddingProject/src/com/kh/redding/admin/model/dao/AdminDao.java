package com.kh.redding.admin.model.dao;

import static com.kh.redding.common.JDBCTemplate.close;

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

import com.kh.redding.admin.model.vo.TotalMemberPageInfo;
import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.dao.MemberDao;
import com.kh.redding.member.model.vo.Member;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		
		String fileName = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	// 전체 회원 목록 조회용 메소드 (페이징 처리) (효정)
	public ArrayList<HashMap<String, Object>> selectMemberList(Connection con, TotalMemberPageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String,Object> hlist = null;
		String num = "";
		Member member = null;
		 
		String query = prop.getProperty("selectMemberListAfterPaging");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
						
			rset = pstmt.executeQuery();
						
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hlist = new HashMap<String,Object>();
				member = new Member();
				
				num = rset.getInt("RNUM")+ "";
				member.setMno(rset.getInt("MNO"));
				member.setMemberId(rset.getString("MID"));
				member.setMemberPwd(rset.getString("MPWD"));
				member.setMemberName(rset.getString("MNAME"));
				member.setNickName(rset.getString("NICK_NAME"));
				member.setPhone(rset.getString("PHONE"));
				member.setEmergenCon(rset.getString("EMERGEN_CON"));
				member.setEmail(rset.getString("EMAIL"));
				member.setEmailCheck(rset.getString("EMAIL_CHECK"));
				member.setGender(rset.getString("GENDER"));
				member.setEnrollDate(rset.getDate("ENROLL_DATE"));
				member.setModifyDate(rset.getDate("MODIFY_DATE"));
				member.setStatus(rset.getString("STATUS"));
				member.setMemberType(rset.getInt("MTYPE"));
				member.setWeddingDate(rset.getDate("WEDDING_DATE"));

				
				hlist.put("num", num);
				hlist.put("member", member);
				list.add(hlist);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	
	// 전체 회원 수 조회용 메소드 (효정)
	public int getAllListCount(Connection con) {
		
		Statement stmt = null;
		int allMemberListCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("allMemberlistCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				allMemberListCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return allMemberListCount;
	}
		
	// 신규 회원 수 조회용 메소드 (효정)
	public int getNewListCount(Connection con) {
		Statement stmt = null;
		int newMemberlistCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("newMemberlistCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				newMemberlistCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return newMemberlistCount;
	}

	// 탈퇴 회원 수 조회용 메소드 (효정)
	public int allMemberListCount(Connection con) {
		Statement stmt = null;
		int withdrawalMemberlistCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("withdrawalMemberlistCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				withdrawalMemberlistCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return withdrawalMemberlistCount;
	}

	// 회원 상세 정보 조회용 메소드 (효정)
	public Member selectOneMember(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member onemember = null;
		
		String query = prop.getProperty("selectOneMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				onemember = new Member();
				
				onemember.setMno(rset.getInt("MNO"));
				onemember.setMemberId(rset.getString("MID"));
				onemember.setMemberPwd(rset.getString("MPWD"));
				onemember.setMemberName(rset.getString("MNAME"));
				onemember.setNickName(rset.getString("NICK_NAME"));
				onemember.setPhone(rset.getString("PHONE"));
				onemember.setEmergenCon(rset.getString("EMERGEN_CON"));
				onemember.setEmail(rset.getString("EMAIL"));
				onemember.setEmailCheck(rset.getString("EMAIL_CHECK"));
				onemember.setGender(rset.getString("GENDER"));
				onemember.setEnrollDate(rset.getDate("ENROLL_DATE"));
				onemember.setMnotiType(rset.getInt("MNOTI_TYPE"));
				onemember.setStatus(rset.getString("STATUS"));
				onemember.setWeddingDate(rset.getDate("WEDDING_DATE"));
				onemember.setOutDate(rset.getDate("OUT_DATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return onemember;
		
	}
	
	// 전체 업체 목록 조회용 메소드 (페이징 처리) (효정)
	public ArrayList<HashMap<String, Object>> selectCompanyList(Connection con, TotalMemberPageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String,Object> hlist = null;
		String num = "";
		String comType = "";
		Member member = null;
		
		String query = prop.getProperty("selectCompanyListAfterPaging");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
						
			rset = pstmt.executeQuery();
						
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hlist = new HashMap<String,Object>();
				member = new Member();
				
				num = rset.getInt("RNUM")+ "";
				comType = rset.getString("COM_TYPE");
				member.setMno(rset.getInt("MNO"));
				member.setMemberId(rset.getString("MID"));
				member.setMemberPwd(rset.getString("MPWD"));
				member.setMemberName(rset.getString("MNAME"));
				member.setNickName(rset.getString("NICK_NAME"));
				member.setPhone(rset.getString("PHONE"));
				member.setEmergenCon(rset.getString("EMERGEN_CON"));
				member.setEmail(rset.getString("EMAIL"));
				member.setEmailCheck(rset.getString("EMAIL_CHECK"));
				member.setGender(rset.getString("GENDER"));
				member.setEnrollDate(rset.getDate("ENROLL_DATE"));
				member.setModifyDate(rset.getDate("MODIFY_DATE"));
				member.setStatus(rset.getString("STATUS"));
				member.setMemberType(rset.getInt("MTYPE"));
				member.setWeddingDate(rset.getDate("WEDDING_DATE"));
				
				// System.out.println(num);
				
				hlist.put("num", num);
				hlist.put("comType", comType);
				hlist.put("member", member);
				list.add(hlist);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	// 전체 업체 수 조회용 메소드 (효정)
	public int getAllCompanyListCount(Connection con) {
		Statement stmt = null;
		int allCompanylistCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("allCompanylistCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				allCompanylistCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return allCompanylistCount;
	}

	// 신규 업체 수 조회용 메소드 (효정)
	public int getNewCompanyCount(Connection con) {
		Statement stmt = null;
		int newCompanylistCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("newCompanylistCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				newCompanylistCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return newCompanylistCount;
	}

	// 탈퇴 업체 수 조회용 메소드 (효정)
	public int getWithdrawalCompanyListCount(Connection con) {
		Statement stmt = null;
		int withdrawalCompanylistCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("withdrawalCompanylistCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				withdrawalCompanylistCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return withdrawalCompanylistCount;
	}

	// 업세 상세 정보 조회용 메소드 (효정)
	public ArrayList<HashMap<String, Object>> selectOneCompany2(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> oneCompany = null;
		HashMap<String,Object> hlist = null;
		Member member = null;
		Company company = null;
		
		String query = prop.getProperty("selectOneCompany");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			oneCompany = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hlist = new HashMap<String,Object>();
				
				member = new Member();
				member.setMemberId(rset.getString("MID"));
				member.setMemberPwd(rset.getString("MPWD"));
				member.setMemberName(rset.getString("MNAME"));
				member.setPhone(rset.getString("PHONE"));
				member.setEmail(rset.getString("EMAIL"));
				member.setEmailCheck(rset.getString("EMAIL_CHECK"));
				member.setEnrollDate(rset.getDate("ENROLL_DATE"));
				member.setMnotiType(rset.getInt("MNOTI_TYPE"));
				member.setStatus(rset.getString("STATUS"));
				member.setOutDate(rset.getDate("OUT_DATE"));
				
				company = new Company();
				company.setCNO(rset.getInt("CNO"));
				company.setCom_Rep_Num(rset.getInt("COM_REP_NUM"));
				company.setRepName(rset.getString("REP_NAME"));
				company.setComAddress(rset.getString("COM_ADDRESS"));
				company.setComUrl(rset.getString("COM_URL"));
				company.setOpenTime(rset.getString("OPEN_TIMES"));
				company.setEndTime(rset.getString("CLOSE_TIMES"));
				company.setAccountCode(rset.getInt("ACCOUNT_CODE"));
				company.setAccountNum(rset.getString("ACCOUNT_NUM"));
				company.setAccountName(rset.getString("ACCOUNT_NAME"));
				company.setComType(rset.getString("COM_TYPE"));
				company.setComLike(rset.getInt("COM_LIKE"));
				company.setHoliday(rset.getString("HOLIDAY"));
				
				hlist.put("member", member);
				hlist.put("company", company);
				oneCompany.add(hlist);
				
				//System.out.println(oneCompany);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return oneCompany;
	}

	
	
	//회원 정산 갯수 리턴용 메소드(정연)
	public int getCalcCount(Connection con) {
		Statement stmt = null;
		int calcCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("allCalcCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				calcCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return calcCount;
	}

	
	//회원 정산관리 조회용 메소드(정연)
	public ArrayList<HashMap<String, Object>> showCalc(Connection con, TotalMemberPageInfo pi) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;

		String query = prop.getProperty("showCalc");
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			
			rset= pstmt.executeQuery();

			list = new ArrayList<HashMap<String,Object>>();

			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("rnum", rset.getInt("RNUM"));
				hmap.put("mname", rset.getString("MNAME"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("pselect", rset.getString("PSELECT"));
				hmap.put("pstatus", rset.getString("PSTATUS"));
				hmap.put("payno", rset.getInt("PAYNO"));
				hmap.put("mno", rset.getInt("MNO"));
				hmap.put("upno", rset.getInt("UPNO"));
				hmap.put("paydiv", rset.getString("PAYDIV"));
				hmap.put("cno", rset.getInt("CNO"));
				hmap.put("cname", rset.getString("CNAME"));
				hmap.put("pname", rset.getString("PNAME"));
				hmap.put("paycode", rset.getString("PAYCODE"));
				hmap.put("appdate", rset.getDate("APPDATE"));
				hmap.put("pcompdate", rset.getDate("PCOMPDATE"));
				hmap.put("cardcode", rset.getString("CARDCODE"));
				hmap.put("replaycode", rset.getInt("REPLAYCODE"));
				hmap.put("fprice", rset.getInt("FPRICE"));
				
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

	/*public ArrayList<HashMap<String, Object>> searchCompanyList(Connection con, TotalMemberPageInfo pi, ArrayList searchConditionList) {
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> searchCompanyList = null;
		HashMap<String, Object> hlist = null;
		Member member = null;
		String num = "";
		String comType = "";
		
		String query = prop.getProperty("selectSearchCompanyList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		String companyName = searchConditionList.get(0).toString();
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, companyName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			searchCompanyList = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hlist = new HashMap<String,Object>();
				member = new Member();
				
				num = rset.getInt("RNUM")+ "";
				comType = rset.getString("COM_TYPE");
				member.setMno(rset.getInt("MNO"));
				member.setMemberId(rset.getString("MID"));
				member.setMemberPwd(rset.getString("MPWD"));
				member.setMemberName(rset.getString("MNAME"));
				member.setNickName(rset.getString("NICK_NAME"));
				member.setPhone(rset.getString("PHONE"));
				member.setEmergenCon(rset.getString("EMERGEN_CON"));
				member.setEmail(rset.getString("EMAIL"));
				member.setEmailCheck(rset.getString("EMAIL_CHECK"));
				member.setGender(rset.getString("GENDER"));
				member.setEnrollDate(rset.getDate("ENROLL_DATE"));
				member.setModifyDate(rset.getDate("MODIFY_DATE"));
				member.setStatus(rset.getString("STATUS"));
				member.setMemberType(rset.getInt("MTYPE"));
				member.setWeddingDate(rset.getDate("WEDDING_DATE"));
								
				hlist.put("num", num);
				hlist.put("comType", comType);
				hlist.put("member", member);
				searchCompanyList.add(hlist);
				System.out.println("searchConditionList디에이오 : " + searchConditionList);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return searchCompanyList;
	}*/

	// 검색한 업체 목록 조회용 메소드 (효정)
	public ArrayList<HashMap<String, Object>> searchCompanyList(Connection con, ArrayList searchConditionList) {
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> searchCompanyList = null;
		HashMap<String, Object> hlist = null;
		Member member = null;
		String num = "";
		String comType = "";
		
		String query = prop.getProperty("selectSearchCompanyList");
		
		System.out.println("업체검색쿼리 : " + query);
		
		String companyName = searchConditionList.get(0).toString();
		String companyCategory = searchConditionList.get(1).toString();
		String companyEnrollDate = searchConditionList.get(2).toString();
		String companyStatus = searchConditionList.get(3).toString();
		String firstDate = searchConditionList.get(4).toString();
		String lastDate = searchConditionList.get(5).toString();
		
		try {
			pstmt = con.prepareStatement(query);
			
			if(companyName.equals("")) { // 업체명 널일 때 (1)
				
				if(!companyCategory.equals("전체")) { // 업체명이 널이고, 카테고리 전체 아닐 때 (2)
					
					if(!companyEnrollDate.equals("전체")) { // 업체명이 널이고, 카테고리 전체 아니고, 가입일 전체 아닐 때 (3)
						
						if(!companyStatus.equals("전체")) { // 업체명이 널이고, 카테고리 전체 아니고, 가입일 전체 아니고, 상태 전체 아닐 때 (4)
							
							if(companyEnrollDate.equals("검색")) { // 가입일 검색일 때
								pstmt.setString(1, companyCategory);
								pstmt.setString(2, firstDate);
								pstmt.setString(3, lastDate);
								pstmt.setString(4, companyStatus);
							}
							
						}else { // 업체명이 널이고, 카테고리 전체 아니고, 가입일 전체 아니고, 상태 전체일 때 (4)
							
							if(companyEnrollDate.equals("검색")) { // 가입일 검색일 때
								pstmt.setString(1, companyCategory);
								pstmt.setString(2, firstDate);
								pstmt.setString(3, lastDate);
							}
						}
						
					}else { // 업체명이 널이고, 카테고리 전체 아니고, 가입일 전체일 때 (3)
						
						if(!companyStatus.equals("전체")) { // 업체명이 널이고, 카테고리 전체 아니고, 가입일 전체이고, 상태 전체 아닐 때 (4)
							pstmt.setString(1, companyCategory);
							pstmt.setString(2, companyStatus);
							
						}else { // 업체명이 널이고, 카테고리 전체 아니고, 가입일 전체 전체이고, 상태 전체일 때 (4)
							pstmt.setString(1, companyCategory);
						}
					}
					
				}else { // 업체명이 널이고, 카테고리 전체일 때 (2)
					
					if(!companyEnrollDate.equals("전체")) { // 업체명이 널이고, 카테고리 전체이고, 가입일 전체 아닐 때 (3)
						
						if(!companyStatus.equals("전체")) { // 업체명이 널이고, 카테고리 전체이고, 가입일 전체 아니고, 상태 전체 아닐 때 (4)
							
							if(companyEnrollDate.equals("검색")) { // 가입일 검색일 때
								pstmt.setString(1, firstDate);
								pstmt.setString(2, lastDate);
								pstmt.setString(3, companyStatus);
							}
							
						}else { // 업체명이 널이고, 카테고리 전체이고, 가입일 전체 아니고, 상태 전체일 때 (4)
							
							if(companyEnrollDate.equals("검색")) { // 가입일 검색일 때
								pstmt.setString(1, firstDate);
								pstmt.setString(2, lastDate);
							}
						}
						
					}else { // 업체명이 널이고, 카테고리 전체이고, 가입일 전체일 때 (3)
						
						if(!companyStatus.equals("전체")) { // 업체명이 널이고, 카테고리 전체이고, 가입일 전체이고, 상태 전체가 아닐 때 (4)
							pstmt.setString(1, companyStatus);
							
						}else { // 업체명이 널이고, 카테고리 전체이고, 가입일 전체이고, 상태  전체일 때
							
						}
					}
				}
				
			}else { //업체명이 널이 아닐 때
				
				if(!companyCategory.equals("전체")) { // 업체명이 널이 아니고, 카테고리 전체 아닐 때 (2)
					
					if(!companyEnrollDate.equals("전체")) { // 업체명이 널이 아니고, 카테고리 전체 아니고, 가입일 전체 아닐 때 (3)
						
						if(!companyStatus.equals("전체")) { // 업체명이 널이 아니고, 카테고리 전체 아니고, 가입일 전체 아니고, 상태 전체 아닐 때 (4)
							
							if(companyEnrollDate.equals("검색")) { // 가입일 검색일 때
								pstmt.setString(1, companyName);
								pstmt.setString(2, companyCategory);
								pstmt.setString(3, firstDate);
								pstmt.setString(4, lastDate);
								pstmt.setString(5, companyStatus);
							}
							
						}else { // 업체명이 널이 아니고, 카테고리 전체 아니고, 가입일 전체 아니고, 상태 전체일 때 (4)
							
							if(companyEnrollDate.equals("검색")) { // 가입일 검색일 때
								pstmt.setString(1, companyName);
								pstmt.setString(2, companyCategory);
								pstmt.setString(3, firstDate);
								pstmt.setString(4, lastDate);
							}
						}
						
					}else { // 업체명이 널이 아니고, 카테고리 전체 아니고, 가입일 전체일 때 (3)
						
						if(!companyStatus.equals("전체")) { // 업체명이 널이 아니고, 카테고리 전체 아니고, 가입일 전체이고, 상태 전체 아닐 때 (4)
							pstmt.setString(1, companyName);
							pstmt.setString(2, companyCategory);
							pstmt.setString(3, companyStatus);
							
						}else { // 업체명이 널이 아니고, 카테고리 전체 아니고, 가입일 전체 전체이고, 상태 전체일 때 (4)
							pstmt.setString(1, companyName);
							pstmt.setString(2, companyCategory);
						}
					}
					
				}else { // 업체명이 널이 아니고, 카테고리 전체일 때 (2)
					
					if(!companyEnrollDate.equals("전체")) { // 업체명이 널이 아니고, 카테고리 전체이고, 가입일 전체 아닐 때 (3)
						
						if(!companyStatus.equals("전체")) { // 업체명이 널이 아니고, 카테고리 전체이고, 가입일 전체 아니고, 상태 전체 아닐 때 (4)
							
							if(companyEnrollDate.equals("검색")) { // 가입일 검색일 때
								pstmt.setString(1, companyName);
								pstmt.setString(2, firstDate);
								pstmt.setString(3, lastDate);
								pstmt.setString(4, companyStatus);
							}
							
						}else { // 업체명이 널이 아니고, 카테고리 전체이고, 가입일 전체 아니고, 상태 전체일 때 (4)
							
							if(companyEnrollDate.equals("검색")) { // 가입일 검색일 때
								pstmt.setString(1, companyName);
								pstmt.setString(2, firstDate);
								pstmt.setString(3, lastDate);
							}
						}
						
					}else { // 업체명이 널이 아니고, 카테고리 전체이고, 가입일 전체일 때 (3)
						
						if(!companyStatus.equals("전체")) { // 업체명이 널이 아니고, 카테고리 전체이고, 가입일 전체이고, 상태 전체가 아닐 때 (4)
							pstmt.setString(1, companyName);
							pstmt.setString(2, companyStatus);
							
						}else { // 업체명이 널이 아니고, 카테고리 전체이고, 가입일 전체이고, 상태  전체일 때
							pstmt.setString(1, companyName);
							
						}
					}
				}
				
			}
			
			rset = pstmt.executeQuery();
			
			searchCompanyList = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hlist = new HashMap<String,Object>();
				member = new Member();
				
				num = rset.getInt("RNUM")+ "";
				comType = rset.getString("COM_TYPE");
				member.setMno(rset.getInt("MNO"));
				member.setMemberId(rset.getString("MID"));
				member.setMemberPwd(rset.getString("MPWD"));
				member.setMemberName(rset.getString("MNAME"));
				member.setNickName(rset.getString("NICK_NAME"));
				member.setPhone(rset.getString("PHONE"));
				member.setEmergenCon(rset.getString("EMERGEN_CON"));
				member.setEmail(rset.getString("EMAIL"));
				member.setEmailCheck(rset.getString("EMAIL_CHECK"));
				member.setGender(rset.getString("GENDER"));
				member.setEnrollDate(rset.getDate("ENROLL_DATE"));
				member.setModifyDate(rset.getDate("MODIFY_DATE"));
				member.setStatus(rset.getString("STATUS"));
				member.setMemberType(rset.getInt("MTYPE"));
				member.setWeddingDate(rset.getDate("WEDDING_DATE"));
				
				// System.out.println(num);
				
				hlist.put("num", num);
				hlist.put("comType", comType);
				hlist.put("member", member);
				searchCompanyList.add(hlist);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return searchCompanyList;
	}


	// 검색한 회원 목록 조회용 메소드 (효정)
	public ArrayList<HashMap<String, Object>> searchMemberList(Connection con, ArrayList searchConditionList) {

		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> searchMemberList = null;
		HashMap<String, Object> hlist = null;
		Member member = null;
		String num = "";
		
		String query = prop.getProperty("selectSearchMemberList");
		
		System.out.println("멤버검색쿼리 : " + query);
		
		String memberInfoSelect = searchConditionList.get(0).toString();
		String memberInfoInput = searchConditionList.get(1).toString();
		String memberEnrollDate = searchConditionList.get(2).toString();
		String efirstDate = searchConditionList.get(3).toString();
		String elastDate = searchConditionList.get(4).toString();
		String memberWeddingDate = searchConditionList.get(5).toString();
		String wfirstDate = searchConditionList.get(6).toString();
		String wlastDate = searchConditionList.get(7).toString();
		String memberStatus = searchConditionList.get(8).toString();
		
		try {
			pstmt = con.prepareStatement(query);
			
			
			if(!memberInfoSelect.equals("- 선택 -")) { // 개인정보 검색 전체 아닐 때 (1)
				
				if(!memberStatus.equals("전체")) { // 개인정보 검색이 전체가 아니고, 활동상태가 전체가 아닐 때 (2)
					
					if(!memberEnrollDate.equals("전체")) { // 개인정보 검색이 전체가 아니고, 활동상태가 전체가 아니고, 가입일이 전체가 아닐 때 (3)
						
						if(!memberWeddingDate.equals("전체")) { // 개인정보 검색이 전체가 아니고, 활동상태가 전체가 아니고, 가입일이 전체가 아니고, 결혼예정일이 전체가 아닐 때 (4)
							
							if(memberEnrollDate.equals("검색") && memberWeddingDate.equals("검색")) {
								
								pstmt.setString(1, memberInfoInput);
								pstmt.setString(2, memberStatus);
								pstmt.setString(3, efirstDate);
								pstmt.setString(4, elastDate);
								pstmt.setString(5, wfirstDate);
								pstmt.setString(6, wlastDate);
								
							}
							
						}else { // 개인정보 검색이 전체가 아니고, 활동상태가 전체가 아니고, 가입일이 전체가 아니고, 결혼예정일이 전체일 때 (4)
							
							if(memberEnrollDate.equals("검색")) {
								
								pstmt.setString(1, memberInfoInput);
								pstmt.setString(2, memberStatus);
								pstmt.setString(3, efirstDate);
								pstmt.setString(4, elastDate);
								
							}
							
						}
						
					}else { // 개인정보 검색이 전체가 아니고, 활동상태가 전체가 아니고, 가입일이 전체일 때 (3)
						
						if(!memberWeddingDate.equals("전체")) { // 개인정보 검색이 전체가 아니고, 활동상태가 전체가 아니고, 가입일이 전체이고, 결혼예정일이 전체가 아닐 때 (4)
							
							if(memberWeddingDate.equals("검색")) {
								
								pstmt.setString(1, memberInfoInput);
								pstmt.setString(2, memberStatus);
								pstmt.setString(3, wfirstDate);
								pstmt.setString(4, wlastDate);
								
							}
							
						}else { // 개인정보 검색이 전체가 아니고, 활동상태가 전체가 아니고, 가입일이 전체이고, 결혼예정일이 전체일 때 (4)
								
							pstmt.setString(1, memberInfoInput);
							pstmt.setString(2, memberStatus);
							
						}

					}
					
				}else { // 개인정보 검색이 전체가 아니고, 활동상태가 전체일 때 (2)
					
					if(!memberEnrollDate.equals("전체")) { // 개인정보 검색이 전체가 아니고, 활동상태가 전체이고, 가입일이 전체가 아닐 때 (3)
						
						if(!memberWeddingDate.equals("전체")) { // 개인정보 검색이 전체가 아니고, 활동상태가 전체이고, 가입일이 전체가 아니고, 결혼예정일이 전체가 아닐 때 (4)
							
							if(memberEnrollDate.equals("검색") && memberWeddingDate.equals("검색")) {
								
								pstmt.setString(1, memberInfoInput);
								pstmt.setString(2, efirstDate);
								pstmt.setString(3, elastDate);
								pstmt.setString(4, wfirstDate);
								pstmt.setString(5, wlastDate);
								
							}
							
						}else { // 개인정보 검색이 전체가 아니고, 활동상태가 전체이고, 가입일이 전체가 아니고, 결혼예정일이 전체일 때 (4)
							
							if(memberEnrollDate.equals("검색")) {
								
								pstmt.setString(1, memberInfoInput);
								pstmt.setString(2, efirstDate);
								pstmt.setString(3, elastDate);
								
							}
							
						}
						
					}else { // 개인정보 검색이 전체가 아니고, 활동상태가 전체이고, 가입일이 전체일 때 (3)
						
						if(!memberWeddingDate.equals("전체")) { // 개인정보 검색이 전체가 아니고, 활동상태가 전체이고, 가입일이 전체이고, 결혼예정일이 전체가 아닐 때 (4)
							
							if(memberWeddingDate.equals("검색")) {
								
								pstmt.setString(1, memberInfoInput);
								pstmt.setString(2, wfirstDate);
								pstmt.setString(3, wlastDate);
								
							}
							
						}else { // 개인정보 검색이 전체가 아니고, 활동상태가 전체이고, 가입일이 전체이고, 결혼예정일이 전체일 때 (4)
								
							pstmt.setString(1, memberInfoInput);
							
						}
						
					}
					
				}
				
			}else { // 개인정보 검색 전체일 때 (1)
				
				if(!memberStatus.equals("전체")) { // 개인정보 검색이 전체이고, 활동상태가 전체가 아닐 때 (2)
					
					if(!memberEnrollDate.equals("전체")) { // 개인정보 검색이 전체이고, 활동상태가 전체가 아니고, 가입일이 전체가 아닐 때 (3)
							
						if(!memberWeddingDate.equals("전체")) { // 개인정보 검색이 전체이고, 활동상태가 전체가 아니고, 가입일이 전체가 아니고, 결혼예정일이 전체가 아닐 때 (4)
							
							if(memberEnrollDate.equals("검색") && memberWeddingDate.equals("검색")) {
								
								pstmt.setString(1, memberStatus);
								pstmt.setString(2, efirstDate);
								pstmt.setString(3, elastDate);
								pstmt.setString(4, wfirstDate);
								pstmt.setString(5, wlastDate);
								
							}
							
						}else { // 개인정보 검색이 전체이고, 활동상태가 전체가 아니고, 가입일이 전체가 아니고, 결혼예정일이 전체일 때 (4)
							
							if(memberEnrollDate.equals("검색")) {
								
								pstmt.setString(1, memberStatus);
								pstmt.setString(2, efirstDate);
								pstmt.setString(3, elastDate);
								
							}
							
						}
						
					}else { // 개인정보 검색이 전체이고, 활동상태가 전체가 아니고, 가입일이 전체일 때 (3)
						
						if(!memberWeddingDate.equals("전체")) { // 개인정보 검색이 전체이고, 활동상태가 전체가 아니고, 가입일이 전체이고, 결혼예정일이 전체가 아닐 때 (4)
							
							if(memberWeddingDate.equals("검색")) {
								
								pstmt.setString(1, memberStatus);
								pstmt.setString(2, wfirstDate);
								pstmt.setString(3, wlastDate);
								
							}
							
						}else { // 개인정보 검색이 전체이고, 활동상태가 전체가 아니고, 가입일이 전체이고, 결혼예정일이 전체일 때 (4)
															
							pstmt.setString(1, memberStatus);
															
						}

					}
					
				}else { // 개인정보 검색이 전체이고, 활동상태가 전체일 때 (2)
					
					if(!memberEnrollDate.equals("전체")) { // 개인정보 검색이 전체이고, 활동상태가 전체이고, 가입일이 전체가 아닐 때 (3)
						
						if(!memberWeddingDate.equals("전체")) { // 개인정보 검색이 전체이고, 활동상태가 전체이고, 가입일이 전체가 아니고, 결혼예정일이 전체가 아닐 때 (4)
							
							if(memberEnrollDate.equals("검색") && memberWeddingDate.equals("검색")) {
								
								pstmt.setString(1, efirstDate);
								pstmt.setString(2, elastDate);
								pstmt.setString(3, wfirstDate);
								pstmt.setString(4, wlastDate);
								
							}
							
						}else { // 개인정보 검색이 전체이고, 활동상태가 전체이고, 가입일이 전체가 아니고, 결혼예정일이 전체일 때 (4)
							
							if(memberEnrollDate.equals("검색")) {
								
								pstmt.setString(1, efirstDate);
								pstmt.setString(2, elastDate);
								
							}
							
						}
						
					}else { // 개인정보 검색이 전체이고, 활동상태가 전체이고, 가입일이 전체일 때 (3)
						
						if(!memberWeddingDate.equals("전체")) { // 개인정보 검색이 전체이고, 활동상태가 전체이고, 가입일이 전체이고, 결혼예정일이 전체가 아닐 때 (4)
							
							if(memberWeddingDate.equals("검색")) {
								
								pstmt.setString(1, wfirstDate);
								pstmt.setString(2, wlastDate);
								
							}
							
						}else { // 개인정보 검색이 전체이고, 활동상태가 전체이고, 가입일이 전체이고, 결혼예정일이 전체일 때 (4)
							
							
							
						}
						
					}
					
				}
				
			}				
			
			rset = pstmt.executeQuery();
			
			searchMemberList = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hlist = new HashMap<String,Object>();
				member = new Member();
				
				num = rset.getInt("RNUM")+ "";
				member.setMno(rset.getInt("MNO"));
				member.setMemberId(rset.getString("MID"));
				member.setMemberPwd(rset.getString("MPWD"));
				member.setMemberName(rset.getString("MNAME"));
				member.setNickName(rset.getString("NICK_NAME"));
				member.setPhone(rset.getString("PHONE"));
				member.setEmergenCon(rset.getString("EMERGEN_CON"));
				member.setEmail(rset.getString("EMAIL"));
				member.setEmailCheck(rset.getString("EMAIL_CHECK"));
				member.setGender(rset.getString("GENDER"));
				member.setEnrollDate(rset.getDate("ENROLL_DATE"));
				member.setModifyDate(rset.getDate("MODIFY_DATE"));
				member.setStatus(rset.getString("STATUS"));
				member.setMemberType(rset.getInt("MTYPE"));
				member.setWeddingDate(rset.getDate("WEDDING_DATE"));
								
				hlist.put("num", num);
				hlist.put("member", member);
				searchMemberList.add(hlist);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return searchMemberList;
	}

    
   //성별 통계
   	public ArrayList<HashMap<String, Object>> getGenderCount(Connection con, int value) {
		PreparedStatement pstmt = null; 
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//String query = prop.getProperty("statsDynamicQuery");
		String query = "";
		if(value == 10) {
			query = prop.getProperty("getGenderCount");
		}else if(value == 20){
			query = prop.getProperty("getDateCount");
		}else if(value == 30 || value == 40 || value == 50) {
			query = prop.getProperty("makeStatsQuery");
		}
		System.out.println("query : " + query);
		
		
		
		try {
			/*pstmt = con.prepareStatement(query);
			if(value == 10) {
				pstmt.setInt(1, 10);
				pstmt.setInt(2, 10);
			}else if(value == 20) {
				pstmt.setInt(1, 10);
			}

			rset = pstmt.executeQuery();*/
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				if(value == 50) {
					hmap.put("gNum", rset.getString("GNUM"));
					hmap.put("tNum", rset.getString("TNUM"));
				}else {
					hmap.put("gender", rset.getString("GENDER"));
					hmap.put("gNum", rset.getString("GNUM"));
					hmap.put("tNum", rset.getString("TNUM"));
				}
			
				
				list.add(hmap);
			};
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
	
		return list;
	}

	
	//맴버 정산 승인하기 버튼(정연)
	public int memberPay(int payno, Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("memberPay");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "승인");
			pstmt.setInt(2, payno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	//회원 환불 목록 조회용 메소드(정연)
	public ArrayList<HashMap<String, Object>> showMemberRefund(Connection con, TotalMemberPageInfo pi) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;

		String query = prop.getProperty("showRefund");
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			
			rset= pstmt.executeQuery();

			list = new ArrayList<HashMap<String,Object>>();

			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("rnum", rset.getInt("RNUM"));
				hmap.put("mname", rset.getString("MNAME"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("pselect", rset.getString("PSELECT"));
				hmap.put("pstatus", rset.getString("PSTATUS"));
				hmap.put("payno", rset.getInt("PAYNO"));
				hmap.put("mno", rset.getInt("MNO"));
				hmap.put("upno", rset.getInt("UPNO"));
				hmap.put("paydiv", rset.getString("PAYDIV"));
				hmap.put("cno", rset.getInt("CNO"));
				hmap.put("cname", rset.getString("CNAME"));
				hmap.put("pname", rset.getString("PNAME"));
				hmap.put("paycode", rset.getString("PAYCODE"));
				hmap.put("appdate", rset.getDate("APPDATE"));
				hmap.put("pcompdate", rset.getDate("PCOMPDATE"));
				hmap.put("cardcode", rset.getString("CARDCODE"));
				hmap.put("replaycode", rset.getInt("REPLAYCODE"));
				hmap.put("fprice", rset.getInt("FPRICE"));
				
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

	
	//환불목록 갯수 조회용 메소드(정연)
	public int getRefundCount(Connection con) {
		Statement stmt = null;
		int calcCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("allRefundCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				calcCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return calcCount;
	}

	
	//환불 승인 메소드(정연)
	public int memberRefund(int payno, Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("memberRefund");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "승인");
			pstmt.setInt(2, payno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
  }
		
	public ArrayList<HashMap<String, Object>> getCompanyStats(Connection con, String localName) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("getCompanyStats");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, localName);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("comType", rset.getString("COM_TYPE"));
				hmap.put("count",rset.getInt(2));
				
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> CompanyDetailStats(Connection con, int value) {
		
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		

		String query = prop.getProperty("CompanyDetailStats");
		System.out.println(query);
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				if(value == 10) {
					hmap.put("enrollDate", rset.getString("ENROLL_DATE"));
					hmap.put("tNum", rset.getString("TNUM"));
				}else {
					hmap.put("comType", rset.getString("COM_TYPE"));
					hmap.put("enrollDate", rset.getString("ENROLL_DATE"));
					hmap.put("tNum", rset.getString("TNUM"));
				}
			
				
				list.add(hmap);
			};
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}

	
	
	//업체 해당 월  정산 목록 조회용 메소드(정연)
	public ArrayList<HashMap<String, Object>> showComcalc(TotalMemberPageInfo pi, Connection con) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		String query = prop.getProperty("showComCalc");
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);


			rset= pstmt.executeQuery();

			list = new ArrayList<HashMap<String,Object>>();

			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("rnum", rset.getInt("RNUM"));
				hmap.put("cno", rset.getInt("CNO"));
				hmap.put("final", rset.getInt("FINAL"));
				hmap.put("cname", rset.getString("CNAME"));
				
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

	
	public ArrayList<HashMap<String, Object>> saleStats(Connection con, String selectValue) {
		
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("saleStatsQuery");
		System.out.println(query);
		
		list = new ArrayList<HashMap<String, Object>>();
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				if(selectValue.equals("일별")) {
					hmap.put("date", rset.getString(2));
					hmap.put("price", rset.getString(3));
				}else if(selectValue.equals("주별")){
					hmap.put("date", rset.getString("DAY_DATE"));
					hmap.put("price", rset.getString("FINAL_PRICE"));
				}else if(selectValue.equals("Top10")) {
					hmap.put("date", rset.getString("CNAME"));
					hmap.put("price", rset.getString("TOPM"));
				}
				list.add(hmap);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}
	
	////업체 정산 목록 갯수 리턴용 메소드 (정연)
	public int getComCalcCount(Connection con) {
		Statement stmt = null;
		int calcCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("allComCalcCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				calcCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return calcCount;
	}

	
	//업체 정산 확인 -> 테이블 삽입 메소드(정연)
	public int confirmComCalc(Connection con, int cno, int price) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("confirmComCalc");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, price);
			pstmt.setInt(2, cno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	//정산관리 테이블 중복 체크
	public int countEqualCalc(int cno, int price, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("countEqualCalc");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, price);
			pstmt.setInt(2, cno);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
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

	
	
	//업체 정산 상태 목록 조회용 메소드(정연) 
	public ArrayList<HashMap<String, Object>> comCalcStatus(Connection con) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> slist = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		String query = prop.getProperty("comCalcStatus");
		

		try {
			pstmt = con.prepareStatement(query);


			rset= pstmt.executeQuery();

			slist = new ArrayList<HashMap<String,Object>>();

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
				
				slist.add(hmap);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		

		return slist;
	}

	
	//정산테이블 전체 조회 (정연)
	public ArrayList<HashMap<String, Object>> allCalcList(Connection con) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> clist = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
	
		
		String query = prop.getProperty("allCalcList");
		
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			rset= pstmt.executeQuery();

			
			clist = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap =new HashMap<String, Object>();
				
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("cno", rset.getInt("CNO"));
				
				clist.add(hmap);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return clist;
  }
  
	public ArrayList<String> getCalculateDate(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<String> list = null;
		
		String query = prop.getProperty("getCalculateDate");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<String>();
			while(rset.next()) {
				list.add(rset.getString(1));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return list;
	}

	
	//승인 취소(계좌)
	public int memberRefuse(int payno, Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;
    
		String query = prop.getProperty("memberRefuse");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "승인취소");
			pstmt.setInt(2, payno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	//관리자 환불 요청 상태 변한 update(정연)
	public int adminRefundUpdate(int payno, Connection con) {
		PreparedStatement pstmt = null;
		int updateRe = 0;

		String query = prop.getProperty("adminRefundUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "결제환불");
			pstmt.setString(2, "승인대기");
			pstmt.setInt(3, payno);
			
			
			updateRe = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateRe;
		
	}
	
	
	
	//관리자 환불 요청 상태 변한 insert(정연)
	public int adminRefundInsert(int payno, int mno, int upno, String pselect, int fprice, String cardcode, Connection con) {
		PreparedStatement pstmt = null;
		int insertRe = 0;
		

		String query = prop.getProperty("adminRefundInsert");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			pstmt.setInt(2, upno);
			pstmt.setString(3, pselect);
			pstmt.setString(4, "승인대기");
			pstmt.setString(5, "환불");
			pstmt.setString(6, cardcode);
			pstmt.setInt(7, payno);
			pstmt.setInt(8, fprice);
			
			insertRe = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return insertRe;
		
	}
	
}


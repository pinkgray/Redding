package com.kh.redding.member.model.dao;

import static com.kh.redding.common.JDBCTemplate.close;
import static com.kh.redding.common.JDBCTemplate.getConnection;

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
import java.util.Map;
import java.util.Properties;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.board.model.dao.BoardDao;
import com.kh.redding.board.model.vo.Board;
import com.kh.redding.board.model.vo.BoardPageInfo;
import com.kh.redding.board.model.vo.Reply;
import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.vo.M_ComQnaListPageInfo;
import com.kh.redding.member.model.vo.M_comListPageInfo;
import com.kh.redding.member.model.vo.Member;
import com.kh.redding.product.model.vo.Product;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	// member 로그인 확인용 메소드
	public Member loginCheck(Connection con, String memberId, String memberPwd) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member();
				loginUser.setMno(rset.getInt("MNO"));
				loginUser.setMemberId(rset.getString("MID"));
				loginUser.setMemberPwd(rset.getString("MPWD"));
				loginUser.setMemberName(rset.getString("MNAME"));
				loginUser.setNickName(rset.getString("NICK_NAME"));
				loginUser.setPhone(rset.getString("PHONE"));
				loginUser.setEmergenCon(rset.getString("EMERGEN_CON"));
				loginUser.setEmail(rset.getString("EMAIL"));
				loginUser.setEmailCheck(rset.getString("EMAIL_CHECK"));
				loginUser.setGender(rset.getString("GENDER"));
				loginUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
				loginUser.setModifyDate(rset.getDate("MODIFY_DATE"));
				loginUser.setStatus(rset.getString("STATUS"));
				loginUser.setMemberType(rset.getInt("MTYPE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("loginUser5(dao) : " + loginUser);
		return loginUser;
	}

	// member 회원가입용 메소드
	public int insertMember(Connection con, Member insertMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, insertMember.getMemberId());
			pstmt.setString(2, insertMember.getMemberPwd());
			pstmt.setString(3, insertMember.getMemberName());
			pstmt.setString(4, insertMember.getNickName());
			pstmt.setString(5, insertMember.getEmail());
			
			String email_check;
			if (insertMember.getEmailCheck().equals("인증안됨")) {
				email_check = "N";
			}else {
				email_check = "Y";
			}
			
			pstmt.setString(6, email_check);
			pstmt.setString(7, insertMember.getPhone());
			pstmt.setString(8, insertMember.getEmergenCon());
			pstmt.setString(9, insertMember.getGender());
			pstmt.setInt(10, 10);
			pstmt.setDate(11, insertMember.getWeddingDate());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 닉네임 체크 메소드
	public int nickChecked(Connection con, String nickName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("nickChecked");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, nickName);
			
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

	// member 개인정보 수정 메소드
	public int updateMember(Connection con, Member reqMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getMemberPwd());
			pstmt.setString(2, reqMember.getNickName());
			pstmt.setString(3, reqMember.getPhone());
			pstmt.setString(4, reqMember.getEmergenCon());
			pstmt.setString(5, reqMember.getEmail());
			pstmt.setString(6, reqMember.getGender());
			pstmt.setString(7, reqMember.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//업체목록페이지수(광섭)
	public int getListCount(Connection con, String comType) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listComCount");
		
		System.out.println("comType:" + comType);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, comType);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return listCount;
	}

	//업체목록(광섭)
	public ArrayList<HashMap<String, Object>> selectComList(Connection con, M_comListPageInfo clpi, String comType) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectComList");
		
		int startRow = (clpi.getCurrentPage() - 1) * clpi.getLimit() + 1;
		int endRow = startRow + clpi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, comType);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("mno", rset.getInt("MNO"));
				hmap.put("filepath", rset.getString("FILE_PATH"));
				hmap.put("cno_div", rset.getString("CNO_DIV"));
				hmap.put("changename", rset.getString("CHANGE_NAME"));
				hmap.put("membername", rset.getString("MNAME"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("ComLike", rset.getInt("COM_LIKE"));
				hmap.put("comType", comType);
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		System.out.println("리ㅣ" + list);
		return list;
	}

	public HashMap<String, Object> selectCount(Connection con, int mno) {
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectCount");
		HashMap<String, Object> hmap = null;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			pstmt.setInt(2, mno);
			pstmt.setInt(3, mno);
			pstmt.setString(4, "결제");
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<String, Object>();
			while(rset.next()) {
				hmap.put("resWait", rset.getInt("RESWAIT"));
				hmap.put("payWait", rset.getInt("PAYWAIT"));
				hmap.put("payFinal", rset.getInt("FINAL"));				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return hmap;
	}
	
	public ArrayList<HashMap<String, Object>> resWaitSelect(Connection con,int value, int mno) {
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		String query = prop.getProperty("dynamicQuery");
		
					
		try {
			

			if(value == 30 || value == 60 || value == 70){
				pstmt = con.prepareStatement(query);
				if(value == 70) {
					pstmt.setString(1, "환불");
				}else {
					pstmt.setString(1, "결제");
				}
				
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<HashMap<String, Object>>();
				
				while(rset.next()) {
					HashMap<String, Object> hmap = new HashMap<String, Object>();
					
					hmap.put("payNo", rset.getInt("PAYNO"));
					hmap.put("upno", rset.getInt("UPNO"));
					hmap.put("rnum", rset.getInt("RNUM"));
					hmap.put("pName", rset.getString("PNAME"));
					hmap.put("cName", rset.getString("CNAME"));
					hmap.put("rapply", rset.getString("RAPPLY"));
					hmap.put("price", rset.getInt("FINAL_PRICE"));
					hmap.put("payDiv", rset.getString("PAYDIV"));
					hmap.put("approval", rset.getString("APPROVAL"));
					hmap.put("useDate", rset.getString("USE_DATE"));
					hmap.put("useStart", rset.getString("USE_START_TIME"));
					hmap.put("useEnd", rset.getString("USE_END_TIME"));
					
					list.add(hmap);

				}
				
			}else if(value ==10 || value == 20 || value == 40 || value == 50) {   
				stmt = con.createStatement();
				System.out.println("query" + query);
				rset = stmt.executeQuery(query);
				
				list = new ArrayList<HashMap<String, Object>>();
				
				while(rset.next()) {
					
					if(value ==10 || value == 20 ||value == 40 || value == 50) {
						
						HashMap<String, Object> hmap = new HashMap<String, Object>();
						
						hmap.put("resNo", rset.getInt("RESNO"));
						hmap.put("upno", rset.getInt("UPNO"));
						hmap.put("rnum", rset.getInt("RNUM"));
						hmap.put("pName", rset.getString("PNAME"));
						hmap.put("cName", rset.getString("CNAME"));
						hmap.put("rapply", rset.getString("RAPPLY_DATE"));
						hmap.put("price", rset.getInt("PRICE"));
						hmap.put("status", rset.getString("RSTATUS"));
						hmap.put("subno", rset.getInt("SUBNO"));
						hmap.put("useDate", rset.getString("USE_DATE"));
						hmap.put("useStart", rset.getString("USE_START_TIME"));
						hmap.put("useEnd", rset.getString("USE_END_TIME"));
						list.add(hmap);
					}
									
				}
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

	//조회할 타입의 COUNT 리턴
	public int getCountList(Connection con, int value) {
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String query = prop.getProperty("countDynamicQuery");
		try {
			if(value == 60) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "결제");
				
				rset = pstmt.executeQuery();
				
				
				
			}else {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			}
			
			if(rset.next()) {
				count = rset.getInt(1);				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return count;
	}
	
	//업체조회(광섭)
	public Company selectDetailCom(Connection con, int cno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Company c = null;
		
		String query = prop.getProperty("selectCompany");
		
		try {
			c = new Company();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				c.setCNO(rset.getInt("CNO"));
				c.setCom_Rep_Num(rset.getInt("COM_REP_NUM"));
				c.setRepName(rset.getString("REP_NAME"));
				c.setComAddress(rset.getString("COM_ADDRESS"));
				c.setComUrl(rset.getString("COM_URL"));
				c.setOpenTime(rset.getString("OPEN_TIMES"));
				c.setEndTime(rset.getString("CLOSE_TIMES"));
				c.setAccountCode(rset.getInt("ACCOUNT_CODE"));
				c.setAccountNum(rset.getString("ACCOUNT_NUM"));
				c.setAccountName(rset.getString("ACCOUNT_NAME"));
				c.setComType(rset.getString("COM_TYPE"));
				c.setComLike(rset.getInt("COM_LIKE"));
				c.setHoliday(rset.getString("HOLIDAY"));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return c;
	}

	//어테치먼트 조회(광섭)
	public ArrayList<Attachment> selectDetailAt(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> attachlist = null;
		
		String query = prop.getProperty("selectAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			attachlist = new ArrayList<Attachment>();
			while(rset.next()) {
				Attachment at = new Attachment();
				
				at.setAid(rset.getInt("AID"));
				at.setOriginname(rset.getString("ORIGIN_NAME"));
				at.setChangename(rset.getString("CHANGE_NAME"));
				at.setFilepath(rset.getString("FILE_PATH"));
				at.setAdivision(rset.getInt("ADIVISION"));
				at.setBid(rset.getInt("BID"));
				at.setCouponCode(rset.getInt("COUPON_CODE"));
				at.setCno_div(rset.getString("CNO_DIV"));
				
				attachlist.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return attachlist;
	}

	//프로덕트조회(광섭)
	public ArrayList<Product> selectDetailPd(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> prolist = null;
		
		String query = prop.getProperty("selectProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			prolist = new ArrayList<Product>();
			
			while(rset.next()) {
				Product pd = new Product();
				
				pd.setpNo(rset.getInt("PNO"));
				pd.setpName(rset.getString("PNAME"));
				pd.setpContent(rset.getString("PCONTENT"));
				pd.setPrice(rset.getInt("PRICE"));
				pd.setpEnrollDate(rset.getDate("PENROLL_DATE"));
				pd.setcNo(rset.getInt("CNO"));
				pd.setpModifyDate(rset.getDate("PMODIFY_DATE"));
				pd.setProStatus(rset.getString("PRO_STATUS"));
				
				prolist.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return prolist;
	}

	//멤버 조회(광섭)
	public Member selectDetailMem(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String query = prop.getProperty("selectMember");
		
		try {
			m = new Member();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m.setMemberId(rset.getString("MID"));
				m.setMemberPwd(rset.getString("MPWD"));
				m.setMemberName(rset.getString("MNAME"));
				m.setNickName(rset.getString("NICK_NAME"));
				m.setEmail(rset.getString("EMAIL"));
				m.setEmailCheck(rset.getString("EMAIL_CHECK"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmergenCon(rset.getString("EMERGEN_CON"));
				m.setGender(rset.getString("GENDER"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setStatus(rset.getString("STATUS"));
				m.setMemberType(rset.getInt("MTYPE"));
				m.setModifyDate(rset.getDate("MODIFY_DATE"));
				m.setMnotiType(rset.getInt("MNOTI_TYPE"));
				m.setOutDate(rset.getDate("OUT_DATE"));
				m.setWeddingDate(rset.getDate("WEDDING_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
		
	}

  
  //욱 get package
	public ArrayList<HashMap<String, Object>> getPackage(Connection con, int subno, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("getPackage");
		
		System.out.println("query :::" + query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, subno);
			pstmt.setInt(2, mno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				
				hmap = new HashMap<String, Object>();
				hmap.put("upno", rset.getInt("UPNO"));
				hmap.put("status", rset.getString("RSTATUS"));
				hmap.put("rapply", rset.getString("RAPPLY_DATE"));
				hmap.put("pName", rset.getString("PNAME"));
				hmap.put("cName", rset.getString("MNAME"));
				hmap.put("price", rset.getString("PRICE"));
				list.add(hmap);
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

	public ArrayList<HashMap<String, Object>> getPayment(Connection con, int mno, int[] upnoArr) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<HashMap<String,Object>> list = null;
      HashMap<String, Object> hmap = null;
      String query = prop.getProperty("getPayment");
      
      for(int i=0; i<upnoArr.length; i++) {
         if(i != upnoArr.length - 1) {
            query += "?,";
         }else {
            query += "?)";
         }
      }
      System.out.println("query : " + query);
      
      try {
         pstmt = con.prepareStatement(query);
         pstmt.setInt(1, mno);
         for(int i=0; i<upnoArr.length; i++) {
            pstmt.setInt(i+2, upnoArr[i]);
         }
         rset = pstmt.executeQuery();
         
         list = new ArrayList<HashMap<String,Object>>();
         
         while(rset.next()) {
            hmap = new HashMap<String, Object>();
            
            hmap.put("upno", rset.getInt("UPNO"));
            hmap.put("useDate", rset.getString("USE_DATE"));
            hmap.put("useStart", rset.getString("USE_START_TIME"));
            hmap.put("useEnd", rset.getString("USE_END_TIME"));
            hmap.put("pName", rset.getString("PNAME"));
            hmap.put("cName", rset.getString("MNAME"));
            hmap.put("cPhone", rset.getString("PHONE"));
            hmap.put("price", rset.getString("PRICE"));
            hmap.put("changeName", rset.getString("CHANGE_NAME"));
            hmap.put("filePath", rset.getString("FILE_PATH"));
            hmap.put("comType", rset.getString("COM_TYPE"));
            
            list.add(hmap);
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
      
      return list;
   }   

  
  //지원
	//아이디 , 이메일 있는 지 확인
	// memberid -> memberName
	public int memberIdSearch(Connection con,String memberid, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("memberIdSearch");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, memberid);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

  
  //광섭
	public ArrayList<HashMap<String, Object>> selectDetailComQna(Connection con, M_ComQnaListPageInfo cqlpi, int cno) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> blist = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectBoard");
		
		int startRow = (cqlpi.getCurrentPage() - 1) * cqlpi.getLimit() + 1;
		int endRow = startRow + cqlpi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			blist = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				HashMap<String, Object> Rhmap = new HashMap<String, Object>();
				
				hmap = new HashMap<String, Object>();

				hmap.put("rownum", rset.getInt("RNUM"));
				hmap.put("bid", rset.getInt("BID"));
				hmap.put("btitle", rset.getString("BTITLE"));
				hmap.put("bcontent", rset.getString("BCONTENT"));
				hmap.put("mname", rset.getString("MNAME"));
				hmap.put("bdate", rset.getDate("BDATE"));
				hmap.put("ref_cnum", rset.getInt("REF_CNUM"));
				hmap.put("cno", rset.getInt("CNO"));
				
				Rhmap.put("blist", hmap);
				
				Reply reply = new Reply();
				
				reply.setReply_code(rset.getInt("REPLY_CODE"));
				reply.setReply_date(rset.getDate("REPLY_DATE"));
				reply.setReply_content(rset.getString("REPLY_CONTENT"));
				reply.setMno(rset.getInt("MNO"));
				reply.setBid(rset.getInt("RB"));

				Rhmap.put("reply", reply);
				
				
				blist.add(Rhmap);
			}
			System.out.println("blistDao : " + blist);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return blist;
		
	
	}

	
	public String selectMemberId(Connection con, String memberName, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String memberId = null;
		
		String query = prop.getProperty("selectMemberId");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, memberName);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				memberId = rset.getString("MID");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}	
		return memberId;
	}

  
	//비밀번호 찾기 - 아이디 , 이메일 , 이름 있는 지 조회
	public int MemberPasswordSelect(Connection con, String memberid, String membername, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		int result = 0;
		
		String query = prop.getProperty("PasswordSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, memberid);
			pstmt.setString(2, membername);
			pstmt.setString(3, email);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

  
  
	public int updateMemberPassword(Connection con, String membrid, String memberPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("UpdatePassword");
		
		try {
			//System.out.println("update :" + query);
			
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, memberPwd);
			pstmt.setString(2, membrid);
		
			//System.out.println("memberPwd :" + memberPwd + "memberId :" + membrid);
			
			result = pstmt.executeUpdate();
			
			//System.out.println("dao :" + result);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int memberDelete(Connection con,String memberid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("memberDelete");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, memberid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int getQnaListCount(Connection con, int cno) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listQnaCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return listCount;
	}

	public Board selectComQnaDetail(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectComQnaDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				
				b.setBid(bid);
				b.setBtitle(rset.getString("BTITLE"));
				b.setMemberName(rset.getString("MNAME"));
				b.setBdate(rset.getDate("BDATE"));
				b.setBmodify_date(rset.getDate("BMODIFY_DATE"));
				b.setBcontent(rset.getString("BCONTENT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return b;
	}

	public int deleteQna(Connection con, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteQna");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> SelectComQnaDetail(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> ComQnaDetail = null;
		
		String query = prop.getProperty("selectComQnaDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bid);
			
			rset = pstmt.executeQuery();
			
			ComQnaDetail = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				
				Board comQnA = new Board();
				
				comQnA.setBid(rset.getInt("BID"));
				comQnA.setBtitle(rset.getString("BTITLE"));
				comQnA.setBwriter(rset.getInt("BWRITER"));
				comQnA.setBdate(rset.getDate("BDATE"));
				comQnA.setBcontent(rset.getString("BCONTENT"));
				comQnA.setBdivision(rset.getString("BDIVISION"));
				comQnA.setBcategory(rset.getString("BCATEGORY"));
				comQnA.setBmodify_date(rset.getDate("BMODIFY_DATE"));
			
				hmap.put("comQnA", comQnA);
				
				String mname = rset.getString("MNAME");
				
				hmap.put("mname", mname);
				
				Reply comReply = new Reply();
				
				comReply.setReply_code(rset.getInt("reply_code"));
				comReply.setReply_date(rset.getDate("reply_date"));
				comReply.setReply_content(rset.getString("reply_content"));
				comReply.setMno(rset.getInt("MNO"));
				
				hmap.put("reply", comReply);
				
				ComQnaDetail.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return ComQnaDetail;
	}

	public ArrayList<HashMap<String, Object>> getCouponList(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
			
		String query = prop.getProperty("getCouponList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("cCode", rset.getInt("CHISTORY_CODE"));
				hmap.put("cName", rset.getString("COUPON_NAME"));
				hmap.put("cCategory", rset.getString("COUPON_CATEGORY"));
				hmap.put("cDiscount", rset.getString("DISCOUNT_TYPE"));
				hmap.put("cAmount", rset.getInt("DISCOUNT_AMOUNT"));
				hmap.put("cRate", rset.getInt("DISCOUNT_RATE"));
				hmap.put("cStart", rset.getString("COUPON_STARTDATE"));
				hmap.put("cEnd", rset.getString("COUPON_ENDDATE"));
					
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

	public ArrayList<HashMap<String, Object>> selectComReviewList(Connection con, M_ComQnaListPageInfo cqlpi, int cno) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> rlist = null;
		HashMap<String, Object> shmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectComReviewList");
		
		int startRow = (cqlpi.getCurrentPage() - 1) * cqlpi.getLimit() + 1;
		int endRow = startRow + cqlpi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			rlist = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				shmap = new HashMap<String, Object>();
				
				shmap.put("rnum", rset.getInt("RNUM"));
				shmap.put("bid", rset.getInt("BID"));
				shmap.put("btitle", rset.getString("BTITLE"));
				shmap.put("nickname", rset.getString("NICK_NAME"));
				shmap.put("bdate", rset.getDate("BDATE"));
				shmap.put("bcount", rset.getInt("BCOUNT"));
				shmap.put("blike", rset.getInt("BLIKE"));
				shmap.put("cno", rset.getInt("cno"));
				
				rlist.add(shmap);
				System.out.println("rlistDao : " + rlist);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return rlist;
}
  
  
	public int memberInsertPay(Connection con,int mno, String[] upnoArr, String[] moneyArr, String rspUid, String rspApply) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("memberInsertPay");
		
		try {
			for(int i=0; i<upnoArr.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, rspUid);
				pstmt.setInt(2, mno);
				pstmt.setInt(3, Integer.parseInt(upnoArr[i]));
				pstmt.setString(4,rspApply);
				pstmt.setInt(5, Integer.parseInt(moneyArr[i]));
				
				result += pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return result;
	}

  
	public int resUpdatePay(Connection con,int mno, String[] upnoArr) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("resUpdatePay");
		
		try {
			for(int i=0; i<upnoArr.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1,mno);
				pstmt.setInt(2, Integer.parseInt(upnoArr[i]));
				
				result += pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return result;
	}

	public int couUpdatePay(Connection con,int mno, int couponCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("couUpdatePay");
		
		try {			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			pstmt.setInt(2, couponCode);
				
			result = pstmt.executeUpdate();						
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return result;
	}	
	
}


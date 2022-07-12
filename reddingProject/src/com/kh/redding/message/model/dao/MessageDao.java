package com.kh.redding.message.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.redding.member.model.vo.Member;
import com.kh.redding.message.model.vo.Message;
import com.kh.redding.product.model.vo.PageInfo;
import com.sun.corba.se.spi.orbutil.fsm.State;

import static com.kh.redding.common.JDBCTemplate.*;

public class MessageDao {
   private Properties prop = new Properties();
   
   public MessageDao() {
      String fileName = MessageDao.class.getResource("/sql/message/message-query.properties").getPath();
      
      try {
         prop.load(new FileReader(fileName));
      } catch (IOException e) {
         e.printStackTrace();
      }
   }
   //쪽지 보내기를 위한 업체 번호 받아오기
   public Member selectCompanyOne(Connection con, int cno) {
      PreparedStatement pstmt = null;
       ResultSet rset = null;
       Member company = null;
       
       String query = prop.getProperty("selectCompanyOne");
       
       try {
          pstmt = con.prepareStatement(query);
          
          pstmt.setInt(1, cno);
          
          rset = pstmt.executeQuery();
          
          company = new Member();
          
          if(rset.next()) {
             
             company.setMno(rset.getInt("MNO"));
             company.setMemberId(rset.getString("MID"));
             company.setMemberPwd(rset.getString("MPWD"));
             company.setMemberName(rset.getString("MNAME"));
             company.setNickName(rset.getString("NICK_NAME"));
             company.setPhone(rset.getString("PHONE"));
             company.setEmergenCon(rset.getString("EMERGEN_CON"));
             company.setEmail(rset.getString("EMAIL"));
             company.setEmailCheck(rset.getString("EMAIL_CHECK"));
             company.setGender(rset.getString("GENDER"));
             company.setEnrollDate(rset.getDate("ENROLL_DATE"));
             company.setModifyDate(rset.getDate("MODIFY_DATE"));
             company.setStatus(rset.getString("STATUS"));
             company.setMemberType(rset.getInt("MTYPE"));
             company.setOutDate(rset.getDate("OUT_DATE"));
             company.setWeddingDate(rset.getDate("WEDDING_DATE"));
             company.setMnotiType(rset.getInt("MNOTI_TYPE"));
          }
          
       } catch (SQLException e) {
          e.printStackTrace();
       } finally {
    	   close(pstmt);
    	   close(rset);
       }
       
       
       return company;
   }
   //새로 쪽지 보내기 (insert)
   public int insertMesToCompany(Connection con, Message mes) {
      PreparedStatement pstmt = null;
      int result = 0;
      String query = prop.getProperty("insertMesToCompany");
      
      try {
         pstmt = con.prepareStatement(query);
         
         pstmt.setString(1, mes.getMesContent());
         pstmt.setDate(2, mes.getMesDisDate());
         pstmt.setInt(3, mes.getMesWType());
         pstmt.setInt(4, mes.getCno());
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
    	  close(pstmt);
      }
            
      return result;
   }
   //보낸 쪽지 전체 조회 서블릿
   public ArrayList<Message> selectListMes(Connection con, int wtype, PageInfo pi) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<Message> mesList = null;
      Message mes = null;
      
      String query = prop.getProperty("selectListMes");
      
      //System.out.println("con : " + con);
      //System.out.println("wtype : " + wtype);
      //System.out.println("query : " + query);
      
      try {
         pstmt = con.prepareStatement(query);
         
         pstmt.setInt(1, wtype);
         pstmt.setInt(2, pi.getStartRow());
         pstmt.setInt(3, pi.getEndRow());
         
         rset = pstmt.executeQuery();
         
         //System.out.println("rset : " + rset);
         
         mesList = new ArrayList<Message>();
         
         while(rset.next()) {
            mes = new Message();
            
            mes.setMessageCode(rset.getInt("MESSAGE_CODE"));
            //System.out.println("rset.getInt(MESSAGE_CODE) : " + rset.getInt("MESSAGE_CODE"));
            mes.setMesContent(rset.getString("MESSAGE_CONTENT"));
            //System.out.println("rset.getString(MESSAGE_CONTENT) : " +rset.getString("MESSAGE_CONTENT"));
            mes.setMesDisDate(rset.getDate("MESSAGE_DISDATE"));
            //System.out.println("rset.getDate(MESSAGE_DISDATE) : " + rset.getDate("MESSAGE_DISDATE"));
            mes.setMesCkDate(rset.getDate("MESSAGE_CKDATE"));
            //System.out.println("rset.getDate(MESSAGE_CKDATE) : " + rset.getDate("MESSAGE_CKDATE"));
            mes.setMesLevel(rset.getInt("MESSAGE_LEVEL"));
            //System.out.println("rset.getInt(MESSAGE_LEVEL) : " + rset.getInt("MESSAGE_LEVEL"));
            mes.setMesWType(rset.getInt("MESSAGE_WTYPE"));
            //System.out.println("rset.getint : " +rset.getInt("MESSAGE_WTYPE"));
            mes.setMesRefCode(rset.getInt("MESSAGE_REFCODE"));
            //System.out.println("rset.getIntMESSAGE_REFCODE) : " + rset.getInt("MESSAGE_REFCODE"));
            mes.setCno(rset.getInt("CNO"));
            //System.out.println("rset.getInt(CNO) : " + rset.getInt("CNO"));
            mes.setMname(rset.getString("MNAME"));
            
            //System.out.println("mes : " + mes);
            
            
            mesList.add(mes);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
   	   close(pstmt);
   	   close(rset);
      }
      //System.out.println("mesList Dao : " + mesList);
      return mesList;
   }
   //listCount 확인용 메소드
   public HashMap<String, Object> selectListCount(Connection con, int wt) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      HashMap<String, Object> hmap = null;
      
      String query = prop.getProperty("selectListCount");
      
      try {
    	  pstmt = con.prepareStatement(query);
    	  
    	  pstmt.setInt(1, wt);
    	  pstmt.setInt(2, wt);
    	  pstmt.setInt(3, wt);
    	  
    	  rset = pstmt.executeQuery();
         
         while(rset.next()) {
            hmap = new HashMap<String, Object>();
            hmap.put("CK_COUNT", rset.getInt("CK_COUNT"));
            //System.out.println("rset.getInt(\"CK_COUNT\") : " + rset.getInt("CK_COUNT"));
            hmap.put("NOCK_COUNT", rset.getInt("NOCK_COUNT"));
            //System.out.println("rset.getInt(\"NOCK_COUNT\") : " + rset.getInt("NOCK_COUNT"));
            hmap.put("TOTAL_COUNT", rset.getInt("TOTAL_COUNT"));
            //System.out.println("rset.getInt(TOTAL_COUNT) : " + rset.getInt("TOTAL_COUNT"));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
   	   close(pstmt);
   	   close(rset);
      }
      
      return hmap;
   }
   //업체 전체 이름 조회를 위한 메소드
   public ArrayList<Member> selectCompany(Connection con) {
      Statement stmt = null;
      ResultSet rset = null;
      ArrayList<Member> cnames = null;
      Member comp = null;
      
      String query = prop.getProperty("selectCompany");
      
      try {
         stmt = con.createStatement();
         
         rset = stmt.executeQuery(query);
         
         cnames = new ArrayList<Member>();
         
         while(rset.next()) {
            comp = new Member();
            
            comp.setMno(rset.getInt("MNO"));
            comp.setMemberId(rset.getString("MID"));
            comp.setMemberPwd(rset.getString("MPWD"));
            comp.setMemberName(rset.getString("MNAME"));
            comp.setPhone(rset.getString("PHONE"));
            comp.setEmail(rset.getString("EMAIL"));
            comp.setEmailCheck(rset.getString("EMAIL_CHECK"));
            comp.setEnrollDate(rset.getDate("ENROLL_DATE"));
            comp.setModifyDate(rset.getDate("MODIFY_DATE"));
            comp.setStatus(rset.getString("STATUS"));
            comp.setOutDate(rset.getDate("OUT_DATE"));
            comp.setMnotiType(rset.getInt("MNOTI_TYPE"));
            
            cnames.add(comp);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
   	   close(stmt);
   	   close(rset);
      }
      //System.out.println("cnames : " + cnames);
      
      return cnames;
   }
   //업체가 보낸 쪽지 정보 확인용 메소드
	public Message selectMesOne(Connection con, int code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Message mes = null;
		   
		String query = prop.getProperty("selectMesOne");
		   
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, code);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mes = new Message();
	            
	            mes.setMessageCode(rset.getInt("MESSAGE_CODE"));
	            mes.setMesContent(rset.getString("MESSAGE_CONTENT"));
	            mes.setMesDisDate(rset.getDate("MESSAGE_DISDATE"));
	            mes.setMesCkDate(rset.getDate("MESSAGE_CKDATE"));
	            mes.setMesLevel(rset.getInt("MESSAGE_LEVEL"));
	            mes.setMesWType(rset.getInt("MESSAGE_WTYPE"));
	            mes.setCno(rset.getInt("CNO"));
	            mes.setMname(rset.getString("MNAME"));
	            mes.setMesStatus(rset.getString("MESSAGE_STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	    	   close(pstmt);
	    	   close(rset);
	       }
		//System.out.println("mesdao :" +mes);
		return mes;
	}
	//확인날짜 업데이트용 메소드
	public int updateMesCDate(Connection con, Date ckDate, int code) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMesCDate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setDate(1, ckDate);
			pstmt.setInt(2, code);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	    	   close(pstmt);
	       }
				
		return result;
	}
	//답장보내기용 메소드
	public int insertReplyMesToCompany(Connection con, Message mes) {
		PreparedStatement pstmt = null;
		int result = 0;
				
		String query = prop.getProperty("insertReplyMesToCompany");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, mes.getMesContent());
			pstmt.setDate(2, mes.getMesDisDate());
			pstmt.setInt(3, mes.getMesLevel());
			pstmt.setInt(4, mes.getMesWType());
			pstmt.setInt(5, mes.getMesRefCode());
			pstmt.setInt(6, mes.getCno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	    	   close(pstmt);
	       }
		
		return result;
	}
	//업체의 listCount 조회용 메소드
	public HashMap<String, Object> getListCountCompMes(Connection con, int cno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("getListCountCompMes");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, cno);
			pstmt.setInt(2, cno);
			pstmt.setInt(3, cno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("CK_COUNT", rset.getInt("CK_COUNT"));
				hmap.put("NOCK_COUNT", rset.getInt("NOCK_COUNT"));
				hmap.put("TOTAL_COUNT", rset.getInt("TOTAL_COUNT"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	    	   close(pstmt);
	    	   close(rset);
	       }
		//System.out.println("hmap : " + hmap);
		return hmap;
	}
	//한 업체의 모든 쪽지 정보 메소드
	public ArrayList<Message> selectListCompMes(Connection con, PageInfo pi, int cno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Message> compMesList = null;
		Message mes = null;
		
		String query = prop.getProperty("selectListCompMes");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, cno);
			pstmt.setInt(2, pi.getStartRow());
			pstmt.setInt(3, pi.getEndRow());
			
			rset = pstmt.executeQuery();
			
			compMesList = new ArrayList<Message>();
			
			while(rset.next()) {
				mes = new Message();
				
				mes.setMname(rset.getString("MNAME"));
				mes.setMessageCode(rset.getInt("MESSAGE_CODE"));
				mes.setMesContent(rset.getString("MESSAGE_CONTENT"));
				mes.setMesDisDate(rset.getDate("MESSAGE_DISDATE"));
				mes.setMesCkDate(rset.getDate("MESSAGE_CKDATE"));
				mes.setMesLevel(rset.getInt("MESSAGE_LEVEL"));
				mes.setMesWType(rset.getInt("MESSAGE_WTYPE"));
				mes.setMesRefCode(rset.getInt("MESSAGE_REFCODE"));
				mes.setCno(rset.getInt("CNO"));
				mes.setMesStatus(rset.getString("MESSAGE_STATUS"));
				
				compMesList.add(mes);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	    	   close(pstmt);
	    	   close(rset);
	       }
		//System.out.println("compMesList : " + compMesList);
		
		return compMesList;
	}
	
	//wtype=20 , cno 일치하는 listCount 조회
	public HashMap<String, Object> getListCountCompMesWtype(Connection con, int cno, int wt) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("getListCountCompMesWtype");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, wt);
			pstmt.setInt(2, cno);
			pstmt.setInt(3, wt);
			pstmt.setInt(4, cno);
			pstmt.setInt(5, wt);
			pstmt.setInt(6, cno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("CK_COUNT", rset.getInt("CK_COUNT"));
				hmap.put("NOCK_COUNT", rset.getInt("NOCK_COUNT"));
				hmap.put("TOTAL_COUNT", rset.getInt("TOTAL_COUNT"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	    	   close(pstmt);
	    	   close(rset);
	       }
		//System.out.println("hmap : " + hmap);
		return hmap;
	}
	//wtype=20, cno 일치하는 messsage들 조회
	public ArrayList<Message> selectListCompReceiveMes(Connection con, int cno, int wt, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Message> compMesList = null;
		Message mes = null;
		
		String query = prop.getProperty("selectListCompReceiveMes");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, cno);
			pstmt.setInt(2, wt);
			pstmt.setInt(3, pi.getStartRow());
			pstmt.setInt(4, pi.getEndRow());
			
			rset = pstmt.executeQuery();
			
			compMesList = new ArrayList<Message>();
			
			while(rset.next()) {
				mes = new Message();
				
				mes.setMname(rset.getString("MNAME"));
				mes.setMessageCode(rset.getInt("MESSAGE_CODE"));
				mes.setMesContent(rset.getString("MESSAGE_CONTENT"));
				mes.setMesDisDate(rset.getDate("MESSAGE_DISDATE"));
				mes.setMesCkDate(rset.getDate("MESSAGE_CKDATE"));
				mes.setMesLevel(rset.getInt("MESSAGE_LEVEL"));
				mes.setMesWType(rset.getInt("MESSAGE_WTYPE"));
				mes.setMesRefCode(rset.getInt("MESSAGE_REFCODE"));
				mes.setCno(rset.getInt("CNO"));
				mes.setMesStatus(rset.getString("MESSAGE_STATUS"));
				
				compMesList.add(mes);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	    	   close(pstmt);
	    	   close(rset);
	       }
		//System.out.println("compMesList : " + compMesList);
		
		return compMesList;
	}
	//업체의 전체 쪽지 목록페이지에서 체크된것들 삭제
	public int deleteCompMes(Connection con, int code) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteCompMes");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, code);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	    	   close(pstmt);
	       }
		return result;
	}
	//업체명 검색후 전체 갯수 조회
	public int getListCountSearchMes(Connection con, String cname, int wt) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("getListCountSearchMes");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, wt);
			pstmt.setString(2, cname);
			
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
	//업체명 검색 후 전체리스트 리턴
	public ArrayList<Message> searchMesList(Connection con, String cname, int wt, PageInfo pi) {	
		  PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      ArrayList<Message> searchList = null;
	      Message mes = null;
	      
	      String query = prop.getProperty("searchMesList");
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         
	         pstmt.setInt(1, wt);
	         pstmt.setString(2, cname);
	         pstmt.setInt(3, pi.getStartRow());
	         pstmt.setInt(4, pi.getEndRow());
	         
	         rset = pstmt.executeQuery();
	         
	         
	         searchList = new ArrayList<Message>();
	         
	         while(rset.next()) {
	            mes = new Message();
	            
	            mes.setMessageCode(rset.getInt("MESSAGE_CODE"));
	            mes.setMesContent(rset.getString("MESSAGE_CONTENT"));
	            mes.setMesDisDate(rset.getDate("MESSAGE_DISDATE"));
	            mes.setMesCkDate(rset.getDate("MESSAGE_CKDATE"));
	            mes.setMesLevel(rset.getInt("MESSAGE_LEVEL"));
	            mes.setMesWType(rset.getInt("MESSAGE_WTYPE"));
	            mes.setMesRefCode(rset.getInt("MESSAGE_REFCODE"));
	            mes.setCno(rset.getInt("CNO"));
	            mes.setMname(rset.getString("MNAME"));
				mes.setMesStatus(rset.getString("MESSAGE_STATUS"));
	            
	            
				searchList.add(mes);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	    	   close(pstmt);
	    	   close(rset);
	       }
	      return searchList;
	}

}
package com.kh.redding.wishlist.model.dao;

import static com.kh.redding.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

public class WishListDao {
	private Properties prop = new Properties();
	
	public WishListDao() {
		String fileName = WishListDao.class.getResource("/sql/wishList/wishList-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//위시리스트 조회용 메소드
	public ArrayList<HashMap<String, Object>> showWishList(Connection con, int num) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
	
		
		String query = prop.getProperty("showWishList");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset= pstmt.executeQuery();

			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap =new HashMap<String, Object>();
				
				hmap.put("mno", rset.getInt("MNO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("pname", rset.getString("PNAME"));
				hmap.put("pcontent", rset.getString("PCONTENT"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("mname", rset.getString("MNAME"));
				hmap.put("ctype", rset.getString("COM_TYPE"));
				hmap.put("wishcode", rset.getInt("WISH_CODE"));
				hmap.put("filepath", rset.getString("FILE_PATH"));
				hmap.put("changename", rset.getString("CHANGE_NAME"));
				
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

	
	//위시리스트 삭제용 메소드
	public int deleteWishList(Connection con, int[] deleteList, int userNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		for(int deleteNum : deleteList) {
			//int deleteNum = deleteList[i];
			
			String query = prop.getProperty("deleteWishList");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, userNum);
				pstmt.setInt(2, deleteNum);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
			
		return result;
	}

	
	//위시리스트 패키지 담기용 메소드
	public int insertPackage(Connection con, int[] packList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		for(int num : packList) {
			String query = prop.getProperty("insertPackage");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, num);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		
		return result;
	}

	
	//패키기 불러오기 메소드
	public ArrayList<HashMap<String, Object>> showPackagePro(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("showPackage");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);

			rset= pstmt.executeQuery();

			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("wishCode", rset.getInt("WISH_CODE"));
				hmap.put("mname", rset.getString("MNAME"));
				hmap.put("mno", rset.getInt("MNO"));
				hmap.put("pno",rset.getInt("PNO"));
				hmap.put("comType", rset.getString("COM_TYPE"));
				hmap.put("pname", rset.getString("PNAME"));
				hmap.put("pcontent", rset.getString("PCONTENT"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("cno", rset.getInt("CNO"));
				hmap.put("cname", rset.getString("CNAME"));
				hmap.put("filepath", rset.getString("FILE_PATH"));
				hmap.put("changename", rset.getString("CHANGE_NAME"));
				
				
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

	
	//패키지 삭제 메소드
	public int deletePackage(Connection con, int mno, int pno) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deletePackage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			pstmt.setInt(2, pno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {	
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	
	//패키지 예약 시 리스트 조회
	public ArrayList searchPackReserve(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ArrayList list = new ArrayList();
		ResultSet rset = null;
		
		String query = prop.getProperty("searchPackReserve");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			
			rset= pstmt.executeQuery();

			while(rset.next()) {
				list.add(rset.getInt("PNO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}
	

	//위시리스트 담기 
	public int insertWishList(Connection con, int mno, int pno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertWishList");
			
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			pstmt.setInt(2, pno);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("다오:" + result);
		return result;
		
	}

	
	//위시리스트 중복 체크
	public int countEqualWishList(int mno, int pno, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("countEqualWishList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			pstmt.setInt(2, pno);
			
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

	
	////정산관리 테이블 중복 체크
	public int countEqualCalc(int cno, int price, Connection con) {
		
		
		
		
		return 0;
	}

}

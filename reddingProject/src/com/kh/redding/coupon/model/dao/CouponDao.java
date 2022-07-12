package com.kh.redding.coupon.model.dao;

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
import com.kh.redding.coupon.model.vo.Coupon;

import static com.kh.redding.common.JDBCTemplate.*;

public class CouponDao {
private Properties prop = new Properties();
	
	public CouponDao() {
		String fileName = CouponDao.class.getResource("/sql/coupon/coupon-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 쿠폰 목록 조회용 메소드
	public ArrayList<HashMap<String, Object>> selectCouponList(Connection con) {
		
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectCouponList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("couponCode", rset.getString("COUPON_CODE"));
				hmap.put("couponName", rset.getString("COUPON_NAME"));
				hmap.put("couponDescrition", rset.getString("COUPON_DESCRITION"));
				hmap.put("couponCategory", rset.getString("COUPON_CATEGORY"));
				hmap.put("discountType", rset.getString("DISCOUNT_TYPE"));
				hmap.put("discountRate", rset.getString("DISCOUNT_RATE"));
				hmap.put("discountAmount", rset.getString("DISCOUNT_AMOUNT"));
				hmap.put("couponStartDate", rset.getDate("COUPON_STARTDATE"));
				hmap.put("couponEndDate", rset.getDate("COUPON_ENDDATE"));
				hmap.put("couponStatus", rset.getString("COUPON_STATUS"));
				
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return list;
			
	}

	// 쿠폰 생성용 메소드
	public int insertCoupon(Connection con, Coupon coupon, Attachment attachment) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCoupon");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, coupon.getCouponName());
			pstmt.setString(2, coupon.getCouponDescrition());
			pstmt.setString(3, coupon.getCouponCategory());
			pstmt.setString(4, coupon.getDiscountType());
			pstmt.setString(5, coupon.getDiscountRate());
			pstmt.setString(6, coupon.getDiscountAmount());
			pstmt.setString(7, coupon.getCouponStartDate());
			pstmt.setString(8, coupon.getCouponEndDate());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	// 쿠폰코드 조회용 메소드
	public int selectCurrval(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int couponCode = 0;
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				couponCode = rset.getInt("currval");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return couponCode;
	}
		
	public int insertAttachment(Connection con, Attachment attachment) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, attachment.getOriginname());
			pstmt.setString(2, attachment.getChangename());
			pstmt.setString(3, attachment.getFilepath());
			pstmt.setInt(4, attachment.getCouponCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 쿠폰 업데이트용 메소드 (발급가능상태 만들기)
	public int updateCouponY(Connection con) {
		Statement stmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCouponListY");
		
		try {
			stmt = con.createStatement();
			
			result = stmt.executeUpdate(query);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
	}
	
	// 쿠폰 업데이트용 메소드 (발급불가능상태 만들기)
	public int updateCouponN(Connection con) {
		Statement stmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCouponListN");
		
		try {
			stmt = con.createStatement();
			
			result = stmt.executeUpdate(query);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
	}

	// 회원 발급가능 쿠폰 목록 조회용 메소드
	public ArrayList<HashMap<String, Object>> selectIssuableCouponList(Connection con, String mno) {
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectIssuableCouponList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("couponCode", rset.getString("COUPON_CODE"));
				hmap.put("couponName", rset.getString("COUPON_NAME"));
				hmap.put("couponDescrition", rset.getString("COUPON_DESCRITION"));
				hmap.put("couponCategory", rset.getString("COUPON_CATEGORY"));
				hmap.put("discountType", rset.getString("DISCOUNT_TYPE"));
				hmap.put("discountRate", rset.getString("DISCOUNT_RATE"));
				hmap.put("discountAmount", rset.getString("DISCOUNT_AMOUNT"));
				hmap.put("couponStartDate", rset.getDate("COUPON_STARTDATE"));
				hmap.put("couponEndDate", rset.getDate("COUPON_ENDDATE"));
				hmap.put("couponStatus", rset.getString("COUPON_STATUS"));
				
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				
				list.add(hmap);
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return list;
	}

	// 쿠폰 발급용 메소드
	public int insertCouponIntoMember(Connection con, String couponCode, String mno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCouponIntoMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, couponCode);
			pstmt.setString(2, mno);
			pstmt.setString(3, "사용전");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 마이페이지 발급 쿠폰 목록 조회용 메소드
	public ArrayList<HashMap<String, Object>> selectAvailableCouponList(Connection con, String mno) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAvailableCouponList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mno);
			pstmt.setString(2, "사용전");
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("couponCode", rset.getString("COUPON_CODE"));
				hmap.put("couponName", rset.getString("COUPON_NAME"));
				// hmap.put("couponDescrition", rset.getString("COUPON_DESCRITION"));
				hmap.put("couponCategory", rset.getString("COUPON_CATEGORY"));
				// hmap.put("discountType", rset.getString("DISCOUNT_TYPE"));
				hmap.put("discountRate", rset.getString("DISCOUNT_RATE"));
				hmap.put("discountAmount", rset.getString("DISCOUNT_AMOUNT"));
				// hmap.put("couponStartDate", rset.getDate("COUPON_STARTDATE"));
				hmap.put("couponEndDate", rset.getDate("COUPON_ENDDATE"));
				// hmap.put("couponStatus", rset.getString("COUPON_STATUS"));
				hmap.put("chistoryCode", rset.getString("CHISTORY_CODE"));
				hmap.put("chistoryStatus", rset.getString("COUPON_STATUS"));
				hmap.put("couponPubDate", rset.getDate("COUPON_PUB_DATE"));
				
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				
				list.add(hmap);
			}
			
			System.out.println("list : " + list);
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	// 중복 발급 방지용 메소드
	public ArrayList<HashMap<String, Object>> checkInsertCouponIntoMember(Connection con, String couponCode, String mno) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//ArrayList<Coupon> list = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		Coupon coupon = null;
		int result2 = 0;
		//int couponCode2 = Integer.parseInt(couponCode);
		
		String query = prop.getProperty("checkInsertCouponIntoMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				
				hmap = new HashMap<String, Object>();
				
				hmap.put("couponCode", rset.getInt("COUPON_CODE"));
				
				list.add(hmap);
				
			}
						
			if(list != null) {
				
				for(int i = 0; i < list.size(); i++) {
					hmap = list.get(i);
					String getCouponCode = hmap.get("couponCode") + "";
					if(couponCode.equals(getCouponCode)) {
						result2++;
					}
				}

			}
			
			if(result2 > 0) {
				result2 = 1;
			}else {
				result2 = 0;
			}
			
			hmap.put("result2", result2);
			list.add(hmap);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
				
		return list;
	}


}

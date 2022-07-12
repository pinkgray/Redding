package com.kh.redding.reservation.model.dao;

import static com.kh.redding.common.JDBCTemplate.close;

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

import com.kh.redding.product.model.vo.Product;
import com.kh.redding.reservation.model.vo.Reservation;


public class ReservationDao {
	Properties prop = new Properties();	

	public ReservationDao() {
		String fileName = ReservationDao.class.getResource("/sql/reservation/reservation-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<Reservation> selectReservation(Connection con, int cno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectReservation");
		ArrayList<Reservation> list = null;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cno);
			rset = pstmt.executeQuery();

			list = new ArrayList<Reservation>();

			while(rset.next()) {
				Reservation res = new Reservation();

				res.setUserName(rset.getString("MNAME"));
				res.setUserPhone(rset.getString("PHONE"));
				res.setRapplyDate(rset.getString(3));
				res.setStatus(rset.getString("RSTATUS"));
				res.setStartDate(rset.getString("USE_START_TIME"));
				res.setEndDate(rset.getString("USE_END_TIME"));
				res.setProductName(rset.getString("PNAME"));
				res.setCompletedDate(rset.getDate("RCOMPLETED_DATE"));
				res.setResNo(rset.getInt("RESNO"));
				list.add(res);				
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

	public int updateReservation(Connection con, int resNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateReservation");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, resNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}


	public ArrayList<Reservation> memberSelectReservation(Connection con, int pno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("memberSelectReservation");
		ArrayList<Reservation> reslist = null;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pno);

			rset = pstmt.executeQuery();
			reslist = new ArrayList<Reservation>();
			while(rset.next()) {
				Reservation reservation = new Reservation();

				reservation.setUseDate(rset.getString(1));
				reservation.setuNum(rset.getInt(2));
				
				reslist.add(reservation);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}


		return reslist;
	}

	public ArrayList<Reservation> memberSelectReservation(Connection con, int pno, String date) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reservation> reslist = null;
		String query = prop.getProperty("memberUseSelectReservation");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pno);
			pstmt.setString(2, date);

			rset = pstmt.executeQuery();


			reslist = new ArrayList<Reservation>();
			while(rset.next()) {
				Reservation reservation = new Reservation();

				reservation.setStartDate(rset.getString("USE_START_TIME"));
				reservation.setEndDate(rset.getString("USE_END_TIME"));
				reservation.setuNum(rset.getInt("UNUM"));
				reservation.setuPno(rset.getInt("UPNO"));
				reslist.add(reservation);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);  
			close(pstmt);
		}


		return reslist;
	}




	//위시리스트 예약(정연)
	public ArrayList<HashMap<String, Object>> reserveWishList(int userNum, int[] resList, Connection con) {
		/*for(int i=0; i<resList.length; i++) {
			System.out.println("resList: " + resList[i]);
		}
		System.out.println("userNum: " +userNum);*/

		/*PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;

		String query = prop.getProperty("reserveWishList");

		list = new ArrayList<HashMap<String,Object>>();
		for(int i=0; i<resList.length; i++) {
			try {
				pstmt=con.prepareStatement(query);
				pstmt.setInt(1, userNum);
				pstmt.setInt(2, resList[i]);

				rset = pstmt.executeQuery();

				while(rset.next()) {
					hmap = new HashMap<String, Object>();

					hmap.put("mno", rset.getInt("MNO"));
					hmap.put("upno", rset.getInt("UPNO"));
					hmap.put("mname", rset.getString("MNAME"));
					hmap.put("pname", rset.getString("PNAME"));
					hmap.put("price", rset.getInt("PRICE"));
					hmap.put("pcontent", rset.getString("PCONTENT"));

					list.add(hmap);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
		}
		return list;
	}*/


		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		ResultSet rset = null;
		Product product = null;
		HashMap<String, Object> hmap = null;

		String query = prop.getProperty("reserveWishList");

		for(int i=0; i<resList.length; i++) {
			if(i == resList.length -1) {
				query += "?)";
			}else {
				query += "?,";
			}
		}

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNum);
			for(int i=0; i<resList.length; i++) {
				System.out.println("resList :" + resList[i]);
				pstmt.setInt(i+2, resList[i]);
			}

			rset = pstmt.executeQuery();

			list = new ArrayList<HashMap<String,Object>>();

			while(rset.next()) {
				
				hmap = new HashMap<String, Object>();
				hmap.put("mno", rset.getInt("MNO"));

				hmap.put("wPno", rset.getInt("PNO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("cName", rset.getString("MNAME"));
				hmap.put("pname", rset.getString("PNAME"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("pContent", rset.getString("PCONTENT"));
				hmap.put("filepath", rset.getString("FILE_PATH"));
				hmap.put("changename", rset.getString("CHANGE_NAME"));
				
				list.add(hmap);
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		System.out.println("다오: "+ list);
		return list;
	}

	public int reservationUpdate(Connection con, int[] upnoArr) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("reservationUpdate");
		
		try {
			for(int i=0; i<upnoArr.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, upnoArr[i]);
				pstmt.setInt(2, upnoArr[i]);
				
				result += pstmt.executeUpdate();
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int reservationInsert(Connection con, int[] upnoArr, int mno, int count) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("reservationInsert");
		
		try {
			for(int i=0; i< upnoArr.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, upnoArr[i]);
				pstmt.setInt(2, mno);
				pstmt.setInt(3, count);
 			
				result += pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int wishListDelete(Connection con, int[] pnoArr, int mno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("wishListDelete");
		System.out.println("query : " + query);
		try {
			
			for(int i=0; i<pnoArr.length; i++) {
				System.out.println(pnoArr[i]);
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, mno);
				pstmt.setInt(2, pnoArr[i]);
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> reservationResultSelect(Connection con, int mno, int[] pnoArr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		 ArrayList<HashMap<String, Object>> list = null;
		 HashMap<String, Object> hmap = new HashMap<String, Object>();
		 String query = prop.getProperty("reservationResultSelect");
		 
		 	for(int i=0; i<pnoArr.length; i++) {
		 		
		 		if(i == pnoArr.length -1) {
					query += "?))";
				}else {
					query += "?,";
				}	
		 		
			}
		 System.out.println("query : " + query);
		 
		 try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			for(int i=0; i<pnoArr.length; i++) {
				pstmt.setInt(i+2, pnoArr[i]);
			}
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap.put("resNo",rset.getInt("RESNO"));
				hmap.put("mName",rset.getString("MNAME"));
				hmap.put("cName",rset.getString("CNAME"));
				hmap.put("pName",rset.getString("PNAME"));
				hmap.put("cPhone",rset.getString("CPHONE"));
				hmap.put("cAddress",rset.getString("CADDRESS"));
				hmap.put("useDate",rset.getString("SUSE_DATE"));
				hmap.put("useStart",rset.getString("USE_START_TIME"));
				hmap.put("userEnd",rset.getString("USE_END_TIME"));
				hmap.put("status",rset.getString("RSTATUS"));
				
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

	public int getCount(Connection con) {
		Statement stmt = null;
		int count = 0;
		ResultSet rset = null;
		String query = prop.getProperty("getCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
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


}

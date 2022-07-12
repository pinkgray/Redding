package com.kh.redding.wishlist.model.service;

import static com.kh.redding.common.JDBCTemplate.close;
import static com.kh.redding.common.JDBCTemplate.commit;
import static com.kh.redding.common.JDBCTemplate.getConnection;
import static com.kh.redding.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.wishlist.model.dao.WishListDao;

public class WishListService {

	//위시리스트 조회용 메소드
	public ArrayList<HashMap<String, Object>> showWishList(int num) {
		Connection con = getConnection();

		ArrayList<HashMap<String, Object>> list = new WishListDao().showWishList(con, num);

		close(con);

		return list;
	}


	//위시리스트 삭제용 메소드
	public int deleteWishList(int[] deleteList, int userNum) {
		Connection con = getConnection();

		int result = new WishListDao().deleteWishList(con, deleteList, userNum);

		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);


		return result;
	}


	//위시리스트 패키지 담기
	public int insertPackage(int[] packList) {
		Connection con = getConnection();

		int result = new WishListDao().insertPackage(con, packList);

		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);


		return result;

	}


	//패키지 불러오는 메소드
	public ArrayList<HashMap<String, Object>> showPackagePro(int mno) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new WishListDao().showPackagePro(con, mno);
		
		close(con);
		
		return list;
	}


	
	//패키지 삭제 메소드
	public int deletePackage(int mno, int pno) {
		Connection con = getConnection();

		int result = new WishListDao().deletePackage(con, mno, pno);

		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);


		return result;
	}


	//패키지 예약 시 리스트 조회
	public ArrayList searchPackReserve(int mno) {
		Connection con = getConnection();
		
		ArrayList list = new WishListDao().searchPackReserve(con, mno); 
		
		close(con);
		
		return list;
	}


	
	//위시리스트 담기 
	public int insertWishList(int mno, int pno) {
		Connection con = getConnection();

		int result = new WishListDao().insertWishList(con, mno, pno);

		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);


		return result;
	}


	
	//위시리스트 중복 확인
	public int countEqualWishList(int mno, int pno) {
		Connection con = getConnection();
		
		int count = new WishListDao().countEqualWishList(mno, pno, con);
		
		close(con);
		
		return count;
	}


	




}

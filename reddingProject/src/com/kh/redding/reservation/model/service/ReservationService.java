package com.kh.redding.reservation.model.service;

import static com.kh.redding.common.JDBCTemplate.close;
import static com.kh.redding.common.JDBCTemplate.commit;
import static com.kh.redding.common.JDBCTemplate.getConnection;
import static com.kh.redding.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.reservation.model.dao.ReservationDao;
import com.kh.redding.reservation.model.vo.Reservation;

public class ReservationService {

	//업체 예약 조회
	public ArrayList<Reservation> selectReservation(int cno) {
		Connection con = getConnection();
		
		ArrayList<Reservation> list = new ReservationDao().selectReservation(con, cno);
		
		
		close(con);
		
		return list;
	}
	
	//업체 예약수정
	public int updateReservation(int resNo) {
		Connection con = getConnection();
		
		int result = new ReservationDao().updateReservation(con, resNo);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	
	//사용 가능한 제품의 날짜를 리턴
	public ArrayList<Reservation> memberSelectReservation(int pno) {
		Connection con = getConnection();
		
		ArrayList<Reservation> reslist = new ReservationDao().memberSelectReservation(con,pno);
		
		close(con);
			
		return reslist;
	}
	
	//사용가능한 제품의 시간을 리턴
	public ArrayList<Reservation> memberSelectReservation(int pno, String date) {
		Connection con = getConnection();
		
		ArrayList<Reservation> reslist = new ReservationDao().memberSelectReservation(con,pno,date);
		
		close(con);
		
		return reslist;
	}

  
  
	//위시리스트 예약(정연)
	public ArrayList<HashMap<String, Object>> reserveWishList(int userNum, int[] resList) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new ReservationDao().reserveWishList(userNum, resList, con);
		
		close(con);
		
		return list;
	}
	
	//예약 테이블에 예약 추가
	public int reservationInsert(int[] pnoArr, int[] upnoArr, int mno) {
		Connection con = getConnection();
		
		int updateResult = new ReservationDao().reservationUpdate(con,pnoArr);
		int insertResult = 0;
		int wUpdateResult = 0;
		int totalResult = 0;
		
		
		if(updateResult == pnoArr.length) {
			int count = new ReservationDao().getCount(con);
			insertResult = new ReservationDao().reservationInsert(con,pnoArr,mno, count);
		}
		
		if(insertResult == upnoArr.length) {
			wUpdateResult = new ReservationDao().wishListDelete(con,upnoArr,mno);
		}
		
		if(wUpdateResult == upnoArr.length) {
			commit(con);
			totalResult = 1;
		}else {
			rollback(con);
			totalResult = 0;
		}
		
		close(con);
		
		
		return totalResult;
	}
	
	//예약시 예약된 리스트 출력
	public ArrayList<HashMap<String, Object>> reservationResultSelect(int mno, int[] pnoArr) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new ReservationDao().reservationResultSelect(con, mno, pnoArr);
		
		close(con);
		
		return list;
	}
  
}

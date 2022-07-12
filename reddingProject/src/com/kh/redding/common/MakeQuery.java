package com.kh.redding.common;

import java.io.FileNotFoundException;

import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.redding.board.model.vo.BoardPageInfo;
import com.kh.redding.member.model.dao.MemberDao;

public class MakeQuery {

	public MakeQuery() {}

	public void makeQuery(int value, int mno, String firstDate, String lastDate,BoardPageInfo pi) {

		Properties prop = new Properties();
		String fileName = MakeQuery.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String query = "";
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;

		if(value == 10 || value == 20) {
			query = "SELECT RNUM,PNAME,CNAME,RAPPLY_DATE,SUBNO,PRICE,RSTATUS,RESNO,UPNO,USE_DATE, USE_START_TIME, USE_END_TIME FROM ((SELECT ROWNUM RNUM,PNAME,SUBNO,CNAME,RAPPLY_DATE,PRICE,RSTATUS,RESNO,UPNO,USE_DATE, USE_START_TIME, USE_END_TIME FROM (SELECT P.PNAME PNAME,M.MNAME CNAME,R.RESNO RESNO,R.SUBNO SUBNO ,R.RAPPLY_DATE RAPPLY_DATE,P.PRICE PRICE ,R.RSTATUS RSTATUS,UP.UPNO UPNO,UP.USE_DATE USE_DATE,UP.USE_START_TIME USE_START_TIME, UP.USE_END_TIME USE_END_TIME FROM RESERVATION R JOIN USE_PRODUCT UP ON(R.UPNO = UP.UPNO) JOIN PRODUCT P ON(UP.PNO = P.PNO) JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (C.CNO = M.MNO) WHERE R.MNO= " + mno + " AND R.RSTATUS =" + " " + value + " " + "ORDER BY RAPPLY_DATE DESC))) WHERE RNUM BETWEEN"+ " " + startRow + " AND" +" " + endRow;
		}else if(value == 30) {
			query = "SELECT RNUM,PAYNO,UPNO,APPROVAL,PNAME,RAPPLY,CNAME,FINAL_PRICE,PAYDIV,USE_DATE, USE_START_TIME, USE_END_TIME FROM(SELECT ROWNUM RNUM, PAYNO,FINAL_PRICE,UPNO,APPROVAL,PNAME,RAPPLY,CNAME,PAYDIV,USE_DATE, USE_START_TIME, USE_END_TIME FROM(SELECT PH.PAYNO PAYNO,FINAL_PRICE, PH.UPNO UPNO,PH.APPROVAL_DATE APPROVAL,P.PNAME PNAME,RAPPLY_DATE RAPPLY ,M.MNAME CNAME,PH.PAY_DIV PAYDIV,UP.USE_DATE USE_DATE,UP.USE_START_TIME USE_START_TIME, UP.USE_END_TIME USE_END_TIME FROM PAY_HISTORY PH JOIN USE_PRODUCT UP ON (PH.UPNO = UP.UPNO) JOIN PRODUCT P ON (UP.PNO = P.PNO) JOIN RESERVATION R ON (PH.UPNO = R.UPNO AND PH.MNO = R.MNO) JOIN MEMBER M ON(M.MNO = P.CNO) WHERE PH.PAY_DIV = ? AND PH.MNO = " + " " +mno + " " +" ORDER BY PH.APPROVAL_DATE DESC)) WHERE RNUM BETWEEN"+ " " + startRow + " " + " AND" +" "+ endRow;
		}else if(value == 40) {
			query = "SELECT RNUM,PNAME,CNAME,RAPPLY_DATE,SUBNO,PRICE,RSTATUS,RESNO,UPNO,USE_DATE, USE_START_TIME, USE_END_TIME FROM ((SELECT ROWNUM RNUM,PNAME,CNAME,SUBNO,RAPPLY_DATE,PRICE,RSTATUS,RESNO,UPNO,USE_DATE, USE_START_TIME, USE_END_TIME FROM (SELECT P.PNAME PNAME,M.MNAME CNAME,R.RESNO RESNO,R.SUBNO SUBNO ,R.RAPPLY_DATE RAPPLY_DATE,P.PRICE PRICE ,R.RSTATUS RSTATUS,UP.UPNO UPNO,UP.USE_DATE USE_DATE,UP.USE_START_TIME USE_START_TIME, UP.USE_END_TIME USE_END_TIME FROM RESERVATION R JOIN USE_PRODUCT UP ON(R.UPNO = UP.UPNO) JOIN PRODUCT P ON(UP.PNO = P.PNO) JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (C.CNO = M.MNO) WHERE R.MNO=" + " "+ mno + " " +  "AND R.RSTATUS = 10 AND RAPPLY_DATE BETWEEN TO_DATE("+firstDate+") AND TO_DATE("+lastDate+") ORDER BY RAPPLY_DATE DESC))) WHERE RNUM BETWEEN"+ " " + startRow + " " +" AND" +" "+ endRow; 
		}else if(value == 50) {
			query = "SELECT RNUM,PNAME,CNAME,RAPPLY_DATE,PRICE,SUBNO,RSTATUS,RESNO,UPNO,USE_DATE, USE_START_TIME, USE_END_TIME FROM ((SELECT ROWNUM RNUM,PNAME,CNAME,RAPPLY_DATE,PRICE,RSTATUS,RESNO,UPNO,SUBNO,USE_DATE, USE_START_TIME, USE_END_TIME FROM (SELECT P.PNAME PNAME,M.MNAME CNAME,R.RESNO RESNO ,R.RAPPLY_DATE RAPPLY_DATE,P.PRICE PRICE,R.SUBNO SUBNO,R.RSTATUS RSTATUS,UP.UPNO UPNO,UP.USE_DATE USE_DATE,UP.USE_START_TIME USE_START_TIME, UP.USE_END_TIME USE_END_TIME FROM RESERVATION R JOIN USE_PRODUCT UP ON(R.UPNO = UP.UPNO) JOIN PRODUCT P ON(UP.PNO = P.PNO) JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (C.CNO = M.MNO) WHERE R.MNO=" + " "+ mno + " " +  "AND R.RSTATUS = 20 AND RAPPLY_DATE BETWEEN TO_DATE("+firstDate+") AND TO_DATE("+lastDate+") ORDER BY RAPPLY_DATE DESC))) WHERE RNUM BETWEEN"+ " " + startRow + " " +" AND" +" "+ endRow;
		}else if(value == 60 || value == 70) {
			query = "SELECT RNUM,PAYNO,UPNO,APPROVAL,PNAME,RAPPLY,CNAME,FINAL_PRICE,PAYDIV,USE_DATE, USE_START_TIME, USE_END_TIME FROM(SELECT ROWNUM RNUM,PAYNO,UPNO,FINAL_PRICE,APPROVAL,PNAME,RAPPLY,CNAME,PAYDIV,USE_DATE, USE_START_TIME, USE_END_TIME FROM(SELECT PH.PAYNO PAYNO, PH.UPNO UPNO,FINAL_PRICE,PH.APPROVAL_DATE APPROVAL,P.PNAME PNAME,RAPPLY_DATE RAPPLY ,M.MNAME CNAME,PH.PAY_DIV PAYDIV, UP.USE_DATE USE_DATE,UP.USE_START_TIME USE_START_TIME, UP.USE_END_TIME USE_END_TIME FROM PAY_HISTORY PH JOIN USE_PRODUCT UP ON (PH.UPNO = UP.UPNO) JOIN PRODUCT P ON (UP.PNO = P.PNO) JOIN RESERVATION R ON (PH.UPNO = R.UPNO AND PH.MNO = R.MNO) JOIN MEMBER M ON(M.MNO = P.CNO) WHERE PH.PAY_DIV = ? AND PH.MNO = " + " " +mno + " " + "AND APPROVAL_DATE BETWEEN TO_DATE("+firstDate+") AND TO_DATE("+lastDate+")" + " ORDER BY PH.APPROVAL_DATE DESC)) WHERE RNUM BETWEEN"+ " " + startRow + " " + " AND" +" "+ endRow;					
		}

		prop.setProperty(prop.getProperty("","dynamicQuery"),query);


		FileOutputStream fos = null;
		OutputStreamWriter osw = null;

		try {

			fos = new FileOutputStream(fileName);
			osw = new OutputStreamWriter(fos, "UTF-8");

			prop.store(osw, "");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				fos.close();
				osw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}	

	}

	public void searchProduct(int value, int cno) {
		Properties prop = new Properties();
		String fileName = MakeQuery.class.getResource("/sql/product/product-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			e1.printStackTrace();
		}


		String query = "";

		if(value == 10) {
			query = "SELECT RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT ROWNUM RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT P.PNO, P.PNAME, P.PCONTENT, P.PRICE, P.PENROLL_DATE, P.CNO, P.PMODIFY_DATE, P.PRO_STATUS FROM PRODUCT P JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (M.MNO = C.CNO) WHERE P.CNO = ? ORDER BY P.PNO DESC ) ) WHERE RNUM BETWEEN ? AND ?";// WHERE RNUM BETWEEN ? AND ?
		}else if(value == 20) {
			query = "SELECT RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT ROWNUM RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT P.PNO, P.PNAME, P.PCONTENT, P.PRICE, P.PENROLL_DATE, P.CNO, P.PMODIFY_DATE, P.PRO_STATUS FROM PRODUCT P JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (M.MNO = C.CNO) WHERE P.CNO = ? AND PRO_STATUS =? ORDER BY P.PNO DESC ) )  WHERE RNUM BETWEEN ? AND ?";//WHERE RNUM BETWEEN ? AND ?
		}else if(value == 30) {
			query = "SELECT RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT ROWNUM RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT P.PNO, P.PNAME, P.PCONTENT, P.PRICE, P.PENROLL_DATE, P.CNO, P.PMODIFY_DATE, P.PRO_STATUS FROM PRODUCT P JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (M.MNO = C.CNO) WHERE P.CNO = ? AND PNAME LIKE '%'||?||'%' ORDER BY P.PNO DESC ) )  WHERE RNUM BETWEEN ? AND ?";//WHERE RNUM BETWEEN ? AND ?
		}else if(value == 40) {
			query = "SELECT RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT ROWNUM RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT P.PNO, P.PNAME, P.PCONTENT, P.PRICE, P.PENROLL_DATE, P.CNO, P.PMODIFY_DATE, P.PRO_STATUS FROM PRODUCT P JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (M.MNO = C.CNO) WHERE P.CNO = ? AND PNAME LIKE '%'||?||'%' AND PRO_STATUS=? ORDER BY P.PNO DESC ) )  WHERE RNUM BETWEEN ? AND ?";//WHERE RNUM BETWEEN ? AND ?
		}


		prop.setProperty(prop.getProperty("","searchProduct"),query);

		FileOutputStream fos = null;
		OutputStreamWriter osw = null;

		try {

			fos = new FileOutputStream(fileName);
			osw = new OutputStreamWriter(fos, "UTF-8");

			prop.store(osw, "");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fos.close();
				osw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
	}  

	public void makeQueryCount(String firstDate, String lastDate, int value, int mno) {
		Properties prop = new Properties();
		String fileName = MakeQuery.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String query = "";

		if(value == 40) {
			query = "SELECT COUNT(*) FROM RESERVATION WHERE MNO = " + " " + mno + "" +" AND RSTATUS = 10 AND RAPPLY_DATE BETWEEN TO_DATE(" + firstDate + ") AND TO_DATE(" + lastDate + ")";
		}else if(value == 50) {
			query = "SELECT COUNT(*) FROM RESERVATION WHERE MNO = " + " " + mno + "" +" AND RSTATUS = 20 AND RAPPLY_DATE BETWEEN TO_DATE(" + firstDate + ") AND TO_DATE(" + lastDate + ")";
		}else if(value == 60 || value==70) {
			query = "SELECT COUNT(*) FROM PAY_HISTORY WHERE MNO = " + " " + mno + "" +" AND PAY_DIV = ? AND APPROVAL_DATE BETWEEN TO_DATE(" + firstDate + ") AND TO_DATE(" + lastDate + ")";
		}

		prop.setProperty(prop.getProperty("","countDynamicQuery"),query);

		FileOutputStream fos = null;
		OutputStreamWriter osw = null;

		try {

			fos = new FileOutputStream(fileName);
			osw = new OutputStreamWriter(fos, "UTF-8");

			prop.store(osw, "");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fos.close();
				osw.close();
			} catch (IOException e) {

				e.printStackTrace();
			}

		}
	}

	// 관리자 업체 목록 조건 검색 (효정)
	public void makeSearchCompanyListQuery(ArrayList searchConditionList) {
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		String companyName = searchConditionList.get(0).toString();
		String companyCategory = searchConditionList.get(1).toString();
		String companyEnrollDate = searchConditionList.get(2).toString();
		String companyStatus = searchConditionList.get(3).toString();
		String firstDate = searchConditionList.get(4).toString();
		String lastDate = searchConditionList.get(5).toString();

		String query = "SELECT RNUM, MNO, MID, MPWD, MNAME, NICK_NAME, EMAIL, EMAIL_CHECK, PHONE, EMERGEN_CON, GENDER, ENROLL_DATE, STATUS, MODIFY_DATE, MNOTI_TYPE, OUT_DATE, WEDDING_DATE, MTYPE, COM_TYPE FROM(SELECT ROWNUM RNUM, MNO, MID, MPWD, MNAME, NICK_NAME, EMAIL, EMAIL_CHECK, PHONE, EMERGEN_CON, GENDER, ENROLL_DATE, STATUS, MODIFY_DATE, MNOTI_TYPE, OUT_DATE, WEDDING_DATE, MTYPE, COM_TYPE FROM (SELECT M.MNO, M.MID, M.MPWD, M.MNAME, M.NICK_NAME, M.EMAIL, M.EMAIL_CHECK, M.PHONE, M.EMERGEN_CON, M.GENDER, M.ENROLL_DATE, M.STATUS, M.MODIFY_DATE, M.MNOTI_TYPE, M.OUT_DATE, M.WEDDING_DATE, M.MTYPE, C.COM_TYPE FROM MEMBER M JOIN COMPANY C ON(M.MNO = C.CNO) WHERE M.MTYPE=20 ORDER BY M.MNO DESC) ORDER BY RNUM ASC)";

		if(companyName.equals("")) {
			query += " WHERE MNAME LIKE '%'";
		}else {
			query += " WHERE MNAME LIKE '%'||?||'%'";
		}
		
		if(companyCategory.equals("전체")) {
			query += " AND COM_TYPE LIKE '%'";
		}else {
			query += " AND COM_TYPE = ?";
		}
		
		if(companyEnrollDate.equals("전체")) {
			query += " AND ENROLL_DATE LIKE '%'";
		}else if(companyEnrollDate.equals("검색")) {
			query += " AND ENROLL_DATE BETWEEN ? AND ?";
		}
		
		if(companyStatus.equals("전체")) {
			query += " AND STATUS LIKE '%'";
		}else {
			query += " AND STATUS = ?";
		}
		
		prop.setProperty(prop.getProperty("","selectSearchCompanyList"),query);
		
		FileOutputStream fos = null;
		OutputStreamWriter osw = null;

		try {

			fos = new FileOutputStream(fileName);
			osw = new OutputStreamWriter(fos, "UTF-8");

			prop.store(osw, "");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fos.close();
				osw.close();
			} catch (IOException e) {

				e.printStackTrace();
			}

		}

	}

	// 관리자 회원 목록 조건 검색 (효정)
	public void makeSearchMemberListQuery(ArrayList searchConditionList) {
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		String memberInfoSelect = searchConditionList.get(0).toString();
		String memberInfoInput = searchConditionList.get(1).toString();
		String memberEnrollDate = searchConditionList.get(2).toString();
		String efirstDate = searchConditionList.get(3).toString();
		String elastDate = searchConditionList.get(4).toString();
		String memberWeddingDate = searchConditionList.get(5).toString();
		String wfirstDate = searchConditionList.get(6).toString();
		String wlastDate = searchConditionList.get(7).toString();
		String memberStatus = searchConditionList.get(8).toString();

		String query = "SELECT RNUM, MNO, MID, MPWD, MNAME, NICK_NAME, EMAIL, EMAIL_CHECK, PHONE, EMERGEN_CON, GENDER, ENROLL_DATE, STATUS, MODIFY_DATE, MNOTI_TYPE, OUT_DATE, WEDDING_DATE, MTYPE FROM(SELECT ROWNUM RNUM, MNO, MID, MPWD, MNAME, NICK_NAME, EMAIL, EMAIL_CHECK, PHONE, EMERGEN_CON, GENDER, ENROLL_DATE, STATUS, MODIFY_DATE, MNOTI_TYPE, OUT_DATE, WEDDING_DATE, MTYPE FROM (SELECT MNO, MID, MPWD, MNAME, NICK_NAME, EMAIL, EMAIL_CHECK, PHONE, EMERGEN_CON, GENDER, ENROLL_DATE, STATUS, MODIFY_DATE, MNOTI_TYPE, OUT_DATE, WEDDING_DATE, MTYPE FROM MEMBER WHERE MTYPE=10 ORDER BY MNO DESC) ORDER BY RNUM ASC)";
		
		if(!memberInfoSelect.equals("- 선택 -")) {
			
			if(memberInfoSelect.equals("닉네임")) {
				query += " WHERE NICK_NAME = ?";
			}else if(memberInfoSelect.equals("회원명")) {
				query += " WHERE MNAME = ?";
			}else if(memberInfoSelect.equals("연락처")) {
				query += " WHERE PHONE = ?";
			}else if(memberInfoSelect.equals("이메일")) {
				query += " WHERE EMAIL = ?";
			}
			
			if(memberStatus.equals("전체")) {
				query += " AND STATUS LIKE '%'";
			}else {
				query += " AND STATUS = ?";
			}
			
			if(memberEnrollDate.equals("전체")) {
				query += " AND ENROLL_DATE LIKE '%'";
			}else if(memberEnrollDate.equals("검색")) {
				query += " AND ENROLL_DATE BETWEEN ? AND ?";
			}
			
			if(memberWeddingDate.equals("전체")) {
				query += " AND WEDDING_DATE LIKE '%'";
			}else if(memberWeddingDate.equals("검색")) {
				query += " AND WEDDING_DATE BETWEEN ? AND ?";
			}
			
		}else {
			
			if(memberStatus.equals("전체")) {
				query += " WHERE STATUS LIKE '%'";
			}else {
				query += " WHERE STATUS = ?";
			}
			
			if(memberEnrollDate.equals("전체")) {
				query += " AND ENROLL_DATE LIKE '%'";
			}else if(memberEnrollDate.equals("검색")) {
				query += " AND ENROLL_DATE BETWEEN ? AND ?";
			}
			
			if(memberWeddingDate.equals("전체")) {
				query += " AND WEDDING_DATE LIKE '%'";
			}else if(memberWeddingDate.equals("검색")) {
				query += " AND WEDDING_DATE BETWEEN ? AND ?";
			}
			
		}
		
		prop.setProperty(prop.getProperty("","selectSearchMemberList"),query);
		
		FileOutputStream fos = null;
		OutputStreamWriter osw = null;

		try {

			fos = new FileOutputStream(fileName);
			osw = new OutputStreamWriter(fos, "UTF-8");

			prop.store(osw, "");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fos.close();
				osw.close();
			} catch (IOException e) {

				e.printStackTrace();
			}

		}
		
	}
	
	public void makeStatsQuery(int value, String startDate, String endDate) {
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		String query = "SELECT GENDER,GNUM,TNUM FROM(SELECT GENDER GENDER, ENROLL_DATE GNUM ,COUNT(*) TNUM FROM MEMBER WHERE MTYPE = 10";
		if(value == 30) {
			query += " AND GENDER = 'M' AND ENROLL_DATE BETWEEN TO_DATE("+startDate+") AND TO_DATE("+endDate+") GROUP BY GENDER,ENROLL_DATE ORDER BY 2 ASC)";
		}else if(value == 40) {
			query += " AND GENDER = 'F' AND ENROLL_DATE BETWEEN TO_DATE("+startDate+") AND TO_DATE("+endDate+") GROUP BY GENDER,ENROLL_DATE ORDER BY 2 ASC)";
		}else if (value == 50) {
			query = "SELECT GNUM, TNUM FROM (SELECT ENROLL_DATE GNUM,COUNT(*) TNUM FROM MEMBER WHERE MTYPE = 10  AND ENROLL_DATE BETWEEN TO_DATE("+startDate+") AND TO_DATE("+endDate+") GROUP BY ENROLL_DATE ORDER BY 1 ASC)";
		}
		
		
		prop.setProperty(prop.getProperty("","makeStatsQuery"), query);
		
		FileOutputStream fos = null;
		OutputStreamWriter osw = null;

		try {

			fos = new FileOutputStream(fileName);
			osw = new OutputStreamWriter(fos, "UTF-8");

			prop.store(osw, "");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fos.close();
				osw.close();
			} catch (IOException e) {

				e.printStackTrace();
			}

		}
		
	}

	public void CompanyDetailStats(int value, String startDate, String endDate) {
		
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		String type = "";
		
		
		
		if(value == 20) {
			type = "스튜디오";
		}else if(value == 30) {
			type += "드레스";
		}else if(value == 40) {
			type += "메이크업";
		}
		
		String query = "SELECT COM_TYPE, ENROLL_DATE, TNUM FROM(SELECT C.COM_TYPE COM_TYPE , M.ENROLL_DATE ENROLL_DATE ,COUNT(*) TNUM FROM MEMBER M JOIN COMPANY C ON(M.MNO = C.CNO) WHERE C.COM_TYPE = '" + type + "' AND ENROLL_DATE BETWEEN TO_DATE("+startDate+") AND TO_DATE("+endDate+") GROUP BY C.COM_TYPE, M.ENROLL_DATE ORDER BY ENROLL_DATE)";
		
		if(value == 10) {
			query = "SELECT ENROLL_DATE, TNUM FROM(SELECT  M.ENROLL_DATE ENROLL_DATE ,COUNT(*) TNUM FROM MEMBER M JOIN COMPANY C ON(M.MNO = C.CNO) WHERE ENROLL_DATE BETWEEN TO_DATE("+startDate+") AND TO_DATE("+endDate+") GROUP BY M.ENROLL_DATE ORDER BY ENROLL_DATE)";
		}
		prop.setProperty(prop.getProperty("","CompanyDetailStats"), query);
		
		FileOutputStream fos = null;
		OutputStreamWriter osw = null;

		try {

			fos = new FileOutputStream(fileName);
			osw = new OutputStreamWriter(fos, "UTF-8");

			prop.store(osw, "");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fos.close();
				osw.close();
			} catch (IOException e) {

				e.printStackTrace();
			}

		}
	
		
		
	}

	public void saleStatsQuery(String radioValue, String selectValue, String startDate, String endDate) {
		
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		String type = "";
		String query = "";
		
		if(selectValue.equals("일별")) {
			if(radioValue.equals("전체")) {
				type = "";
			}else{
				type = "AND C.COM_TYPE='" + radioValue + "'";
			}
			query = "SELECT DECODE(DAY_DATE,'월요일',10,'화요일' ,20,'수요일',30,'목요일',40,'금요일',50,'토요일',60,'일요일',70) DAY_NUM ,DAY_DATE, TO_CHAR(FINAL_PRICE,'999,999,999') FROM (SELECT TO_CHAR(APPROVAL_DATE,'DAY') DAY_DATE ,SUM(FINAL_PRICE) FINAL_PRICE  FROM PAY_HISTORY PH JOIN USE_PRODUCT UP ON (PH.UPNO = UP.UPNO) JOIN PRODUCT P ON(UP.PNO = P.PNO) JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON(C.CNO = M.MNO) WHERE PH.PAY_DIV = '결제' " + type + " AND APPROVAL_DATE BETWEEN TO_DATE("+startDate+") AND TO_DATE("+endDate+") GROUP BY TO_CHAR(APPROVAL_DATE,'DAY')) ORDER BY DAY_NUM ASC";
		}
		
		
		if(selectValue.equals("주별")) {
			if(radioValue.equals("전체")) {
				type="";
			}else {
				type = "AND C.COM_TYPE='" + radioValue + "'";
			}
			query = "SELECT DAY_DATE,FINAL_PRICE FROM(SELECT TO_CHAR(PH.APPROVAL_DATE,'YYYY-MM') DAY_DATE ,TO_CHAR(SUM(PH.FINAL_PRICE),'999,999,999') FINAL_PRICE FROM PAY_HISTORY PH JOIN USE_PRODUCT UP ON (PH.UPNO = UP.UPNO) JOIN PRODUCT P ON(UP.PNO = P.PNO) JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON(C.CNO = M.MNO) WHERE PH.PAY_DIV ='결제' AND  APPROVAL_DATE BETWEEN TO_DATE("+startDate+") AND TO_DATE("+endDate+") " + type + " GROUP BY TO_CHAR(PH.APPROVAL_DATE,'YYYY-MM') ORDER BY 1 ASC)";
		}
		//SELECT DAY_DATE,FINAL_PRICE FROM(SELECT TO_CHAR(PH.APPROVAL_DATE,'YYYYMM') DAY_DATE ,TO_CHAR(SUM(PH.FINAL_PRICE),'999,999,999') FINAL_PRICE FROM PAY_HISTORY PH JOIN USE_PRODUCT UP ON (PH.UPNO = UP.UPNO) JOIN PRODUCT P ON(UP.PNO = P.PNO) JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON(C.CNO = M.MNO) WHERE PH.PAY_DIV ='결제' AND  APPROVAL_DATE BETWEEN TO_DATE(20190424) AND TO_DATE(20190524) GROUP BY TO_CHAR(PH.APPROVAL_DATE,'YYYYMM') ORDER BY 1 DESC);
		
		if(selectValue.equals("Top10")) {
			if(radioValue.equals("전체")) {
				type="";
			}else {
				type = "AND C.COM_TYPE='" + radioValue + "'";
			}
			query = "SELECT RNUM,CNAME,TOPM FROM(SELECT ROWNUM RNUM,CNAME,TO_CHAR(TOPM,'999,999,999') TOPM FROM(SELECT M.MNAME CNAME , SUM(CL.CALCULATE_MONEY) TOPM FROM CALCULATE CL JOIN MEMBER M ON(CL.CNO = M.MNO) JOIN COMPANY C ON(M.MNO = C.CNO) WHERE TO_CHAR(CL.CALCULATE_DATE,'YYYY-MM') = '"+startDate+"' " +type+ " GROUP BY M.MNAME ORDER BY 2 DESC))WHERE RNUM BETWEEN 1 AND 10";
		}
		
		
		
		prop.setProperty(prop.getProperty("","saleStatsQuery"), query);
		
		FileOutputStream fos = null;
		OutputStreamWriter osw = null;

		try {

			fos = new FileOutputStream(fileName);
			osw = new OutputStreamWriter(fos, "UTF-8");

			prop.store(osw, "");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fos.close();
				osw.close();
			} catch (IOException e) {

				e.printStackTrace();
			}

		}
		
		
		
		
	}


}

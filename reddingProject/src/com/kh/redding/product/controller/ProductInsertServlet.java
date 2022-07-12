package com.kh.redding.product.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.company.model.vo.Company;
import com.kh.redding.product.model.service.ProductService;
import com.kh.redding.product.model.vo.Product;
import com.kh.redding.product.model.vo.UseProduct;



@WebServlet("/insert.pr")
public class ProductInsertServlet extends HttpServlet {
      private static final long serialVersionUID = 1L;
       public ProductInsertServlet() {
           super();
       }
      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String proStatus = request.getParameter("proStatus");
         String pName1 = request.getParameter("picSelect");
         String pName2 = request.getParameter("pmiSelect");
         String pName3 = request.getParameter("etc");
         String pName = ""; 
         if(pName2 == "") {
            pName = pName1;
         }else {
            if(pName3 != null) {
               pName = pName1 + "-" + pName3;
            }else {
               pName = pName1 + "-" +  pName2;
            }
         }
         String uNum1 = request.getParameter("productAmount");
         String uNum2 = request.getParameter("proAmount");
         int uNum = 0;
         if(!uNum1.equals("기타")) {
            uNum = Integer.parseInt(uNum1);
         }else {
            uNum = Integer.parseInt(uNum2);
         }
         
         int price = Integer.parseInt(request.getParameter("piPrice"));

         Date pEnrollDate = new Date(new GregorianCalendar().getTimeInMillis());
         
         String pContent = request.getParameter("info");
         
         int cNo = Integer.parseInt(request.getParameter("cNo"));
         
         Company com = new ProductService().selectCompanyOne(cNo);

         //날짜 지정 포맷
         String datePattern = "yyyy-MM-dd";
         //상품판매시작 기간 
         String inputStartDate = request.getParameter("proStartDay");
         Date proStartDay = null;
         if(inputStartDate != "") {
            proStartDay = Date.valueOf(inputStartDate);
         }else {
            proStartDay = new Date(new GregorianCalendar().getTimeInMillis());
         }
         inputStartDate = proStartDay+"";
         String inputEndDate = request.getParameter("proEndDay");
         Date proEndDay = null;
         if(inputEndDate != "") {
            proEndDay = Date.valueOf(inputEndDate);
         }else {
            proEndDay = new Date(new GregorianCalendar().getTimeInMillis());
         }
         inputEndDate = proEndDay+"";
         
         SimpleDateFormat sdf = new SimpleDateFormat(datePattern);
         ArrayList<String> useDates = new ArrayList<String>();
         java.util.Date startDay = proStartDay;
         ArrayList<String> days = new ArrayList<String>();
         
         while(startDay.compareTo(proEndDay) <= 0) {
            useDates.add(sdf.format(startDay));
            Calendar cal = Calendar.getInstance();
            cal.setTime(startDay);
            int day = cal.get(Calendar.DAY_OF_WEEK);
            days.add(day+"");
            cal.add(Calendar.DAY_OF_MONTH, 1);
            startDay = cal.getTime();
         }
         
         String dayWeek = com.getHoliday();
         String[] dayWeeks = null;
         int[] dayOfWeek=null;
         int[] checkList =new int[days.size()];
         if(dayWeek==null) {
        	 dayWeeks = new String[] {"하","하","하","하","하","하","하"};
        	 dayOfWeek = new int[dayWeeks.length];
         }else {
        	 dayWeeks = dayWeek.split(",");
        	 dayOfWeek = new int[dayWeeks.length];
         }
         for(int i=0 ; i<dayWeeks.length ; i++) {
        	 switch(dayWeeks[i]) {
        	 case "일" : dayOfWeek[i] = 1 ; break;
        	 case "월" : dayOfWeek[i] = 2 ; break;
        	 case "화" : dayOfWeek[i] = 3 ; break;
        	 case "수" : dayOfWeek[i] = 4 ; break;
        	 case "목" : dayOfWeek[i] = 5 ; break;
        	 case "금" : dayOfWeek[i] = 6 ; break;
        	 case "토" : dayOfWeek[i] = 7 ; break;
        	 default : dayOfWeek[i] = 99;break;
        	 }
         }
         ArrayList<String> useDate = new ArrayList<String>();
         checkList = new int[days.size()];
         for(int i=0 ; i<days.size() ; i++) {
            for(int j=0 ; j<dayOfWeek.length ; j++) {
               if(Integer.parseInt(days.get(i)) == dayOfWeek[j]) {
                  checkList[i] = 0;
                  break;
               }else if(Integer.parseInt(days.get(i)) != dayOfWeek[j]) {
                  checkList[i] = 1;
               }
            }
         }
         for(int i=0 ; i<checkList.length; i++) {
            if(checkList[i]==1) {
               useDate.add(useDates.get(i));
            }
         }
         String openTimes = com.getOpenTime();   //업체영업시작시간
         String closeTimes = com.getEndTime();   //업체영업종료시간
         
         String[] comStart = openTimes.split(":");   //시간만 받아오기 위한 쪼개기
         int openTime = Integer.parseInt(comStart[0]);   //for문을 돌리기 위한 int변환
         String start = null;
         String[] comClose = closeTimes.split(":");    //시간만 받아오기 위한 쪼개기
         int closeTime = Integer.parseInt(comClose[0]);   //for문을 돌리기 위한 int변환
         String end = null;
         //인서트(삽입)
         //insert할 때 product랑 use_product랑 동시에 insert해주어야 한다.
         Product pro = new Product();
         pro.setpName(pName);
         pro.setpContent(pContent);
         pro.setPrice(price);
         pro.setpEnrollDate(pEnrollDate);
         pro.setProStatus(proStatus);
         pro.setcNo(cNo);
         ArrayList<UseProduct> uProList = new ArrayList<UseProduct>();
         int k = 0;
         for(int i=0 ; i<useDate.size() ; i++) {
            for(int j=openTime ; j<closeTime ; j++) {
               UseProduct upro = new UseProduct();
               upro.setUseDate(Date.valueOf(useDate.get(i)));;
               upro.setuNum(uNum);
               k = j+1;
               if(j<10) {
                  start = "0" + j + ":00";
                  if(k<10) {
                     end = "0"+ k + ":00";
                  }
                   end = k + ":00";
               }else {
                  
                  start = j +":00";
                  end = k + ":00";
               }
               upro.setUseStartTime(start);
               upro.setUseEndTime(end);
               uProList.add(upro);
            }
         }
         int result = new ProductService().insertUseProduct(pro,uProList, useDate);
         String page = "";
         if(result > 0) {
            page = request.getContextPath() + "/selectProList.pr?mno="+cNo;
            response.sendRedirect(page);
         }else {
            page = "views/common/errorPage.jsp";
            request.setAttribute("msg", "상품등록에 실패하셨습니다.");
            request.getRequestDispatcher(page).forward(request, response);
         }
      }

      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGet(request, response);
      }

   }
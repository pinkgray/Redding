package com.kh.redding.message.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.member.model.vo.Member;
import com.kh.redding.message.model.service.MessageService;
import com.kh.redding.message.model.vo.Message;
import com.kh.redding.product.model.vo.PageInfo;

@WebServlet("/comReceiveList.mes")
public class CompanyMessageReceiveListMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CompanyMessageReceiveListMessageServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  //System.out.println("업체의 받은 쪽지 리스트 보여주기 서블릿");
	      Member login = (Member)request.getSession().getAttribute("loginUser");
	      int cno = login.getMno();
	      //System.out.println("cno : " + cno);
	      int wt = Integer.parseInt(request.getParameter("wt"));
	      int listCount = Integer.parseInt(request.getParameter("value"));
	      //System.out.println("listCount : " + listCount);
	      
	      
	      int currentPage;
	      int limit;
	      int maxPage;
	      int startPage;
	      int endPage;
	      int startRow;
	      int endRow;
	      
	      if(request.getParameter("currentPage") != null) {
	         currentPage = Integer.parseInt(request.getParameter("currentPage"));
	      }else {
	    	  currentPage=1;
	    	 
	      }
	      //System.out.println("currentPage : " + currentPage);
	      limit = 10;
	      
	      maxPage = (int)((double)listCount / limit + 0.9);
	      
	      startPage = (((int)((double)currentPage /limit + 0.9)) - 1) * 10 + 1;
	      
	      endPage = startPage + 9;
	      
	      if(maxPage<endPage) {
	         endPage = maxPage;
	      }
	      
	      PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
	      
	      startRow = (pi.getCurrentPage() - 1 ) * pi.getLimit() + 1;
	      endRow = startRow + pi.getLimit() - 1;
	      
	      pi.setStartRow(startRow);
	      pi.setEndRow(endRow);
	      
	      ArrayList<Message> compMesList = new MessageService().selectListCompReceiveMes(pi, cno, wt);
	      
	      HashMap<String, Object> hmap = new HashMap<String, Object>();
	      
	      hmap.put("pi", pi);
	      hmap.put("compMesList", compMesList);
	      
	      //System.out.println("compMesList.size : " + compMesList.size());
	      
	      response.setContentType("application/json");
	      new Gson().toJson(hmap, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

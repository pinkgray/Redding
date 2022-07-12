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

@WebServlet("/receiveList.mes")
public class SelectListReceiveMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SelectListReceiveMessageServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("모든 업체들에게 받은 쪽지 전체 리스트 조회 서블릿");
		
		int wtype = 10;//수신

		int listCount = Integer.parseInt(request.getParameter("value"));
		  
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		int startRow;
		int endRow;
		  
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		  
		limit = 10;
		maxPage = (int)((double)listCount/ limit + 0.9);
		  
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		endPage = startPage + 9 ;
		  
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		  
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		  
		startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		endRow = startRow + pi.getLimit() - 1;
		  
		pi.setStartRow(startRow);
		pi.setEndRow(endRow);
		  
		  //System.out.println("listCount : " + listCount);
		  //System.out.println("wt : " + wtype);
		  
		ArrayList<Message> receiveList = new MessageService().selectListMes(pi, wtype);
		  
		  //System.out.println("sendList : " + sendList);
		  
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		 
		/*ArrayList<Member> cnames = new ArrayList<Member>();
		for(int i = 0 ; i< receiveList.size() ; i++) {
			Member comp = new MessageService().selectCompanyOne(receiveList.get(i).getCno());
			System.out.println("comp : " + comp);
			cnames.add(comp);
		}
		  
		  
		  //System.out.println("cnames : " + cnames);
		  
		hmap.put("cnames", cnames);*/
		hmap.put("receiveList",receiveList);
		hmap.put("pi",pi);
		  
		  
		response.setContentType("application/json");
		new Gson().toJson(hmap, response.getWriter());
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

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
import com.kh.redding.message.model.service.MessageService;
import com.kh.redding.message.model.vo.Message;
import com.kh.redding.product.model.vo.PageInfo;

@WebServlet("/searchSendList.mes")
public class SearchSendMesListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SearchSendMesListServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cname = request.getParameter("cname");
		
		int wtype = 20;//수신

		int listCount;
		  
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		int startRow;
		int endRow;
		
		listCount = new MessageService().getListCountSearchMes(cname,wtype);
		  
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
		  
		ArrayList<Message> searchList = new MessageService().searchMesList(cname, wtype, pi);
		  
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		 
		hmap.put("sendList",searchList);
		hmap.put("pi",pi);
		  
		//System.out.println("hmap : " + hmap);
		
		response.setContentType("application/json");
		new Gson().toJson(hmap, response.getWriter());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

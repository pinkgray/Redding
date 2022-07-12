package com.kh.redding.notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;
import com.kh.redding.board.model.vo.Board;
import com.kh.redding.board.model.vo.BoardPageInfo;


@WebServlet("/selectFAQ.no")
public class SelectFAQServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SelectFAQServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 페이징 추가
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
			
		currentPage = 1;
			
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
			
		limit = 10;
			
		int allNoticeCount = new BoardService().getAllFAQListCount();
			
		maxPage = (int)((double) allNoticeCount / limit + 0.9);
			
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
			
		endPage = startPage + 10 - 1;
			
			
			
		if(maxPage < endPage) {
			endPage = maxPage;
		}
			
		BoardPageInfo pi = new BoardPageInfo(currentPage, limit, maxPage, startPage, endPage);
	
	
	
		ArrayList<Board> FAQList = new BoardService().selectFAQList(pi);
		
		String page = "";
		if (FAQList != null) {
			page =  "/views/notice/FAQ_main.jsp";
			
			request.setAttribute("FAQList", FAQList);
			request.setAttribute("pi", pi);
		}else {
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "공지사항 조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
			
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

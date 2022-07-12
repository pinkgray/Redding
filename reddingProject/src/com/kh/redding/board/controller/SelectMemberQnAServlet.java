package com.kh.redding.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.redding.board.model.service.BoardService;
import com.kh.redding.board.model.vo.BoardPageInfo;
import com.kh.redding.member.model.vo.Member;


@WebServlet("/selectQnA.no")
public class SelectMemberQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SelectMemberQnAServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSession session = request.getSession();
		
		//Member loginUser = (Member) session.getAttribute("loginUser"); 
		
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		//int mno = loginUser.getMno();
		
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
				
		int allNoticeCount = new BoardService().getQnACountSelect(mno);
				
		maxPage = (int)((double) allNoticeCount / limit + 0.9);
				
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
				
		endPage = startPage + 10 - 1;
				
				
				
		if(maxPage < endPage) {
			endPage = maxPage;
		}
				
		BoardPageInfo pi = new BoardPageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		
		ArrayList<HashMap<String, Object>> QnAList = new BoardService().selectQnAList(mno, pi);
		
		String page = "";
		if (QnAList != null) {
			
			page = "/views/notice/contact_list.jsp";
			
			request.setAttribute("QnAList", QnAList);
			request.setAttribute("pi", pi);
			
		}else {
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "문의 조회 실패");
		}
	
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

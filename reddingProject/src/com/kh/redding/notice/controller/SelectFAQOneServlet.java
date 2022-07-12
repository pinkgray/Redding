package com.kh.redding.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;
import com.kh.redding.board.model.vo.Board;


@WebServlet("/selectFAQone.no")
public class SelectFAQOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SelectFAQOneServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("num"));
		
		Board selectFAQ = new BoardService().selectNoticeOne(bid);
		
		String page = "";
		if (selectFAQ != null) {
			page = "/views/notice/FAQ_detail.jsp";
			
			request.setAttribute("selectFAQ", selectFAQ);
		}else {
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "공지사항 상세 조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

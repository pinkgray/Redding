package com.kh.redding.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;


@WebServlet("/insertFAQ.no")
public class InsertFAQServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public InsertFAQServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		int writer = Integer.parseInt(request.getParameter("writer"));
		
		
		int result = new BoardService().insertFAQ(noticeTitle, noticeContent , writer);
		
		String page = "";
		if (result > 0) {
			//page =  request.getContextPath() +"/selectnotice.no";
			page = request.getContextPath() +"/selectFAQ.no";
			
			response.sendRedirect(page);
		}else {
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "공지사항 등록 실패");
			
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

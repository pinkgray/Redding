package com.kh.redding.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;


@WebServlet("/deleteFAQ.no")
public class DeleteFAQServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteFAQServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("num"));
		
		int result = new BoardService().deleteNoticeOne(bid);
		
		String page = "";
		if (result > 0) {
			page = request.getContextPath() + "/selectFAQ.no";
			
			response.sendRedirect(page);
			
		}else {
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "공지사항 삭제 실패");
			
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

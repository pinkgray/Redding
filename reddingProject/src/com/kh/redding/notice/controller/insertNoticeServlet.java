package com.kh.redding.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;

/**
 * Servlet implementation class insertNoticeServlet
 */
@WebServlet("/insertNotice.no")
public class insertNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public insertNoticeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		int writer = Integer.parseInt(request.getParameter("writer"));
		
		System.out.println("writer : " + writer);
		
		int result = new BoardService().insertNotice(noticeTitle, noticeContent , writer);
		
		String page = "";
		if (result > 0) {
			page =  request.getContextPath() +"/selectnotice.no";
			
			response.sendRedirect(page);
		}else {
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "공지사항 등록 실패");
			
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

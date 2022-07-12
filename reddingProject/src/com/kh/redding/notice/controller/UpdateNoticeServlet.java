package com.kh.redding.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;


@WebServlet("/updateNotice.no")
public class UpdateNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public UpdateNoticeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		String btitle = request.getParameter("noticeTitle");
		String bcontent = request.getParameter("noticeContent");
		
		
		int result = new BoardService().UpdateNotice(bid, btitle , bcontent);
		
		String page = "";
		if (result > 0) {
			page = request.getContextPath() + "/selectnotice.no";
			
			response.sendRedirect(page);
			
		}else {
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "공지사항 업데이트 실패");
			
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

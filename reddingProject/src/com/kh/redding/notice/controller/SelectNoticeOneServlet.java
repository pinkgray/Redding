package com.kh.redding.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;
import com.kh.redding.board.model.vo.Board;


@WebServlet("/selectnoticeone.no")
public class SelectNoticeOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SelectNoticeOneServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("num"));
		
		Board notice = new BoardService().selectNoticeOne(bid);
		
		String page = "";
		if (notice != null) {
			page = "/views/notice/notice_detail.jsp";
			
			request.setAttribute("selectnotice", notice);
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

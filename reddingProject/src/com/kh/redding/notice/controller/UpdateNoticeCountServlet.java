package com.kh.redding.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;

@WebServlet("/updateNoticecnt.no")
public class UpdateNoticeCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateNoticeCountServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bid = Integer.parseInt(request.getParameter("bid"));
		
		int result = new BoardService().updateNoticeCount(bid);
	
		PrintWriter out = response.getWriter();
		
		out.append(result+"");
		
		out.flush();
		
		out.close();
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

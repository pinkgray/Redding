package com.kh.redding.board.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;


@WebServlet("/detail.bo")
public class SelectDetailBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SelectDetailBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("num"));
		
		HashMap<String , Object> b = new BoardService().boardDetail(bid);
		
		String page = "";
		if(b != null) {
			page = "views/board/boardDetail.jsp";
			request.setAttribute("b", b);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 목록 조회 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

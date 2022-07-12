package com.kh.redding.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;


@WebServlet("/likeBoard.bo")
public class UpdateBoardLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateBoardLikeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		
		int likecount = new BoardService().UpdateBoardLike(bid);
		
		PrintWriter out = response.getWriter();
		
		out.append(likecount + "");
		
		out.flush();
		
		out.close();
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

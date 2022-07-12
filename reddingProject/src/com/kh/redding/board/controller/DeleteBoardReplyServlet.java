package com.kh.redding.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;


@WebServlet("/delreply.bo")
public class DeleteBoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DeleteBoardReplyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int replycode = Integer.parseInt(request.getParameter("replycode"));
		
		int result = new BoardService().deleteBoardReply(replycode);
		
		PrintWriter out = response.getWriter();
		
		if (result > 0) {
			out.append("success");
		}else {
			out.append("fail");
		}
		
		out.flush();
		
		out.close();
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

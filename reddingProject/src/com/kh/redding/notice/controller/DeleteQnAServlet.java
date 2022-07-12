package com.kh.redding.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.redding.board.model.service.BoardService;
import com.kh.redding.member.model.vo.Member;


@WebServlet("/delteQnA.no")
public class DeleteQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteQnAServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSession session = request.getSession();
		
		//Member loginUser = (Member)request.getAttribute("loginUser");
		
		//System.out.println(loginUser);
		
		int bid = Integer.parseInt(request.getParameter("num"));
		
		int result = new BoardService().DeleteMemberQnA(bid);
		
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

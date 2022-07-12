package com.kh.redding.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;
import com.kh.redding.member.model.service.MemberService;

/**
 * Servlet implementation class MemberInsertComQnaReplyServlet
 */
@WebServlet("/insertComQnaReply.qr")
public class MemberInsertComQnaReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertComQnaReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		int mno = Integer.parseInt(request.getParameter("mno"));
		int bid = Integer.parseInt(request.getParameter("bid"));
		
		
		int result = new BoardService().insertQnAReply(bid,mno,content);
		
		String page = "";
		if (result > 0) {
			page = request.getContextPath()+"/selectComQnaDetail.qd?bid=" + bid;
			
			response.sendRedirect(page);
			
		}else {
			request.setAttribute("msg", "답변 작성에 오류가 발생했습니다.");
			
			page = "/views/common/errorPage.jsp";
			
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

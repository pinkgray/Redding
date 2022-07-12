package com.kh.redding.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;


@WebServlet("/insertReply.bo")
public class InsertBoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public InsertBoardReplyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String replyContent = request.getParameter("comment");
		int bid = Integer.parseInt(request.getParameter("bid"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		int result = new BoardService().insertQnAReply(bid,mno,replyContent);
		
		String page = "";
		if (result > 0) {
			page = request.getContextPath()+"/selectOne.bo?num=" + bid;
			
			response.sendRedirect(page);
			
		}else {
			request.setAttribute("msg", "답변 작성에 오류가 발생했습니다.");
			
			page = "/views/common/errorPage.jsp";
			
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

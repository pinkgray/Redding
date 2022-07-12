package com.kh.redding.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;


@WebServlet("/boardDel.bo")
public class DeleteBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("num"));
		
		int result = new BoardService().deleteBoard(bid);
		
		String page = "";
		if (result > 0) {
			page = request.getContextPath() + "/selectBoardList.bo";
			
			response.sendRedirect(page);
			
		}else {
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "공지사항 삭제 실패");
			
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

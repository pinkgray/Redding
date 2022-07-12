package com.kh.redding.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;


@WebServlet("/QnAinsert.no")
public class insertQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public insertQnAServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		String conTitle = request.getParameter("conTilte");
		String contact = request.getParameter("contact");
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		int result = new BoardService().insertQnA(mno,conTitle, contact, category);
		
		String page = "";
		if (result > 0) {
			
			System.out.println("mno :" + mno);
			
			page = request.getContextPath() + "/selectQnA.no?mno="+ mno;
			
			response.sendRedirect(page);
		}else {
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "문의 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package com.kh.redding.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.service.MemberService;

/**
 * Servlet implementation class MemberDeleteQnaServlet
 */
@WebServlet("/DeleteQna.dq")
public class MemberDeleteQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		int cno = Integer.parseInt(request.getParameter("cno"));
		//System.out.println("ddd" + bid);

		
		int result = new MemberService().deleteQna(bid);
		
		String page = "";
		if(result > 0) {
			page = request.getContextPath() + "/selectDetailComQna.cq?cno="+cno;
			
			response.sendRedirect(page);
		}else {
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "Qna 삭제 실패!");
			
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

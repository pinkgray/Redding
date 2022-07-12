package com.kh.redding.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.service.MemberService;


@WebServlet("/secession.me")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberid = request.getParameter("mid");
		
		int result = new MemberService().memberDelete(memberid);
		
		String page = "";
		if (result > 0) {
			page = request.getContextPath() + "/logout.me";
			
			response.sendRedirect(page);
			
		}else {
			
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "회원 탈퇴");
			
			request.getRequestDispatcher(page).forward(request, response);
			
		}
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

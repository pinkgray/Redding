package com.kh.redding.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.redding.member.model.service.MemberService;
import com.kh.redding.member.model.vo.Member;
 

@WebServlet("/login.me")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemberLoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		
		
		Member loginUser = new MemberService().loginCheck(memberId, memberPwd);
	
		String page = "";
		if(loginUser != null) {
			System.out.println("loginUser4(servlet) : " + loginUser);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			//if (loginUser.getMemberType() == 10) {	
				page = "index.jsp";
				
			//}else if (loginUser.getMemberType() == 20 ) {
				//page = request.getContextPath() +"/views/company/c_main.jsp";
				
			//}else if (loginUser.getMemberType() == 90) {
				//page = request.getContextPath() +"/views/admin/a_main.jsp";
			//}
			
			response.sendRedirect(page);
			
		}else {
			request.setAttribute("msg", "아이디와 비밀번호를 확인해주세요");
			request.getRequestDispatcher("views/common/login.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
		doGet(request, response);
	}

}

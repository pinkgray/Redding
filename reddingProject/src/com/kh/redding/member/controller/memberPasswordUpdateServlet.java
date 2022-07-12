package com.kh.redding.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.service.MemberService;


@WebServlet("/changePwd.me")
public class memberPasswordUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public memberPasswordUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String membrid = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		
		System.out.println("변경할 회원 :" + membrid);
		System.out.println("변경할 비밀번호 :" + memberPwd);
		
		int result = new MemberService().updateMemberPassword(membrid, memberPwd);
		
		System.out.println(result);
		
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
		doGet(request, response);
	}

}

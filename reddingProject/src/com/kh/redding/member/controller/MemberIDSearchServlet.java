package com.kh.redding.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.service.MemberService;


@WebServlet("/idSearch")
public class MemberIDSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemberIDSearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberid = request.getParameter("memberid");
		String email = request.getParameter("email");
		
		int result = new MemberService().MemberIdSearch(memberid, email);
		
		PrintWriter out = response.getWriter();
		
		
		if (result > 0) {
			out.append("있음");
		}else {
			out.append("없음");
		}
		
		out.flush();
		
		out.close();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

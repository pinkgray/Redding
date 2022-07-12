package com.kh.redding.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.service.MemberService;


@WebServlet("/idSelect")
public class MemberIdSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MemberIdSelectServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberid = request.getParameter("memberid");
		String email = request.getParameter("email");
		
		String memberId = new MemberService().SelectMemberId(memberid, email);
		
		PrintWriter out = response.getWriter();
		
	
		out.append(memberId);
			
		out.flush();
		
		out.close();
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

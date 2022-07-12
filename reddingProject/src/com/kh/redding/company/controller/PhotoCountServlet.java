package com.kh.redding.company.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.redding.company.model.service.CompanyService;
import com.kh.redding.member.model.vo.Member;


@WebServlet("/photo.co")
public class PhotoCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public PhotoCountServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int cno = loginUser.getMno();
		
		int count = new CompanyService().PhotoCount(cno);
		
		System.out.println(count);
		String Page = "";
		if (count <= 0) {
			Page = "/views/company/c_UpdateCompanyPhoto.jsp";
		}else {
			Page = "/selectPhoto.co";
		}
		
		request.getRequestDispatcher(Page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

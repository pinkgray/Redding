package com.kh.redding.company.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.redding.company.model.service.CompanyService;
import com.kh.redding.member.model.vo.Member;


@WebServlet("/selectcom.me")
public class SelectCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SelectCompanyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int mno = loginUser.getMno();
		
		//로그인한 업체 정보 가져오기 
		HashMap<String,Object> loginCompany = new CompanyService().selectCompanyInf(loginUser);
		
		String page = "";
		if (loginCompany != null) {
			page = "/views/company/c_UpdateCompanyInfor.jsp";
			
			request.setAttribute("loginCompany", loginCompany);	
		}else {
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "조회를 실패했습니다.");
		}
		
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

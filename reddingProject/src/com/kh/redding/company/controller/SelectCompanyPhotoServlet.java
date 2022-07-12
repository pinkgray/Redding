package com.kh.redding.company.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.company.model.service.CompanyService;
import com.kh.redding.member.model.vo.Member;


@WebServlet("/selectPhoto.co")
public class SelectCompanyPhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SelectCompanyPhotoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		ArrayList<Attachment> list = new CompanyService().selectCompanyPhoto(loginUser.getMno());
		
		String page = "";
		if (list != null) {
			page =  "/views/company/c_companyPhotoList.jsp";
			request.setAttribute("list", list);
		}else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "사진게시판 조회 실패!");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

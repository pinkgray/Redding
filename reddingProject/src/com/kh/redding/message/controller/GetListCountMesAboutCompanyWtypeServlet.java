package com.kh.redding.message.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.member.model.vo.Member;
import com.kh.redding.message.model.service.MessageService;
@WebServlet("/listCountComWtype.mes")
public class GetListCountMesAboutCompanyWtypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GetListCountMesAboutCompanyWtypeServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("업체쪽지 조회에서 wtype이 있는 listCount 서블릿");
		Member login = (Member)request.getSession().getAttribute("loginUser");
		int cno = login.getMno();
		
		int wt = Integer.parseInt(request.getParameter("wt"));
		
		
		HashMap<String, Object> hmap = new MessageService().getlistCountCompMesWtype(wt, cno);
		
		response.setContentType("application/json");
		new Gson().toJson(hmap, response.getWriter());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

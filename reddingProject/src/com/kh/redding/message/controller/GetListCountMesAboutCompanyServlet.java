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

@WebServlet("/listCountComp.mes")
public class GetListCountMesAboutCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GetListCountMesAboutCompanyServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("해당 업체가 가지고 있는 모든 쪽지의 listCount 조회 서블릿");
		Member login = (Member)request.getSession().getAttribute("loginUser");
		int cno = login.getMno();
		//System.out.println("cno : " + cno);
		
		
		HashMap<String, Object> hmap = new MessageService().getListCountCompMes(cno);
		
		response.setContentType("application/json");
		
		new Gson().toJson(hmap, response.getWriter());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

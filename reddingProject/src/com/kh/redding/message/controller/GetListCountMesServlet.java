package com.kh.redding.message.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.message.model.service.MessageService;

@WebServlet("/listCount.mes")
public class GetListCountMesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetListCountMesServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("관리자=메세지 상태마다 listCount 조회 서블릿");
		int wt = Integer.parseInt(request.getParameter("wt"));
		//System.out.println("wt : " + wt);
		HashMap<String, Object> hmap = new MessageService().selectListCount(wt);
		/*int condition = Integer.parseInt(request.getParameter("condition"));
		
		System.out.println("condition");*/
		
		//System.out.println("hmap : " + hmap);
		//System.out.println("hmap ck : " + hmap.get("CK_COUNT"));
		//System.out.println("hmap nock : " + hmap.get("NOCK_COUNT"));
		
		response.setContentType("application/json");
		
		new Gson().toJson(hmap, response.getWriter());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

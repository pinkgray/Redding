package com.kh.redding.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.message.model.service.MessageService;
import com.kh.redding.message.model.vo.Message;

@WebServlet("/adminOne.mes")
public class AdminMessageOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminMessageOneServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("업체가 관리자한테 보낸 쪽지 상세보기 서블릿");
		int code = Integer.parseInt(request.getParameter("code"));

		
		Message mes = new MessageService().selectMesOne(code);
		
		String page = "";
		
		if(mes != null) {
			page = "views/admin/a_selectMes.jsp";
			request.setAttribute("mes", mes);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "쪽지 상세보기에 실패하셨습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

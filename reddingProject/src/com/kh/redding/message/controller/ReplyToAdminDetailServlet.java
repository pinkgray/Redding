package com.kh.redding.message.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.message.model.service.MessageService;
import com.kh.redding.message.model.vo.Message;

@WebServlet("/replyToAdminDetail.mes")
public class ReplyToAdminDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ReplyToAdminDetailServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("관리자한테 답장하기 위해 상세보기 서블릿");
		int code = Integer.parseInt(request.getParameter("code"));
		
		Date ckDate = new Date(new GregorianCalendar().getTimeInMillis());
		
		int result = new MessageService().updateMesCDate(ckDate, code);
		
		Message mes = null;
		
		if(result>0) {
			mes = new MessageService().selectMesOne(code);
		}
		
		
		String page = "";
		
		if(mes != null) {
			page = "views/company/c_replyToAdminMessage.jsp";
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

package com.kh.redding.message.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.vo.Member;
import com.kh.redding.message.model.service.MessageService;
import com.kh.redding.message.model.vo.Message;

@WebServlet("/replyToAdmin.mes")
public class ReplyToAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ReplyToAdminServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("관리자한테 답장 보냄 서블릿");
		
		Member login = (Member) request.getSession().getAttribute("loginUser");
		
		int cno = login.getMno();
		
		int refcode = Integer.parseInt(request.getParameter("code"));
		//System.out.println("refcode : " + refcode);
		
		String content = request.getParameter("smContent");
		//System.out.println("content : " + content);
		
		Date disDate = new Date(new GregorianCalendar().getTimeInMillis());
		
		int wtype = 10;
		
		int level =2;
		
		
		Message mes = new Message();
		mes.setMesContent(content);
		mes.setMesDisDate(disDate);
		mes.setMesLevel(level);
		mes.setMesWType(wtype);
		mes.setMesRefCode(refcode);
		mes.setCno(cno);
		mes.setMname(login.getMemberName());
		
		int result = new MessageService().insertReplyMesToCompany(mes);
		
		String page = "";
		
		if(result>0) {
			page = "views/company/c_messageManager.jsp";
			response.sendRedirect(page);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "답장 보내는 것에 실패하셨습니다.");
			request.getRequestDispatcher(page).forward(request, response);
		}
			
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

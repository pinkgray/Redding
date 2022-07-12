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

@WebServlet("/replycomp.mes")
public class ReplyToCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReplyToCompanyServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("업체한테 답장 보내기 서블릿");
		
		int code = Integer.parseInt(request.getParameter("code"));
		//System.out.println("cno : " + cno);
		
		String mesContent = request.getParameter("smContent");
		//System.out.println("mesContent : " + mesContent);
		
		Message originalMes = new MessageService().selectMesOne(code);
		
		int wtype = 20;
		
		int level = 2;
		
		Message mes = new Message();
		mes.setMesContent(mesContent);
		mes.setMesDisDate(originalMes.getMesDisDate());
		mes.setCno(originalMes.getCno());
		mes.setMesLevel(level);
		mes.setMesWType(wtype);
		mes.setMname(originalMes.getMname());
		mes.setMesRefCode(code);
		
		//System.out.println("mes : " + mes);
		
		int result = new MessageService().insertReplyMesToCompany(mes);
		
		String page = "";
		
		if(result>0) {
			//System.out.println("쪽지 보내기는 성공");
			page = "views/admin/a_SendMessage.jsp";
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("mes", "쪽지 전송에 실패하셨습니다.");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

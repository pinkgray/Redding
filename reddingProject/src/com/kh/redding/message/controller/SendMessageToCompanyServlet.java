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

@WebServlet("/toCompany.mes")
public class SendMessageToCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendMessageToCompanyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("업체에게 쪽지 보내기 - 쪽지 insert 서블릿");
		
		int cno = Integer.parseInt(request.getParameter("smCno"));
		//System.out.println("cno : " + cno);
		
		String mesContent = request.getParameter("smContent");
		
		Date disDate = new Date(new GregorianCalendar().getTimeInMillis());
		
		Member comp = new MessageService().selectCompanyOne(cno);
		
		int wtype = 20;
		Message mes = new Message();
		mes.setMesContent(mesContent);
		mes.setMesDisDate(disDate);
		mes.setCno(cno);
		mes.setMesWType(wtype);
		mes.setMname(comp.getMemberName());
		
		//System.out.println("mes : " + mes);
		
		int result = new MessageService().insertMesToCompany(mes);
		
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

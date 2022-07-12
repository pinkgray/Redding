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

@WebServlet("/toAdmin.mes")
public class SendMessageToAdminServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public SendMessageToAdminServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //System.out.println("관리자에게 메세지 보내기-쪽지 insert 서블릿");
      Member loginUser = (Member)request.getSession().getAttribute("loginUser");
      int cno = loginUser.getMno();
      //System.out.println("cno : " + cno);
      
      String content = request.getParameter("messageContent");

      Date disDate = new Date(new GregorianCalendar().getTimeInMillis());
      
      int wtype = 10;
      
      Message mes = new Message();
      mes.setMesContent(content);
      mes.setMesDisDate(disDate);
      mes.setCno(cno);
      mes.setMesWType(wtype);
      mes.setMname(loginUser.getMemberName());
      
      int result = new MessageService().insertMesToCompany(mes);
      
      String page = "";
      
      if(result>0) {
    	  page = "views/company/c_messageManager.jsp";
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
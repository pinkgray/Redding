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

@WebServlet("/replyToCno.mes")
public class SelectCompanyNoForReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SelectCompanyNoForReplyServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  //System.out.println("쪽지-업체번호 조회 서블릿");
	      
	      int code = Integer.parseInt(request.getParameter("code"));
	      
	      /*Member company = new MessageService().selectCompanyOne(cno);
	      
	      System.out.println("company : " + company);*/
	      
	      int wtype=10;
	      
	      Date ckDate = new Date(new GregorianCalendar().getTimeInMillis());
	      
	      int result = new MessageService().updateMesCDate(ckDate, code);
	      
	      //System.out.println("result : " + result);
	      
	      Message mes = null;
	      
	      if(result>0) {
	    	  mes = new MessageService().selectMesOne(code);
	    	  
	    	  //System.out.println("mes : " + mes);
	      }	      
	      
	      String page = "";
	      
	      
	      if(mes != null) {
	    	  page = "views/admin/a_replyMessage.jsp";
	    	  request.setAttribute("mes", mes);
	    	  
	      }else {
	    	  page = "views/common/errorPage.jsp";
	    	  request.setAttribute("msg", "업체정보 조회를 실패하셨습니다.");
	    	  
	      }
	      request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

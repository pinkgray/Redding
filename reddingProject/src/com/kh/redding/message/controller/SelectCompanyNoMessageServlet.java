package com.kh.redding.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.vo.Member;
import com.kh.redding.message.model.service.MessageService;

@WebServlet("/getComNo.mes")
public class SelectCompanyNoMessageServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
    public SelectCompanyNoMessageServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //System.out.println("쪽지-업체번호 조회 서블릿");
      
      int cno = Integer.parseInt(request.getParameter("cno"));
      
      Member company = new MessageService().selectCompanyOne(cno);
      
      //System.out.println("company : " + company);
      
      String page = "";
      
      
      if(company != null) {
    	  page = "views/admin/a_insertMessage.jsp";
    	  request.setAttribute("company", company);
    	  
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
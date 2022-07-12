package com.kh.redding.message.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.message.model.service.MessageService;

@WebServlet("/deleteComMes")
public class CompanyDeleteMesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CompanyDeleteMesServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("삭제 서블릿");
		String checked = request.getParameter("checked");
		//System.out.println("checked : " + checked);
		
		
		String[] srr = null;
		int[] codes = null;
		int result = 0;
		srr = checked.split(",");
		
		codes = new int[srr.length];
		
		for(int i=0 ; i<srr.length ; i++) {
			//System.out.println("srr["+i+"] : " + srr[i]);
			codes[i] = Integer.parseInt(srr[i]);
			
			result = new MessageService().deleteCompMes(codes[i]);
		}
			
		
		String page = "";
		
		if(result>0) {
			page = "views/company/c_messageManager.jsp";
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "쪽지 삭제에 실패하셨습니다.");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

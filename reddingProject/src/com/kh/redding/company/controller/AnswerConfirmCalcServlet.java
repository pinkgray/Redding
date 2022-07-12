package com.kh.redding.company.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.admin.model.sevice.AdminService;
import com.kh.redding.company.model.service.CompanyService;

/**
 * Servlet implementation class AnswerConfirmCalcServlet
 */
@WebServlet("/answerCalc.co")
public class AnswerConfirmCalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerConfirmCalcServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int calccode = Integer.parseInt(request.getParameter("calccode"));
		int result = 0;
		
		result = new CompanyService().answerCalc(calccode);
		
		if(result>0) {
			response.getWriter().print(result);
		}
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

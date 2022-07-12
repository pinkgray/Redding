package com.kh.redding.company.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.company.model.service.CompanyService;
import com.kh.redding.wishlist.model.service.WishListService;

/**
 * Servlet implementation class ShowMonthCalcServlet
 */
@WebServlet("/showMonCalc.co")
public class ShowMonthCalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowMonthCalcServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mno"));

		ArrayList<HashMap<String,Object>> list= new CompanyService().showMonCalc(mno);

		String page = "";
		if(list != null) {
			page = "views/company/c_calculateManager.jsp";
			request.setAttribute("list", list);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "업체 정산 조회일이 아닙니다!");
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

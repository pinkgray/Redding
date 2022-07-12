package com.kh.redding.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.admin.model.sevice.AdminService;
import com.kh.redding.wishlist.model.service.WishListService;

/**
 * Servlet implementation class ConfirmComCalcServlet
 */
@WebServlet("/confirmComCalc.ad")
public class ConfirmComCalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmComCalcServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		int price = Integer.parseInt(request.getParameter("price"));
		int result = 0;
		int count = 0;
		
		count = new AdminService().countEqualCalc(cno, price);
		
		if(count != 1) {
			result = new AdminService().confirmComCalc(cno, price);
		}
		
		
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

package com.kh.redding.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.admin.model.sevice.AdminService;

/**
 * Servlet implementation class AdminRefundServlet
 */
@WebServlet("/adminRefund.ad")
public class AdminRefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRefundServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int payno = Integer.parseInt(request.getParameter("payno"));
    	int mno = Integer.parseInt(request.getParameter("mno"));
    	int upno = Integer.parseInt(request.getParameter("upno"));
    	String pselect = request.getParameter("pselect");
    	int fprice = Integer.parseInt(request.getParameter("fprice"));
    	String cardcode = request.getParameter("cardcode");
    	
    	
    	int updateRe = 0;
    	int insertRe = 0;
    	
    	updateRe = new AdminService().adminRefundUpdate(payno);

    	if(updateRe == 1) {
    		insertRe = new AdminService().adminRefundInsert(payno, mno, upno, pselect, fprice, cardcode);
    		
    		if(insertRe == 1) {
    			
    			response.getWriter().print(insertRe);
    		}
    		
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

package com.kh.redding.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.service.MemberService;

/**
 * Servlet implementation class MemberPaymentServlet
 */
@WebServlet("/payment.me")
public class MemberPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] upno = request.getParameter("upnoArr").split(",");
		int mno = Integer.parseInt(request.getParameter("mno"));
		int[] upnoArr = new int[upno.length];
		for(int i=0; i<upno.length; i++) {
			upnoArr[i] = Integer.parseInt(upno[i]);
		}
		
		ArrayList<HashMap<String, Object>> list = new MemberService().getPayment(mno,upnoArr);
		System.out.println("Servlet list : " + list);
		String page = "";
		
		if(list != null) {
			page = "views/member/m_pay.jsp";
			request.setAttribute("list", list);			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "결제 페이지로 이동 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

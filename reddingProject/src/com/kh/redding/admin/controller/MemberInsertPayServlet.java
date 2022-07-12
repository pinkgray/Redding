package com.kh.redding.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.member.model.service.MemberService;

/**
 * Servlet implementation class MemberInsertPayServlet
 */
@WebServlet("/insertPay.me")
public class MemberInsertPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mno"));
		String money = request.getParameter("money");
		String upno = request.getParameter("upno");
		String rspUid = request.getParameter("rspUid");
		String rspApply = request.getParameter("rspAppley");
		int couponCode = 0;
		if(request.getParameter("couponCode") != "") {
			couponCode = Integer.parseInt(request.getParameter("couponCode"));
		}else {
			couponCode = 0;
		}
		
		
		String[] upnoArr = upno.split(",");
		String[] moneyArr = money.split(",");
				
		System.out.println("mno : " + mno);
		System.out.println("money : " + money);
		System.out.println("upno : " + upno);
		System.out.println("rspUid : " + rspUid);
		System.out.println("rspAppley : " + rspApply);
		System.out.println("couponCode : " + couponCode);
		
		
		
		int result = new MemberService().memberInsertPay(mno,upnoArr,moneyArr,rspUid,rspApply,couponCode);
		
		response.setContentType("application/json");
		new Gson().toJson(result,response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

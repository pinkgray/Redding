package com.kh.redding.coupon.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.coupon.model.service.CouponService;

@WebServlet("/selectAvailableCouponList.me")
public class SelectAvailableCouponListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectAvailableCouponListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//int result =  new CouponService().updateCouponListN(); // 종료날짜 지나면 쿠폰 상태 기간만료로 변경
		
		String mno = request.getParameter("mno");
		
		ArrayList<HashMap<String, Object>> list = new CouponService().selectAvailableCouponList(mno);
		
		response.setContentType("application/json");
		new Gson().toJson(list, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

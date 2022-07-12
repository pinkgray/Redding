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

import com.kh.redding.admin.model.sevice.AdminService;
import com.kh.redding.coupon.model.service.CouponService;

@WebServlet("/selectCouponList.ad")
public class SelectCouponListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectCouponListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int result =  new CouponService().updateCouponListN(); // 종료날짜 지나면 쿠폰 상태 N으로 변경
		
		ArrayList<HashMap<String, Object>> list = new CouponService().selectCouponList();
		
		
		String page = "";
		if(list != null) {
			page = "views/admin/a_event.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "쿠폰 리스트 조회 실패!");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package com.kh.redding.coupon.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.redding.coupon.model.service.CouponService;

@WebServlet("/insertCoupon.me")
public class InsertCouponIntoMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertCouponIntoMemberServlet() {
        super();
    }

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String couponCode = request.getParameter("couponCode");
		String mno = request.getParameter("mno");
				
		//System.out.println(couponCode);
		//System.out.println(mno);
		
		
		ArrayList<HashMap<String, Object>> list = new CouponService().checkInsertCouponIntoMember(couponCode, mno);
		
		JSONArray jList = new JSONArray();
		JSONObject jObj = null;
		
		for(int i = 0; i < list.size(); i++) {
			jObj = new JSONObject();
			HashMap<String, Object> hlist = list.get(i);
			
			jObj.put("result2", hlist.get("result2"));
			jObj.put("couponCode", hlist.get("couponCode"));
			
			jList.add(jObj);
			
		}
		
		int result2 = (int) jObj.get("result2");
		System.out.println("result2 : " + result2);
	
		if(result2 > 0) {
			int result = new CouponService().insertCouponIntoMember(couponCode, mno);
			response.setContentType("application/json");
			new Gson().toJson(jList, response.getWriter());
		}else {
			System.out.println("이미 발급이 완료된 쿠폰입니다.");
			response.setContentType("application/json");
			new Gson().toJson(jList, response.getWriter());
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

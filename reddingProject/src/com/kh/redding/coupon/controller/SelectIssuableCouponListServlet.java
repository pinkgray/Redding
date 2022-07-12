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
import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.company.model.vo.Company;
import com.kh.redding.coupon.model.service.CouponService;
import com.kh.redding.coupon.model.vo.Coupon;
import com.kh.redding.member.model.vo.Member;

@WebServlet("/selectIssuableCouponList.me")
public class SelectIssuableCouponListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectIssuableCouponListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mno = request.getParameter("mno");
		
		ArrayList<HashMap<String, Object>> list = new CouponService().selectIssuableCouponList(mno);
				
		JSONArray issuableCouponList = new JSONArray();
		JSONObject issuableCouponObj = null;
		
		for(int i = 0; i < list.size(); i++) {
			issuableCouponObj = new JSONObject();
			HashMap<String, Object> hlist = list.get(i);
			
			issuableCouponObj.put("couponCode", hlist.get("couponCode"));
			issuableCouponObj.put("couponName", hlist.get("couponName"));
			issuableCouponObj.put("couponDescrition", hlist.get("couponDescrition"));
			issuableCouponObj.put("couponCategory", hlist.get("couponCategory"));
			issuableCouponObj.put("discountType", hlist.get("discountType"));
			issuableCouponObj.put("discountRate", hlist.get("discountRate"));
			issuableCouponObj.put("discountAmount", hlist.get("discountAmount"));
			issuableCouponObj.put("couponStartDate", hlist.get("couponStartDate"));
			issuableCouponObj.put("couponEndDate", hlist.get("couponEndDate"));
			issuableCouponObj.put("couponStatus", hlist.get("couponStatus"));
			
			issuableCouponObj.put("originName", hlist.get("originName"));
			issuableCouponObj.put("changeName", hlist.get("changeName"));
			issuableCouponObj.put("filePath", hlist.get("filePath"));
			
			issuableCouponList.add(issuableCouponObj);
		}
					
		response.setContentType("application/json");
		new Gson().toJson(issuableCouponList, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

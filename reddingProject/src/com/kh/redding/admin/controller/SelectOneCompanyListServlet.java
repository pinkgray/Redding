package com.kh.redding.admin.controller;

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
import com.kh.redding.admin.model.sevice.AdminService;
import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.vo.Member;

@WebServlet("/selectOneCompany.ad")
public class SelectOneCompanyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectOneCompanyListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		ArrayList<HashMap<String, Object>> oneCompany = new AdminService().selectOneCompany2(num);
		JSONArray result = new JSONArray();
		
		JSONObject oneCompanyObj = null;
		
		for(int i = 0; i < oneCompany.size(); i++) {
			oneCompanyObj = new JSONObject();
			HashMap<String, Object> hlist = oneCompany.get(i);
			Member member = (Member) hlist.get("member");
			Company company = (Company) hlist.get("company");
			
			oneCompanyObj.put("memberId", member.getMemberId());
			oneCompanyObj.put("repName", company.getRepName());
			oneCompanyObj.put("comType", company.getComType());
			oneCompanyObj.put("memberName", member.getMemberName());
			oneCompanyObj.put("memberEmail", member.getEmail());
			oneCompanyObj.put("memberPhone", member.getPhone());
			oneCompanyObj.put("companyAddress", company.getComAddress());
			oneCompanyObj.put("companyUrl", company.getComUrl());
			oneCompanyObj.put("companyOpenTime", company.getOpenTime());
			oneCompanyObj.put("companyCloseTime", company.getEndTime());
			oneCompanyObj.put("companyBank", company.getAccountName());
			oneCompanyObj.put("companyBankNum", company.getAccountNum());
			oneCompanyObj.put("companyHoliday", company.getHoliday());
			oneCompanyObj.put("memberEnrollDate", member.getEnrollDate());
			oneCompanyObj.put("memberStatus", member.getStatus());
			oneCompanyObj.put("memberOutDate", member.getOutDate());
			
			result.add(oneCompanyObj);
		}
			
		
		response.setContentType("application/json");
		new Gson().toJson(result, response.getWriter());		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

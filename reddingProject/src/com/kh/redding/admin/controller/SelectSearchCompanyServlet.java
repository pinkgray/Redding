package com.kh.redding.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.admin.model.sevice.AdminService;
import com.kh.redding.admin.model.vo.TotalMemberPageInfo;
import com.kh.redding.common.MakeQuery;

@WebServlet("/searchCompany.ad")
public class SelectSearchCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectSearchCompanyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] searchCondition = request.getParameterValues("searchCondition");
		String companyName = searchCondition[0];
		String companyCategory = searchCondition[1];
		String companyEnrollDate = searchCondition[2];
		String companyStatus = searchCondition[3];
		String firstDate = searchCondition[4];
		String lastDate = searchCondition[5];
						
		ArrayList searchConditionList = new ArrayList();
		searchConditionList.add(companyName);
		searchConditionList.add(companyCategory);
		searchConditionList.add(companyEnrollDate);
		searchConditionList.add(companyStatus);
		searchConditionList.add(firstDate);
		searchConditionList.add(lastDate);
		
		System.out.println("업체searchConditionList서블릿 : " + searchConditionList);
						
		new MakeQuery().makeSearchCompanyListQuery(searchConditionList); 
		
		ArrayList<HashMap<String,Object>> searchCompanyList = new AdminService().searchCompanyList(searchConditionList);
		
		response.setContentType("application/json");
		new Gson().toJson(searchCompanyList, response.getWriter());
		
		/*// 페이징 추가
		int currentPage;
		int limit;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		//ArrayList<HashMap<String, Object>> list = new AdminService().searchCompanyCount();
		ArrayList<HashMap<String,Object>> searchCompanyList = new AdminService().searchCompanyList(pi, searchConditionList);
		System.out.println("searchCompany서블릿 : " + searchCompanyList);
		
		maxPage = (int)((double) searchCompanyList.size() / limit + 0.9);
		
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1; 
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		TotalMemberPageInfo pi = new TotalMemberPageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		//ArrayList<HashMap<String,Object>> searchCompanyList = new AdminService().searchCompanyList();
		
		new MakeQuery().makeSearchCompanyListQuery(searchConditionList); 
		
		if(searchCompanyList != null) {
			response.setContentType("application/json");
			new Gson().toJson(searchCompanyList, response.getWriter());
		}*/
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

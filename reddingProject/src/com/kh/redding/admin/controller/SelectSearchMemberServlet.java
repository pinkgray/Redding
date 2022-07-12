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
import com.kh.redding.common.MakeQuery;

@WebServlet("/searchMember.ad")
public class SelectSearchMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectSearchMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] searchCondition = request.getParameterValues("searchCondition");
		
		String memberInfoSelect = searchCondition[0];
		String memberInfoInput = searchCondition[1];
		String memberEnrollDate = searchCondition[2];
		String efirstDate = searchCondition[3];
		String elastDate = searchCondition[4];
		String memberWeddingDate = searchCondition[5];
		String wfirstDate = searchCondition[6];
		String wlastDate = searchCondition[7];
		String memberStatus = searchCondition[8];
		
		ArrayList searchConditionList = new ArrayList();

		searchConditionList.add(memberInfoSelect);
		searchConditionList.add(memberInfoInput);
		searchConditionList.add(memberEnrollDate);
		searchConditionList.add(efirstDate);
		searchConditionList.add(efirstDate);
		searchConditionList.add(memberWeddingDate);
		searchConditionList.add(wfirstDate);
		searchConditionList.add(wlastDate);
		searchConditionList.add(memberStatus);
		
		System.out.println("멤버searchConditionList서블릿 : " + searchConditionList);

		new MakeQuery().makeSearchMemberListQuery(searchConditionList);
		
		ArrayList<HashMap<String,Object>> searchMemberList = new AdminService().searchMemberList(searchConditionList);
		
		response.setContentType("application/json");
		new Gson().toJson(searchMemberList, response.getWriter());
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

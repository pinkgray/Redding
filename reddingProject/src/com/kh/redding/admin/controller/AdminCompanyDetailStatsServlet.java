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

/**
 * Servlet implementation class AdminCompanyDetailStatsServlet
 */
@WebServlet("/companyDetailStats.ad")
public class AdminCompanyDetailStatsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCompanyDetailStatsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		int value = Integer.parseInt(request.getParameter("value"));
		
		new MakeQuery().CompanyDetailStats(value,startDate,endDate);
		
		ArrayList<HashMap<String, Object>> list = new AdminService().CompanyDetailStats(value);
		
		response.setContentType("application/json");
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

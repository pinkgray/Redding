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
 * Servlet implementation class AdminGetGenderCountServlet
 */
@WebServlet("/getGenderCount.ad")
public class AdminGetGenderCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminGetGenderCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int value = Integer.parseInt(request.getParameter("value"));
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		if(value == 30 || value == 40 || value == 50) {
			new MakeQuery().makeStatsQuery(value, startDate, endDate);
		}
		
		
		
		ArrayList<HashMap<String, Object>> list = new AdminService().getGenderCount(value);
		
				
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

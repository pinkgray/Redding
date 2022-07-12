package com.kh.redding.admin.controller;
 
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.admin.model.sevice.AdminService;
import com.kh.redding.admin.model.vo.TotalMemberPageInfo;

@WebServlet("/selectList.co")
public class SelectCompanyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectCompanyListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징 추가
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int allCompanyListCount = new AdminService().getAllCompanyListCount();
		int newCompanyListCount = new AdminService().getNewCompanyCount();
		int withdrawalCompanyListCount = new AdminService().getWithdrawalCompanyListCount();
		//System.out.println("allCompanyListCount : " + allCompanyListCount);
		maxPage = (int)((double) allCompanyListCount / limit + 0.9);
		
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		TotalMemberPageInfo pi = new TotalMemberPageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		ArrayList<HashMap<String,Object>> list = new AdminService().selectCompanyList(pi);
		
		String page = "";
		if(list != null) {
			page = "views/admin/a_Company.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("allCompanyListCount", allCompanyListCount);
			request.setAttribute("newCompanyListCount", newCompanyListCount);
			request.setAttribute("withdrawalCompanyListCount", withdrawalCompanyListCount);
			
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "전체 업체 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

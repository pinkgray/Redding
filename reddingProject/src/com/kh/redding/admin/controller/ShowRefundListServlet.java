package com.kh.redding.admin.controller;

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
import com.kh.redding.admin.model.vo.TotalMemberPageInfo;

/**
 * Servlet implementation class ShowRefundListServlet
 */
@WebServlet("/showRefund.ad")
public class ShowRefundListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowRefundListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//페이징 추가
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
				
				int calcCount = new AdminService().getRefundCount();
				
				maxPage = (int)((double) calcCount / limit + 0.9);
				
				startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
				
				endPage = startPage + 10 - 1;
				
				
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				TotalMemberPageInfo pi = new TotalMemberPageInfo(currentPage, limit, maxPage, startPage, endPage);
				
				
				ArrayList<HashMap<String, Object>> list = new AdminService().showMemberRefund(pi);
				
				String page = "";
				if(list != null ) {
					page = "views/admin/a_calculateRefund.jsp";
					request.setAttribute("list", list);
					request.setAttribute("pi", pi);
				}else {
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "회원 환불 목록 조회 실패!");
				}
				
				RequestDispatcher view = request.getRequestDispatcher(page);
				view.forward(request, response);
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

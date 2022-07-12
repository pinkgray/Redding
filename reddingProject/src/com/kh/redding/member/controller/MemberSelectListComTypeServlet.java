package com.kh.redding.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.kh.redding.member.model.service.MemberService;
import com.kh.redding.member.model.vo.M_comListPageInfo;

/**
 * Servlet implementation class MemberSelectListComTypeServlet
 */
@WebServlet("/listcomtype.mb")
public class MemberSelectListComTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelectListComTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comType = request.getParameter("comType");
		System.out.println("dd : " + comType);
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
		
		int listCount = new MemberService().getListCount(comType);
		
		System.out.println("listCount : " + listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		M_comListPageInfo clpi = new M_comListPageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		ArrayList<HashMap<String, Object>> list = new MemberService().selectComList(clpi, comType);
		System.out.println(comType);
		
		String page = "";
		if(list != null) {
			page = "views/member/m_comList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("clpi", clpi);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "업체 목록 조회 실패");
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

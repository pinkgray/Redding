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
import com.kh.redding.member.model.vo.M_ComQnaListPageInfo;

/**
 * Servlet implementation class MemberSelectComReviewListServlet
 */
@WebServlet("/selectComReviewList.rl")
public class MemberSelectComReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelectComReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		
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
		
		int listCount = new MemberService().getQnaListCount(cno);
		
		maxPage = (int)((double) listCount / limit + 0.9);
		
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		M_ComQnaListPageInfo cqlpi = new M_ComQnaListPageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		ArrayList<HashMap<String, Object>> blist = new MemberService().selectDetailComQna(cqlpi, cno);
		ArrayList<HashMap<String, Object>> rlist = new MemberService().selectComReviewList(cqlpi, cno);
		
		System.out.println(cno);
		System.out.println("rlistSevlet :" + rlist);
		System.out.println(currentPage);
		
		String page = "";
		if(rlist != null) {
			page = "views/member/m_ComReviewList.jsp";
			request.setAttribute("rlist", rlist);
			request.setAttribute("blist", blist);
			request.setAttribute("cqlpi", cqlpi);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "업체 리뷰 목록 조회 실패!");
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

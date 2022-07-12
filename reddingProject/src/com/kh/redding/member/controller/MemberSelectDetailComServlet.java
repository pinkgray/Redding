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
import com.kh.redding.member.model.vo.Member;

/**
 * Servlet implementation class MemberSelectDetailComServlet
 */
@WebServlet("/selectDetailCom.dc")
public class MemberSelectDetailComServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelectDetailComServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		System.out.println("뭐지:" + request.getParameter("cno"));
		
		HashMap<String, Object> list = new MemberService().selectDetailCom(cno);
		
		System.out.println("list : " + list);
		
		String page = "";
		if(list != null) {
			page = "views/member/m_Detail.jsp";
			request.setAttribute("list", list);
			request.getSession().setAttribute("cno", cno);
			System.out.println("전달");
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

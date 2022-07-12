package com.kh.redding.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.vo.Board;
import com.kh.redding.member.model.service.MemberService;

/**
 * Servlet implementation class MemberSelectComQnaDetailServlet
 */
@WebServlet("/selectComQnaDetail.qd")
public class MemberSelectComQnaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelectComQnaDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		//System.out.println("bid넘어오냐 : " + bid);
		
		ArrayList<HashMap<String, Object>> ComQnaDetail = new MemberService().SelectComQnaDetail(bid);
		
		//Board b = new MemberService().selectComQnaDetail(bid);
		
		String page = "";
		if(ComQnaDetail != null) {
			page = "views/member/m_ComQnaDetailSelect.jsp";
			request.setAttribute("ComQnaDetail", ComQnaDetail);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 상세 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

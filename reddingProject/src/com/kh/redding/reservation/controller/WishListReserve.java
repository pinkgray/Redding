package com.kh.redding.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.vo.Member;
import com.kh.redding.reservation.model.service.ReservationService;

/**
 * Servlet implementation class WishListReserve
 */
@WebServlet("/wishList.re")
public class WishListReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishListReserve() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int userNum = loginUser.getMno();
		
		String[] splitList = request.getParameter("reserveList").split(",");
		int [] resList = new int[splitList.length];
		
		for(int i=0; i<resList.length; i++) {
			resList[i] = Integer.parseInt(splitList[i]);
		}
		
		ArrayList<HashMap<String, Object>> list = new ReservationService().reserveWishList(userNum, resList);
		
		String page="";
		if(list != null) {
			page = "views/member/m_reservation.jsp";
			request.setAttribute("list", list);
			
			//System.out.println("예약 서블릿: " + list);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "예약 조회 실패!");
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

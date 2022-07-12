package com.kh.redding.wishlist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.vo.Member;
import com.kh.redding.wishlist.model.service.WishListService;

/**
 * Servlet implementation class DeleteWishList
 */
@WebServlet("/delete.wi")
public class DeleteWishList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteWishList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		//세션으로 로그인 유저 정보 받아오기
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int userNum = loginUser.getMno();

		//String배열로 넘어온 걸 ,로 쪼개기
		if(!request.getParameter("deleteList").equals("")) {
			String[] list = request.getParameter("deleteList").split(",");

			//int배열 생성
			int[] deleteList = new int[list.length];

			for(int i=0; i<list.length; i++) {
				deleteList[i] = Integer.parseInt(list[i]);
			}

			result = new WishListService().deleteWishList(deleteList, userNum);
			
			
			String page = "";
			if(result>0) {
				response.sendRedirect("/redding/showList.wi?num="+userNum);
			}else {
				request.setAttribute("msg", "위시리스트 삭제 실패!");
				request.getRequestDispatcher(page).forward(request, response);
			}
		}else {
			response.sendRedirect("/redding/showList.wi?num="+userNum);
		}



	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

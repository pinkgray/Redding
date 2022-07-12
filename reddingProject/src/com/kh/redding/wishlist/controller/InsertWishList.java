package com.kh.redding.wishlist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.redding.member.model.vo.Member;
import com.kh.redding.wishlist.model.service.WishListService;

/**
 * Servlet implementation class InsertWishList
 */
@WebServlet("/insert.wi")
public class InsertWishList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertWishList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");*/
		
		
		int mno = Integer.parseInt(request.getParameter("mno"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		int result = 0;
		int count = 0;
		
		count = new WishListService().countEqualWishList(mno, pno);
		
		System.out.println("카운트" + count);
		
		if(count != 1) {
			result = new WishListService(). insertWishList(mno, pno);
		}
		
		
		System.out.println("result" + result);

		if(result>0) {
			response.getWriter().print(result);
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

package com.kh.redding.notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;


@WebServlet("/QnAOne.no")
public class SelectQnAOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SelectQnAOneServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bid = Integer.parseInt(request.getParameter("no"));
		
		System.out.println(bid);
		
		ArrayList<HashMap<String , Object>> QnADetail = new BoardService().SelectQnAOneDetail(bid);

		String page = "";
		if (QnADetail != null) {
			page = "/views/admin/a_MemberInquiryDetail.jsp";
			
			request.setAttribute("QnADetail", QnADetail);
			
		}else {
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "문의 상세 오류");
			
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

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
import com.kh.redding.board.model.vo.BoardPageInfo;


@WebServlet("/QnAProgress.no")
public class MemberQnAProgressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberQnAProgressServlet() {
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
						
				int allNoticeCount = new BoardService().getQnAAllCountSelect();
				int completeCount = new BoardService().getQnACompleteSelect();
						
				maxPage = (int)((double) allNoticeCount / limit + 0.9);
						
				startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
						
				endPage = startPage + 10 - 1;
						
						
						
				if(maxPage < endPage) {
					endPage = maxPage;
				}
						
				BoardPageInfo pi = new BoardPageInfo(currentPage, limit, maxPage, startPage, endPage);
				
				
				ArrayList<HashMap<String, Object>> QnAList = new BoardService().selectQnAProgress(pi);
				
				String page = "";
				if (QnAList != null) {
					
					page = "/views/admin/a_MemberInquiry.jsp";
					
					request.setAttribute("QnAList", QnAList);
					request.setAttribute("pi", pi);
					request.setAttribute("Allcount", allNoticeCount);
					request.setAttribute("CompleteCount", completeCount);
					
				}else {
					page = "/views/common/errorPage.jsp";
					
					request.setAttribute("msg", "문의 조회 실패");
				}
			
				request.getRequestDispatcher(page).forward(request, response);
		
		
		
		
	}

	/**
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.kh.redding.notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.admin.model.sevice.AdminService;
import com.kh.redding.board.model.service.BoardService;
import com.kh.redding.board.model.vo.BoardPageInfo;


@WebServlet("/selectnotice.no")
public class SelectNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectNoticeServlet() {
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
				
				int allNoticeCount = new BoardService().getAllNoticeListCount();
				//int newMemberlistCount = new AdminService().getNewListCount();
				//int withdrawalMemberlistCount = new AdminService().getWithdrawalListCount();
				
				maxPage = (int)((double) allNoticeCount / limit + 0.9);
				
				startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
				
				endPage = startPage + 10 - 1;
				
				
				
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
			BoardPageInfo pi = new BoardPageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		
		
			ArrayList<HashMap<String , Object>> NoticeList = new BoardService().selectNotice(pi);
			
			String page = "";
			if (NoticeList != null) {
				page =  "/views/notice/notice_main.jsp";
				
				request.setAttribute("NoticeList", NoticeList);
				request.setAttribute("pi", pi);
			}else {
				page = "/views/common/errorPage.jsp";
				
				request.setAttribute("msg", "공지사항 조회 실패");
			}
			
			request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

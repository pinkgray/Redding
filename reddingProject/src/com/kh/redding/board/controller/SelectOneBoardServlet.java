package com.kh.redding.board.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;
import com.kh.redding.board.model.vo.BoardPageInfo;


@WebServlet("/selectOne.bo")
public class SelectOneBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public SelectOneBoardServlet() {
		super();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));

		int currentPage;		//현재 페이지를 표시할 변수
		int limit;				//한 페이지에서 게시글이 몇 개 보여질 것인지 표시
		int maxPage;			//전체 페이지에서 가장 마지막 페이지
		int startPage;			//한번에 표시될 페이지가 시작할 페이지
		int endPage;			//한번에 표시될 페이지가 끝나는 페이지
		
		//페이지 수 처리용 변수
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//한 페이지에 보여질 목록 갯수
		limit = 10;
		
		//전체 목록 갯수 리턴
		int listCount = new BoardService().getReplyCount(num);
		
		System.out.println("listCount : " + listCount);
		
		//총 페이지수 계산
		maxPage = (int)((double)listCount / limit + 0.9);
		
		//현재 페이지에 보여줄 시작 페이지 수
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		
		//목록 아래쪽에 보여질 마지막 페이지 수
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		//페이지 정보를 공유할 vo 객체 생성
		BoardPageInfo pi = new BoardPageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		
		
		HashMap<String , Object> b = new BoardService().selectOne(num, pi);

		String page = "";
		if(b != null) {
			page = "views/board/boardLook.jsp";
			request.setAttribute("b", b);
			request.setAttribute("pi", pi);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세 보기 실패!");
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

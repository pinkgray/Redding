package com.kh.redding.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.board.model.vo.BoardPageInfo;
import com.kh.redding.common.MakeQuery;
import com.kh.redding.member.model.service.MemberService;
import com.kh.redding.product.model.vo.PageInfo;

/**
 * Servlet implementation class MemberReservationSelectServlert
 */
@WebServlet("/revSelect.me")
public class MemberReservationSelectServlert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReservationSelectServlert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int value = Integer.parseInt(request.getParameter("value"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		String firstDate = request.getParameter("firstDate");
		String lastDate = request.getParameter("lastDate");
		
		int currentPage;		//현재 페이지를 표시할 변수
		int limit;				//한 페이지에 게시글이 몇 개 보여질 것인지 표시
		int maxPage = 0;		//전체 페이지에서 가장 마지막 페이지
		int startPage;			//한번에 표시된 페이지가 시작할 페이지
		int endPage;			//한 번에 표시될 페이지가 끝나는 페이지
		
		//페이지 수 처리용 변수
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//한 페이지에 보여질 목록 갯수
		limit = 10;
		
		//전체 목록 갯수 리턴
		HashMap<String, Object> hmap= new MemberService().selectCount(mno);
		
		
		if(value == 10) {
			maxPage = (int)((double)Integer.parseInt(hmap.get("resWait").toString()) / limit + 0.9);
		}else if(value == 20) {
			maxPage = (int)((double)Integer.parseInt(hmap.get("payWait").toString()) / limit + 0.9);
		}else if(value == 30) {
			maxPage = (int)((double)Integer.parseInt(hmap.get("payFinal").toString()) / limit + 0.9);
		}else if(value == 40 || value == 50 || value == 60) {
			new MakeQuery().makeQueryCount(firstDate, lastDate,value,mno);
			int listCount = new MemberService().getCountList(value);
			maxPage = (int)((double)listCount / limit + 0.9);
			System.out.println("lc : " + listCount);
		}
		//총 페이지 수 계산
		
		
		//현재 페이지에 보여줄 시작 페이지 수
		//10개씩 보여주게 할 경우
		//1, 11, 21, 31...
		startPage = (((int)((double) currentPage/limit+0.9))-1)*10+1;
		
		//목록 아래쪽에 보여질 마지막 페이시 수
		//10, 20, 30...
		endPage = startPage + 10 -1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		//페이지 정보를 공유할 vo객체 생성
		BoardPageInfo pi = new BoardPageInfo(currentPage,limit,maxPage,startPage,endPage);
		
		
		ArrayList<HashMap<String,Object>> list = null;
		

		new MakeQuery().makeQuery(value,mno,firstDate,lastDate,pi);
		
		HashMap<String,Object> totalMap = new HashMap<String,Object>();
		totalMap.put("pi", pi);
		
	
			list = new MemberService().resWaitSelect(value,mno);
			totalMap.put("list", list);			


			response.setContentType("application/json");
			new Gson().toJson(totalMap, response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

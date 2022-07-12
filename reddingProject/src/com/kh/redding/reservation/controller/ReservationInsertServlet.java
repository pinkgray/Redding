package com.kh.redding.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.vo.Member;
import com.kh.redding.reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationInsertServlet
 */
@WebServlet("/insert.re")
public class ReservationInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] upno = request.getParameter("upno").split(",");  //위시리스트에 담긴 상품
		String[] pno = 	request.getParameter("pno").split(",");   //회원이 예약한 제품
		int mno = Integer.parseInt(request.getParameter("mno"));  //회원번호

		
		int[] upnoArr = new int[upno.length];
		int[] pnoArr = new int[pno.length];
		ArrayList<HashMap<String, Object>> list = null;
		
		for(int i=0; i<upno.length; i++) {
			upnoArr[i] = Integer.parseInt(upno[i]);
			pnoArr[i] = Integer.parseInt(pno[i]);
		}
		
				
		int result = new ReservationService().reservationInsert(pnoArr,upnoArr,mno);
		
		if(result > 0) {
			list = new ReservationService().reservationResultSelect(mno,pnoArr);
			System.out.println("념겨받은 servielt list : " + list);
		}
		
		String page = "";
		if(list != null) {
			page = "views/member/m_reservationResult.jsp";
			request.getSession().setAttribute("resultList", list);
			response.sendRedirect(page);
			}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "예약조회 실패");
			request.getRequestDispatcher(page).forward(request, response);
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

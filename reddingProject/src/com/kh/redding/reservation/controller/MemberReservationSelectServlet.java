package com.kh.redding.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.reservation.model.service.ReservationService;
import com.kh.redding.reservation.model.vo.Reservation;

/**
 * Servlet implementation class MemberReservationSelectServlet
 */
@WebServlet("/mselect.re")
public class MemberReservationSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReservationSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		System.out.println("pno : " + pno);
		String date = request.getParameter("useDate");
		ArrayList<Reservation> reslist = null;
		
		if(date == null) {
			reslist = new ReservationService().memberSelectReservation(pno);
		}else {
			reslist = new ReservationService().memberSelectReservation(pno,date);
		}
		
		
		response.setContentType("application/json");
		
		new Gson().toJson(reslist, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

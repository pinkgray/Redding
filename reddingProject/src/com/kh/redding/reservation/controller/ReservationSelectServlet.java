package com.kh.redding.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.reservation.model.service.ReservationService;
import com.kh.redding.reservation.model.vo.Reservation;

/**
 * Servlet implementation class CalendarSelectProduct
 */
@WebServlet("/calendar.po")
public class ReservationSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		System.out.println("cno : " + cno);
		
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		
		list = new ReservationService().selectReservation(cno);
		
		response.setContentType("application/json");
		
		new Gson().toJson(list, response.getWriter());
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

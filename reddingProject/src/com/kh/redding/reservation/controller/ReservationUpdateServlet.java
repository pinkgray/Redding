package com.kh.redding.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationUpdateServlet
 */
@WebServlet("/updateRes.re")
public class ReservationUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ReservationUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resNo = Integer.parseInt(request.getParameter("num"));
		
		int result = new ReservationService().updateReservation(resNo);
		
		response.setContentType("application/json");
		
		
		
		if(result > 0) {
			new Gson().toJson(result, response.getWriter());
		}else {
			new Gson().toJson("예약 수정 실패", response.getWriter());
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

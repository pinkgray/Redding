package com.kh.redding.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.product.model.service.ProductService;

@WebServlet("/uproListUstatusY.pr")
public class UseProductUpdateStatusYServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UseProductUpdateStatusYServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String upnoSrrString = request.getParameter("upnoArr");
		String upnoSrr[] = upnoSrrString.split(", ");
		int[] upnoIrr = new int[upnoSrr.length]; 
		
		for(int i=0 ; i<upnoSrr.length ; i++) {
			upnoIrr[i] = Integer.parseInt(upnoSrr[i]);
		}
		
		String answer = request.getParameter("answer");
		int result = 0;
		int ctn=0;
		
		for(int i=0 ; i<upnoIrr.length ; i++) {
			//System.out.println(upnoIrr[i]);
			result = new ProductService().updateUseProductStatus(upnoIrr[i], answer);
			
			if(result>0) {
				ctn = ctn + 1 ;
			}
		}
		String text = "";
		if(ctn == upnoIrr.length) {
			text = "성공";
		}else {
			text = "실패";		
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson("text",response.getWriter());
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package com.kh.redding.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.product.model.service.ProductService;
import com.kh.redding.product.model.vo.UseProduct;

@WebServlet("/uproDetail.pr")
public class UseProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UseProductDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("제품 상세보기 서블릿");
		int upNo = Integer.parseInt(request.getParameter("upno"));
		//System.out.println("upNo : " + upNo);
		
		UseProduct upro = new ProductService().selectUseProductOne(upNo);
		
		String page = "";
		
		if(upro != null) {
			page = "views/company/c_useProductDetail.jsp";
			request.setAttribute("upro", upro);
		}else {
			//System.out.println("실패");
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "제품 상세보기에 실패하셨습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

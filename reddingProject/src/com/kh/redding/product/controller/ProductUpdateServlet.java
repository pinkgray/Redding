package com.kh.redding.product.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.member.model.vo.Member;
import com.kh.redding.product.model.service.ProductService;
import com.kh.redding.product.model.vo.Product;
import com.kh.redding.product.model.vo.UseProduct;

@WebServlet("/updateProduct.pr")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductUpdateServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//System.out.println("상품수정 서블릿");
    	
    	Member member = (Member)request.getSession().getAttribute("loginUser");
    	int cNo = member.getMno();

    	int pNo = Integer.parseInt(request.getParameter("pNo"));
    	//System.out.println("pNo : " + pNo);
    	
    	int proPrice = Integer.parseInt(request.getParameter("proPrice"));
    	//System.out.println("proPrice : " + proPrice);
    	
    	String proStatus = request.getParameter("proStatus");
    	//System.out.println("proStatus : " + proStatus);
    	
    	String proContent = request.getParameter("proContent");
    	//System.out.println("proContent : " + proContent);
    	
    	Date modifyDate = new Date(new GregorianCalendar().getTimeInMillis());
    	//System.out.println(modifyDate);
    	Product product = new Product();
    	
    	product.setpNo(pNo);
    	product.setPrice(proPrice);
    	product.setProStatus(proStatus);
    	product.setpContent(proContent);
    	product.setpModifyDate(modifyDate);
    	
    	
    	Product pro = new ProductService().updateProduct(product);
    	//System.out.println("product : " + pro);
    	String ustatus = "";
    	if(pro != null) { 
    		if(pro.getProStatus().equals("판매")) {
    			ustatus = "Y";
    		}else if(pro.getProStatus().equals("판매안함")){
    			ustatus = "N";
    		}
    		//System.out.println("ustatus : " + ustatus);
    		int result = new ProductService().updateUseProductList(pro.getpNo(),ustatus,cNo);
    		String page = "";
    		if(result > 0) {
    			//System.out.println("완전 성공");
    			page = request.getContextPath() + "/proDetail.pr?pno=" + pro.getpNo();
    			response.sendRedirect(page);
    		}else {
    			
        		request.setAttribute("msg", "제품리스트에 실패하셨습니다.");
        		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
        	}
    		
    	}else {
    		request.setAttribute("msg", "상품수정에 실패하셨습니다.");
    		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
    	}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

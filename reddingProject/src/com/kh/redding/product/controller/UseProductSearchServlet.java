package com.kh.redding.product.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.product.model.service.ProductService;
import com.kh.redding.product.model.vo.PageInfo;
import com.kh.redding.product.model.vo.Product;
import com.kh.redding.product.model.vo.UseProduct;

@WebServlet("/uproSearch.pr")
public class UseProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UseProductSearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("제품 검색 서블릿");
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		int startRow;
		int endRow;
		
		currentPage=1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		String ustatus = request.getParameter("ustatus");
		String startDates = request.getParameter("startDate");
		String endDates = request.getParameter("endDate");
		
		
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		Product product = new ProductService().selectProductOne(pNo);
		
		//System.out.println("ustatus : " + ustatus);
		//System.out.println("startDates : " + startDates);
		//System.out.println("endDates : " + endDates);
		
		Date startDate = Date.valueOf(startDates);
		Date endDate = Date.valueOf(endDates);
		
		int listCount = 0;
		if(ustatus.equals("total")) {
			listCount = new ProductService().getUseProductSearchTotalListCount(pNo, startDate, endDate);
			
		}else {
			listCount = new ProductService().getUseProductSearchListCount(pNo, ustatus, startDate, endDate);
		}
		
		maxPage = (int)((double)listCount/limit + 0.9);
		
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 +1;
		
		endPage = startPage + 10 -1 ;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		endRow = startRow + 10 - 1;
		
		pi.setStartRow(startRow);
		pi.setEndRow(endRow);
		
		ArrayList<UseProduct> useProList = null;
		
		if(ustatus.equals("total")) {
			useProList = new ProductService().searchUseProductTotal(pNo, startDate, endDate, pi);
		}else {
			useProList = new ProductService().searchUseProduct(pNo, ustatus, startDate, endDate, pi);
		}
		
		//System.out.println("listCount : " + listCount);
		//System.out.println("useProList : " + useProList);
		
		/*new Gson().toJson(useProList,response.getWriter());*/
		
		
		/*UseProduct upro = new UseProduct();
		upro.setpNo(pNo);
		upro.setUstatus(ustatus);*/
		String page = "";
		
		if(useProList != null) {
	    	  //System.out.println("상품상세보기 서블릿조회 성공");
			  page = "views/company/c_productDetail.jsp";
	    	  request.setAttribute("pi", pi);
	    	  request.setAttribute("pro", product);
	    	  request.setAttribute("useProList", useProList);
	    	  
	    	  //System.out.println("상품상세jsp로 넘어갑니다");
	      }else {
	    	  page = "views/common/errorPage.jsp";
	    	  request.setAttribute("msg", "상품상세 조회에 실패하셨습니다.");
	      }
	      request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

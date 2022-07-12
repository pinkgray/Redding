package com.kh.redding.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.common.MakeQuery;
import com.kh.redding.member.model.vo.Member;
import com.kh.redding.product.model.service.ProductService;
import com.kh.redding.product.model.vo.PageInfo;
import com.kh.redding.product.model.vo.Product;
import com.kh.redding.product.model.vo.ProductCounts;
@WebServlet("/searchPro.pr")
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ProductSearchServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("상품검색 서블릿");
		
		Member member = (Member)request.getSession().getAttribute("loginUser");
		int cno = member.getMno();
		int currentPage;     
		int limit;          
		int maxPage;        
		int startPage;       
		int endPage;        
		int startRow;
		int endRow;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}else {
			currentPage = 1;
		}
		
		limit = 10;
		
		int listCount = 0;
		
		String searchProName = request.getParameter("proName");
		//System.out.println("searchProName : " + searchProName);
		
		String searchStatus = request.getParameter("prostatus");
		//System.out.println("searchStatus : " + searchStatus);
		
		
		int value = 0;
		
		if(searchProName=="") {
			//System.out.println("이름 없음");
			if(searchStatus==null||searchStatus.equals("sale")) {
				//System.out.println("판매여부 없음");	//전체 검색
				value = 10;
				listCount = new ProductService().getListCount(cno);
				
			}else{
				//System.out.println("판매여부 있음");	//상품명 X 판매여부에 따라서만 검색
				value = 20;
				listCount = new ProductService().getListCountJustStatus(cno, searchStatus);
			}
		}else {
			//System.out.println("이름 있음");
			if(searchStatus==null||searchStatus.equals("sale")) {
				//System.out.println("판매여부 없음");	//상품명O 판매여부 X
				value = 30;
				listCount = new ProductService().getListJustName(cno, searchProName);
			}else {
				//System.out.println("판매여부 있음");	//상품명 X 판매여부에 따라서만 검색
				value = 40;
				listCount = new ProductService().getListCountNameStatus(cno, searchProName, searchStatus);
			}
		}
		
		maxPage = (int)((double)listCount/limit + 0.9);
		
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		startRow = (pi.getCurrentPage() - 1)*pi.getLimit() + 1;
		endRow = startRow + pi.getLimit() - 1;
		
		pi.setStartRow(startRow);
		pi.setEndRow(endRow);
		
		
		new MakeQuery().searchProduct(value, cno);
		
		ArrayList<Product> proList = new ProductService().searchProduct(value, cno, searchProName, searchStatus, pi);
		
		//HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		/*hmap.put("pi", pi);
		
		hmap.put("proList",proList);
		
		//new Gson().toJson(pi, response.getWriter());
		new Gson().toJson(hmap, response.getWriter());*/
		int productTotalCount = new ProductService().productTotalCount(cno);
		int saleProductCount = new ProductService().saleProductCount(cno, "판매");
		int noSaleProductCount = new ProductService().saleProductCount(cno, "판매안함");
		  
		ProductCounts pcount = new ProductCounts();
		pcount.setProductTotalCount(productTotalCount);
		pcount.setSaleProductCount(saleProductCount);
		pcount.setNoSaleProductCount(noSaleProductCount);
		
		String page = "";
		if(proList != null) {
		     page = "views/company/c_ProductManagement.jsp";
		request.setAttribute("proList", proList);
		request.setAttribute("pi", pi);
		request.setAttribute("pcount", pcount);
		}else {
		     page = "views/common/errorPage.jsp";
		request.setAttribute("msg", "상품목록 조회에 실패하셨습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

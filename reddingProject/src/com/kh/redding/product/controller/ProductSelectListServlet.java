package com.kh.redding.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.vo.Member;
import com.kh.redding.product.model.service.ProductService;
import com.kh.redding.product.model.vo.PageInfo;
import com.kh.redding.product.model.vo.Product;
import com.kh.redding.product.model.vo.ProductCounts;

@WebServlet("/selectProList.pr")
public class ProductSelectListServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public ProductSelectListServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //상품전체 리스트 보여주는 서블릿
      //로그인 유저의 MNO를 받아옴
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
    	  //페이지 수 처리용 변수
    	  currentPage = 1;
      }
      
      //한 페이지에 보여질 목록 갯수
      limit = 10;
      
      //전체 목록 갯수 리턴
      int listCount = new ProductService().getListCount(cno);
      
      //System.out.println("listCount : " + listCount);
      
      //총 페이지 수 계산
      maxPage = (int)((double)listCount / limit + 0.9);
      
      startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
      
      endPage = startPage + 10 - 1;
      
      if(maxPage < endPage) {
         endPage = maxPage;
      }
      
      //페이지 정보를 공유할 vo 객체 생성
      PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
      
      
      startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
      endRow = startRow + pi.getLimit() - 1;
      
      pi.setStartRow(startRow);
      pi.setEndRow(endRow);
      
      
      ArrayList<Product> proList = new ProductService().selectList(pi, cno);
      
      int productTotalCount = new ProductService().productTotalCount(cno);
      int saleProductCount = new ProductService().saleProductCount(cno, "판매");
      int noSaleProductCount = new ProductService().saleProductCount(cno, "판매안함");
      
      ProductCounts pcount = new ProductCounts();
      pcount.setProductTotalCount(productTotalCount);
      pcount.setSaleProductCount(saleProductCount);
      pcount.setNoSaleProductCount(noSaleProductCount);
      
      /*HashMap<String, Object> hmap = new HashMap<String, Object>();
      
      hmap.put("pi", pi);
      hmap.put("proList", proList);
      hmap.put("pcount", pcount);*/
      
      /*String page = "";
      if(proList != null) {
         page = "views/company/c_ProductManagement.jsp";
         request.setAttribute("hmap", hmap);
         request.setAttribute("pi", pi);
         request.setAttribute("pcount", pcount);
      }else {
         page = "views/common/errorPage.jsp";
         request.setAttribute("msg", "상품목록 조회에 실패하셨습니다.");
      }
      request.getRequestDispatcher(page).forward(request, response);*/
      
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
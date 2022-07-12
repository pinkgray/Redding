package com.kh.redding.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.vo.Member;
import com.kh.redding.product.model.service.ProductService;
import com.kh.redding.product.model.vo.PageInfo;
import com.kh.redding.product.model.vo.Product;
import com.kh.redding.product.model.vo.UseProduct;

@WebServlet("/proDetail.pr")
public class ProductDetailServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public ProductDetailServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //System.out.println("상품 상세 서블릿~");
      //pno을 가져와야 한다.
      int pno = Integer.parseInt(request.getParameter("pno"));
      //System.out.println("pno : "+pno);
      
      //상품 1개의 대한 정보 들고 오기
      Product product = new ProductService().selectProductOne(pno);
      
      //해당 상품의 제품 전체 list 들고오기(페이징)
      //int cno = (((Member)request.getSession().getAttribute("loginUser")).getMno());
      int cno = product.getcNo();
      //System.out.println("cno : " + cno);
      //System.out.println("cno : " + cno);
      int currentPage;      //현재 페이지를 표시할 변수
      int limit;            //한 페이지에 게시글이 몇 개 보여질 것인지 표시
      int maxPage;         //전체 페이지에서 가장 마지막 페이지
      int startPage;         //한번에 표시될 페이지가 시작할 페이지
      int endPage;         //한번엔 표시될 페이지가 끝나는 페이지
      int startRow;
      int endRow;
      
      //페이지 수 처리용 변수
      currentPage = 1;
      
      if(request.getParameter("currentPage") != null) {
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
      }
      
      //한 페이지에 보여질 목록 갯수
      limit = 10;
      
      //전체 목록 갯수 리턴
      int listCount = new ProductService().getUseProductListCount(pno, cno);
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
      //System.out.println("pi : " + pi);
      //System.out.println("pi.getStartRow() : " + pi.getStartRow());
      //System.out.println("pi.getEndRow() : " + pi.getEndRow());
      
      ArrayList<UseProduct> useProList = new ProductService().selectUseProductList(product.getpNo(), pi, cno);
      
      String page = "";
      
      //System.out.println("pro : " + product);
      
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
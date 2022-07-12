package com.kh.redding.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.product.model.dao.ProductDao;
import com.kh.redding.product.model.service.ProductService;
import com.kh.redding.product.model.vo.UseProduct;

@WebServlet("/uproUpdate.pr")
public class UseProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UseProductUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("제품수정 서블릿");
		int upNo = Integer.parseInt(request.getParameter("upno"));
		//System.out.println("upno : " + upNo);
		int uNum = Integer.parseInt(request.getParameter("uproNum"));
		//System.out.println("unum : " + unum);
		String ustatus = request.getParameter("uproStatus");
		
		UseProduct upro = new UseProduct();
		upro.setUpNo(upNo);
		upro.setuNum(uNum);
		upro.setUstatus(ustatus);
		
		int result = new ProductService().updateUseProduct(upro);
		
		//System.out.println("upro : " + upro);
		
		UseProduct useProduct = new ProductService().selectUseProductOne(upro.getUpNo());
		//System.out.println("useProduct : " + useProduct);
		//System.out.println(result);
		String page = "";		
		if(result>0) {
			//System.out.println("제품 수정 서블릿 성공");
			//System.out.println("upro.getpNo() : " +useProduct.getpNo());
			page = request.getContextPath()+"/proDetail.pr?pno="+useProduct.getpNo();
			response.sendRedirect(page);
			//System.out.println("제품상세보기 서블릿으로 upno랑 currentPage 가지고 넘어갑니다");
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "제품수정에 실패하셨습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

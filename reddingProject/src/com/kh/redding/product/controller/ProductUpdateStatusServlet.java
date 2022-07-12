package com.kh.redding.product.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.vo.Member;
import com.kh.redding.product.model.service.ProductService;

@WebServlet("/proListStatus.pr")
public class ProductUpdateStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ProductUpdateStatusServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("상품상태 서블릿");
		String pnoString = request.getParameter("pnoString");
		//System.out.println(pnoString);
		
		String[] pnoArr = pnoString.split(",");
		int[] pno = new int[pnoArr.length];
		
		String status = request.getParameter("status");
		//System.out.println("status : " + status);
		
		Date modifyDate = new Date(new GregorianCalendar().getTimeInMillis());
		
		Member member = ((Member)request.getSession().getAttribute("loginUser"));
		
		int cno = member.getMno();
		int proResult = 0 ;
		
		int uproResult = 0;
		String ustatus = "";
		
		int count = 0;
		
		int ctn = 0;
		
		for(int i=0 ; i<pno.length ; i++) {
			pno[i] = Integer.parseInt(pnoArr[i]);
			//System.out.println("pno["+i+"] : " + pno[i]);
			proResult = new ProductService().updateProductStatus(pno[i], status, cno , modifyDate);
			
			if(proResult>0) {
				if(status.equals("판매")) {
					ustatus = "Y";
				}else if (status.equals("판매안함")){
					ustatus = "N";
				}
				uproResult = new ProductService().updateTotalUseProductStatus(pno[i], ustatus);
				
				count = new ProductService().getUseProductListCount(pno[i], cno);
				//System.out.println("count : " + count);
				if(uproResult==count) {
					ctn = ctn +1;
				}
			}
		}
		
		//System.out.println("ctn : " + ctn);
		
		//System.out.println("pno.length : " + pno.length);
		
		String page = "";
		
		if(ctn==pno.length) {
			page = request.getContextPath()+"/selectProList.pr?mno="+cno;
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상품 판매여부 수정에 실패하셨습니다.");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

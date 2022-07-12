package com.kh.redding.coupon.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.common.MyFileRenamePolicy;
import com.kh.redding.coupon.model.service.CouponService;
import com.kh.redding.coupon.model.vo.Coupon;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/insertCoupon.ad")
public class InsertCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertCouponServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 20;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String filePath = root + "coupon_upload/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy()); 
			
			String saveFiles = "";
			
			String originFiles = "";
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				
				String name = files.nextElement();
				
				saveFiles = multiRequest.getFilesystemName(name);
				originFiles = multiRequest.getOriginalFileName(name);
				
			}
			
			String couponCategory = multiRequest.getParameter("couponCategory");
			String couponName = multiRequest.getParameter("couponName");
			String discountType = multiRequest.getParameter("discountType");
			String discountRate = multiRequest.getParameter("discountRate");
			String discountAmount = multiRequest.getParameter("discountAmount");
			String couponStartDate = multiRequest.getParameter("couponStartDate");
			String couponEndDate = multiRequest.getParameter("couponEndDate");
			String couponDescrition = multiRequest.getParameter("couponDescrition");
			
			Coupon coupon = new Coupon();
			coupon.setCouponCategory(couponCategory);
			coupon.setCouponName(couponName);
			coupon.setDiscountType(discountType);
			coupon.setDiscountRate(discountRate);
			coupon.setDiscountAmount(discountAmount);
			coupon.setCouponStartDate(couponStartDate);
			coupon.setCouponEndDate(couponEndDate);
			coupon.setCouponDescrition(couponDescrition);
			
			Attachment attachment = new Attachment();
			attachment.setFilepath(filePath);
			attachment.setOriginname(originFiles);
			attachment.setChangename(saveFiles);
			
			int result = new CouponService().insertCoupon(coupon, attachment);
			
			int result2 = new CouponService().updateCouponListY(); // 쿠폰 상태 Y로 변경
			
			if(result > 0) {
				response.sendRedirect("/redding/selectCouponList.ad");
			}else {
				File failedFile = new File(filePath + saveFiles);
				request.setAttribute("msg", "쿠폰 생성 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

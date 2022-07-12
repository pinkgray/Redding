package com.kh.redding.company.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.company.model.service.CompanyService;


@WebServlet("/deletePhoto.co")
public class DeleteCompanyPhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DeleteCompanyPhotoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int aid = Integer.parseInt(request.getParameter("num"));
		
		HashMap<String,Object> resultHmap = new CompanyService().DeletePhoto(aid);
		
		String page = "";
		if (resultHmap != null) {
			int result = (int)resultHmap.get("result");
			Attachment attachment= (Attachment)resultHmap.get("attachment");
			
			String changename = attachment.getChangename();
			String filePath = attachment.getFilepath();
			
			if (result > 0) {
				page = request.getContextPath()+"/selectPhoto.co";
				
				File removeFile = new File(filePath + changename);
				
				System.out.println(removeFile.delete());
				
				response.sendRedirect(page);
				
			}else {
				page = "/views/common/errorPage.jsp";
				
				request.setAttribute("msg", "업체 사진 삭제 실패");
				
				request.getRequestDispatcher(page).forward(request, response);
				
				
			}
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package com.kh.redding.company.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.common.MyFileRenamePolicy;
import com.kh.redding.company.model.service.CompanyService;
import com.kh.redding.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/changePhoto.co")
public class UpdateCompanyPhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateCompanyPhotoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 1024 * 1024 * 10;

			
			String root = request.getSession().getServletContext().getRealPath("/");

			//파일을 저장 경로 설정
			String filePath = root + "company_upload/";

			MultipartRequest multiRequest = new MultipartRequest(request,filePath , maxSize , "UTF-8", new MyFileRenamePolicy());

			ArrayList<String> saveFiles = new ArrayList<String>();

			ArrayList<String> originFiles = new ArrayList<String>();

			Enumeration<String> files = multiRequest.getFileNames();

			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
					
				originFiles.add(multiRequest.getOriginalFileName(name));
				

			}
			
			String changeName = saveFiles.get(0);
			String originName = originFiles.get(0);
			
			int aid = Integer.parseInt(multiRequest.getParameter("changeAid"));
			String originChange = multiRequest.getParameter("OriginchangeName");
			
			Attachment changeAttach= new Attachment();
			changeAttach.setAid(aid);
			changeAttach.setChangename(changeName);
			changeAttach.setOriginname(originName);


			int	result = new CompanyService().updateAttachment(changeAttach);
				
					
			
			String page = "";
			if (result > 0) {	
				page = request.getContextPath()+"/selectPhoto.co";
								
				File existingFile = new File(filePath + originChange);
				
				System.out.println(originChange);
				
				existingFile.delete();	
				
				response.sendRedirect(page);
				
			}else {
				for (int i = 0 ; i< saveFiles.size() ; i++) {
					File failedFile = new File(filePath + saveFiles.get(i));
					
					System.out.println(failedFile.delete());
				}

				
				page = "/views/common/errorPage.jsp";
				
				request.setAttribute("msg", "회원가입 실패");
				
				request.getRequestDispatcher(page).forward(request, response);
				
			}

		}
		
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

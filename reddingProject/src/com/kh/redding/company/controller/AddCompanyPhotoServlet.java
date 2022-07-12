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


@WebServlet("/addPhoto.co")
public class AddCompanyPhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddCompanyPhotoServlet() {
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
	
			
			HttpSession session = request.getSession();

			Member loginUser = (Member)session.getAttribute("loginUser");
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();

			for (int i = originFiles.size() -1 ; i >= 0 ; i--) {
				if (originFiles.get(i) != null || saveFiles.get(i) != null) {
					Attachment at = new Attachment();
					
					at.setFilepath(filePath);
					at.setOriginname(originFiles.get(i));
					at.setChangename(saveFiles.get(i));
					
					at.setCno_div("서브");
					
					fileList.add(at);
					
				}
			}
		
			

			int result = new CompanyService().insertAttachment(loginUser,fileList);

			if(result > 0) {
				response.sendRedirect(request.getContextPath()+"/photo.co");

			}else {
				for (int i = 0 ; i< saveFiles.size() ; i++) {
					File failedFile = new File(filePath + saveFiles.get(i));

					System.out.println(failedFile.delete());
					
				}

				request.setAttribute("msg", "게시물 오류했습니다");
				request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			}
			
		}
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

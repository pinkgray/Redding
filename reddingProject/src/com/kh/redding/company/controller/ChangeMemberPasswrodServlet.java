package com.kh.redding.company.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.company.model.service.CompanyService;

/**
 * Servlet implementation class ChangeMemberPasswrodServlet
 */
@WebServlet("/changePassword.me")
public class ChangeMemberPasswrodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ChangeMemberPasswrodServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currentPwd = request.getParameter("currentPwd");
		String changePwd = request.getParameter("changePwd");
		String memberId = request.getParameter("memberId");
		
		currentPwd = getSha512(currentPwd);
		changePwd = getSha512(changePwd);
		
		//System.out.println(currentPwd);
		//System.out.println(changePwd);
		
		int result = new CompanyService().UpdateMemberPasword(currentPwd, changePwd , memberId);
		
		PrintWriter out = response.getWriter();
		
		if (result > 0) {
			System.out.println(result);
			out.append("success");
		}else {
			System.out.println(result + "?");
			out.append("fail");
		}
	
		out.flush();
		out.close();

	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	//암호화
	public static String getSha512(String pwd) {
		String encPwd = null;
		
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-512");
	
			byte[] bytes = pwd.getBytes(Charset.forName("utf-8"));
			
			md.update(bytes);

			
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			
		} catch (NoSuchAlgorithmException e) {
		
			e.printStackTrace();
		}
				
		return encPwd;
		
	}

}

package com.kh.redding.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.service.MemberService;
import com.kh.redding.member.model.vo.Member;
 

@WebServlet("/insertMember.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemberInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String memberName = request.getParameter("memberName");
		String nickName = request.getParameter("nickName");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String phone = tel1 + "-" + tel2 + "-" + tel3;
		String con1 = request.getParameter("con1");
		String con2 = request.getParameter("con2");
		String con3 = request.getParameter("con3");
		
		String emergenCon = null;
		
		System.out.println("con2 :" + con2 );
		System.out.println("con3 :" + con3);
		
		if(!con2.equals("") && !con3.equals("") ) {
			emergenCon = con1 + "-" + con2 + "-" + con3;
		}
		
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String emailck = request.getParameter("email_check");
		
		String email = email1 + "@" + email2;
		
		String gender = request.getParameter("gender");
		
		String wedding = request.getParameter("weddingDate");
		
		System.out.println("결혼날짜 :"+wedding);
		
		Date weddingDate = null;
		
		System.out.println("id : " + memberId + ", pwd : " + memberPwd + ", name : " +memberName + ", nickName : " + nickName + ", phone : " + phone + ", emergenCon : " + emergenCon + ", email : " + email + ", gender : " + gender);
		
		Member insertMember = new Member();
		insertMember.setMemberId(memberId);
		insertMember.setMemberPwd(memberPwd);
		insertMember.setMemberName(memberName);
		insertMember.setNickName(nickName);
		insertMember.setPhone(phone);
		insertMember.setEmergenCon(emergenCon);
		insertMember.setEmail(email);
		insertMember.setGender(gender);
		
		
		if (!wedding.equals("")) {
			weddingDate = Date.valueOf(wedding);			
		}
		
		insertMember.setWeddingDate(weddingDate);
		
		System.out.println(weddingDate);
		
		insertMember.setEmailCheck(emailck);

		int result = new MemberService().insertMember(insertMember);
	
		String page = "";
		if(result > 0) {
			page = "views/common/login.jsp";
			response.sendRedirect(page);
		}else {
			page = "views/member/m_join.jsp";
			request.setAttribute("msg", "회원가입을 실패했습니다.");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

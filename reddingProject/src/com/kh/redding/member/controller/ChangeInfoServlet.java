package com.kh.redding.member.controller;
 
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.common.MyFileRenamePolicy;
import com.kh.redding.member.model.service.MemberService;
import com.kh.redding.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/changeInfo.me")
public class ChangeInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ChangeInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request 객체에서 파라미터 꺼내기
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
		String emergenCon = con1 + "-" +con2 + "-" + con3;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1 + "@" + email2;
		String emailCheck = request.getParameter("emailCheck");
		String gender = request.getParameter("gender");
		String modifyDate = request.getParameter("");
		
		Member reqMember = new Member();
		reqMember.setMemberId(memberId);
		reqMember.setMemberPwd(memberPwd);
		reqMember.setMemberName(memberName);
		reqMember.setNickName(nickName);
		reqMember.setPhone(phone);
		reqMember.setEmergenCon(emergenCon);
		reqMember.setEmail(email);
		reqMember.setGender(gender);
		
		int result = new MemberService().updateMember(reqMember);
		
		System.out.println(reqMember);
		System.out.println("result servlet : " + result);
		
		//처리 결과에 따른 뷰 결정
		String page = "";
		
		if(result > 0) {
			request.getSession().setAttribute("loginUser", reqMember);
			response.sendRedirect("views/member/m_myPage_personalInformation.jsp");
			System.out.println("개인정보 수정 완료!");
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "개인정보 수정 실패!");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

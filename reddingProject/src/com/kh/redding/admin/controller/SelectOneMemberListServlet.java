package com.kh.redding.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.admin.model.sevice.AdminService;
import com.kh.redding.member.model.vo.Member;
 
@WebServlet("/selectOneMember.ad")
public class SelectOneMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectOneMemberListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Member onemember = new AdminService().selectOneMember(num);
		
		//System.out.println(onemember);
		
		//JSONObject onememberInfo = new JSONObject();
		
		/*onememberInfo.put("memberId", onemember.getMemberId());
		onememberInfo.put("memberName", onemember.getMemberName());
		onememberInfo.put("memberNickName", onemember.getNickName());
		onememberInfo.put("memberGender", onemember.getGender());
		onememberInfo.put("memberPhone", onemember.getPhone());
		onememberInfo.put("memberEmergenCon", onemember.getEmergenCon());
		onememberInfo.put("memberEmail", onemember.getEmail());
		onememberInfo.put("memberMnotiType", onemember.getMnotiType());
		onememberInfo.put("memberEnrollDate", onemember.getEnrollDate());
		onememberInfo.put("memberWeddingDate", onemember.getWeddingDate());
		onememberInfo.put("memberStatus", onemember.getStatus());
		onememberInfo.put("memberOutDate", onemember.getOutDate());*/
		
		response.setContentType("application/json");
		new Gson().toJson(onemember,response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

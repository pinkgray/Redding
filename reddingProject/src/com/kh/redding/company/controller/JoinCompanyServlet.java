package com.kh.redding.company.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.common.MyFileRenamePolicy;
import com.kh.redding.company.model.service.CompanyService;
import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/companyjoin.cme")
public class JoinCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinCompanyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getSession().getServletContext().getRealPath("/");

		System.out.println("root : "+root);

		//파일을 저장 경로 설정
		String savePath = root + "company_upload/";
		
		int sizeLimit = 1024*1024*15;
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new MyFileRenamePolicy());
		
		String memberId = multi.getParameter("memberId");
		String memberPwd = multi.getParameter("memberPwd");
		
		//암호화
		String encPwd = null;
		
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-512");
	
			byte[] bytes = memberPwd.getBytes(Charset.forName("utf-8"));
			
			md.update(bytes);

			
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			
		} catch (NoSuchAlgorithmException e) {
		
			e.printStackTrace();
		}
			
		String company_type = multi.getParameter("company_type");
		String name = multi.getParameter("name");
		String tel1 = multi.getParameter("tel1");
		String tel2 = multi.getParameter("tel2");
		String tel3 = multi.getParameter("tel3");
		String rep_name = multi.getParameter("rep_name");
		
		String phone = tel1 + "-" + tel2 + "-" + tel3;
		
		String postcode = multi.getParameter("postcode");
		String address1 = multi.getParameter("address");
		String address2 = multi.getParameter("detailAddress");
		String address3 = multi.getParameter("extraAddress");
		
		String totalAddress = postcode + "|" + address1 + "|" + address2 + "|" + address3;
		
		String bankcode = multi.getParameter("bankcode");
		
		//System.out.println("?"+bankcode);
		
		//int accunt = Integer.parseInt(bankcode);
		
		
		
		int accountcode = Integer.parseInt(multi.getParameter("bankcode"));
		
		String account_num = multi.getParameter("accnum");
		
		String account_name = multi.getParameter("accpnm");
		
		System.out.println("?: erer:"+account_name);
		
		String email1 = multi.getParameter("email1");
		String email2 = multi.getParameter("email2");
		String email_check = multi.getParameter("email_check");
		
		String email = email1 + "@" + email2;		
	
		String url = multi.getParameter("homepage");
		String startime = multi.getParameter("strartime");
		String endtime = multi.getParameter("endtime");
		
		String[] weekend = multi.getParameterValues("weekend");
		
		String holiday = "";
		
		if (weekend != null) {
			for (int i = 0 ; i < weekend.length ; i++) {
				if (i == 0) {
					holiday += weekend[i]; 
				}else {
					holiday += "," + weekend[i];
				}
			}
		}
		
	
		System.out.println("memberId :" + memberId);
		System.out.println("password :" + memberPwd);
		System.out.println("company_type :" + company_type);
		System.out.println("name :" + name);
		System.out.println("phone :" + phone);
		System.out.println("totalAddress :" + totalAddress);
		System.out.println("accountcode :" + accountcode);
		System.out.println("account_num :" + account_num);
		System.out.println("account_name :" + account_name);
		System.out.println("email :" + email);
		System.out.println("email_check :" + email_check);
		System.out.println("url :" + url);
		System.out.println("opentime :" + startime);
		System.out.println("endTime :" + endtime);
		System.out.println("holiday :" + holiday);
		
		String emailstatus = "";
		if (email_check.equals("인증안됨")) {
			emailstatus = "N";
		}else {
			emailstatus = "Y";
		}
		
		ArrayList<String> saveFiles = new ArrayList<String>();

		ArrayList<String> originFiles = new ArrayList<String>();
		
		Enumeration<String> fileName = multi.getFileNames();
		
		while(fileName.hasMoreElements()) {
			String fname = fileName.nextElement();
			
			saveFiles.add(multi.getFilesystemName(fname));
			originFiles.add(multi.getOriginalFileName(fname));

		}
	
	
		Member joinMember = new Member();
		Company joinCompany = new Company();
		Attachment joinAttach = new Attachment();
		
		//for (int i = originFiles.size() -1 ; i >= 0 ; i--) {
			joinAttach.setFilepath(savePath);
			joinAttach.setOriginname(originFiles.get(0));
			joinAttach.setChangename(saveFiles.get(0));

		//}
		
		joinMember.setMemberId(memberId);
		joinMember.setMemberPwd(encPwd);
		joinMember.setMemberName(name);
		joinMember.setPhone(phone);
		joinMember.setEmail(email);
		joinMember.setEmailCheck(emailstatus);
		
		joinCompany.setAccountCode(accountcode);
		joinCompany.setAccountName(account_name);
		joinCompany.setAccountNum(account_num);
		joinCompany.setComType(company_type);
		joinCompany.setRepName(rep_name);
		joinCompany.setComAddress(totalAddress);
		joinCompany.setComUrl(url);
		joinCompany.setOpenTime(startime);
		joinCompany.setEndTime(endtime);
		joinCompany.setHoliday(holiday);
		
		
		
		System.out.println("joinMember :" + joinMember);
		System.out.println("joinCompany :" + joinCompany);
		System.out.println("joinAttach: " + joinAttach);
		
		int result = new CompanyService().insertCompany(joinMember,joinCompany,joinAttach);
		
		String page = "";
		if (result > 0) {
			page = request.getContextPath()+"/views/common/login.jsp";
			
			response.sendRedirect(page);
		}else {
			for (int i = 0 ; i< saveFiles.size() ; i++) {
				File failedFile = new File(savePath + saveFiles.get(i));
				
				System.out.println(failedFile.delete());
			}

			
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "회원가입 실패");
			
			request.getRequestDispatcher(page).forward(request, response);
			
		}
				
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

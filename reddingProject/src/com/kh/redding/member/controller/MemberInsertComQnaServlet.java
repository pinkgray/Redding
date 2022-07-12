package com.kh.redding.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.board.model.service.BoardService;
import com.kh.redding.board.model.vo.Board;
import com.kh.redding.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertComQnaServlet
 */
@WebServlet("/comQnaWrite.qw")
public class MemberInsertComQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertComQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("작성서블릿옴");
		String title = request.getParameter("title");
		System.out.println("title : " + title);
		String content = request.getParameter("contents");
		System.out.println("contents : "  + content);
		
		/*String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMno());*/
		Member login = (Member)request.getSession().getAttribute("loginUser");
		System.out.println("login : " + login);
		int mno = login.getMno();
		System.out.println("mno : " + mno);
		int cno = Integer.parseInt(request.getParameter("cno"));
		System.out.println("cno : "+cno);
		String bcategory = "업체문의";
		Date bdate = new Date(new GregorianCalendar().getTimeInMillis());
		
		String bdiv = "업체QnA";
		Board b = new Board();
		b.setBcategory(bcategory);
		b.setBdate(bdate);
		b.setBdivision(bdiv);
		b.setRef_cnum(cno);
		b.setBtitle(title);
		b.setBwriter(mno);
		b.setBcontent(content);
		System.out.println("board : " + b);
		int result = new BoardService().insertQnaBoard(b);
		
		String page = "";
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectDetailComQna.cq?cno="+cno);
		}else {
			request.setAttribute("msg", "게시판 작성 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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

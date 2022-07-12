package com.kh.redding.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/send")
public class SendEmailServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   
    public SendEmailServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Properties props = System.getProperties();
		props.put("mail.smtp.user", "wldnjs7781@gmail.com");
		props.put("mail.smtp.host","smtp.gmail.com");
		props.put("mail.smtp.port", "456");
		props.put("mail.smtp.starttle.enable","true");
		props.put("mail.smtp.auto","true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.port","465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		
		Authenticator aut = new MyAuthentication();
		
		Session session = Session.getDefaultInstance(props,aut);
		
		MimeMessage msg = new MimeMessage(session);
		
		String code = "";
		String content  = "";
		
		try {
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress("Redding");
			
			msg.setFrom(from);
			
			//사용자 입력한 이메일
			String email = request.getParameter("email");
			
			System.out.println("email :" + email);
			
			InternetAddress to = new InternetAddress(email);
			
			msg.setRecipient(Message.RecipientType.TO, to);
			
			//이메일 제목
			msg.setSubject("REDDING 이메일 인증코드","UTF-8");
			
			//이메일 내용
			int random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
			
			content = "안녕하세요 Redding입니다.\n 이메일 인증 코드는 ";
			
			code += random + "";
			
			content += code + "입니다.";

			System.out.println("code_check : " + code);
			
			msg.setText(content, "UTF-8");
			
			msg.setHeader("content-Type", "text/html");
			
			javax.mail.Transport.send(msg);
			
			System.out.println("보냄");
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		
		out.append(code);
		
		
	
	}

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      
      
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }
   

}

class MyAuthentication extends Authenticator{
   PasswordAuthentication pa;
   
   public MyAuthentication() {
      String id = "wldnjs7781@gmail.com";
      String pw = "redding0515";
      
      pa = new PasswordAuthentication(id,pw);
   }
   
   public PasswordAuthentication getPasswordAuthentication() {
      return pa;
   }
}
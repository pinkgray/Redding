<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.Member"%>
<%
   Member loginUser = (Member) session.getAttribute("loginUser");
   
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REDDING♥</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/company/c_nav.css">
<style>
 .sidenav1{
 	height:auto;
 }
 
  @media screen and (max-width: 600px) {
     .sidenav1{
 		height:300px;
	}
   }

}
 
 
</style>
</head>
<body>
	
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<button class="logo" onclick="location.href='<%=request.getContextPath()%>'">REDDING&nbsp;&nbsp;&nbsp;&nbsp;</button>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<%-- <li class="active"><a href="<%=request.getContextPath()%>/views/company/c_customerManager.jsp">고객관리</a></li><!-- *** --> --%>
					<li><a href="<%=request.getContextPath()%>/selectProList.pr?mno=<%=loginUser.getMno()%>">상품관리</a></li><!-- *** -->
					<li><a href="<%=request.getContextPath()%>/photo.co">정보수정</a></li>
					<li><a href="<%=request.getContextPath()%>/showMonCalc.co?mno=<%=loginUser.getMno()%>">정산관리</a></li>
					<li><a href="<%=request.getContextPath()%>/views/company/c_messageManager.jsp">쪽지관리</a></li><!-- *** -->
					<li><a href="<%=request.getContextPath()%>/selectBoardList.bo">커뮤니티</a></li>
					
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<%=request.getContextPath()%>/logout.me">LOGOUT</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
</body>
</html>
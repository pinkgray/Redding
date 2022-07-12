<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.Member"%>
<%
   Member loginUser = (Member) session.getAttribute("loginUser");
%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/company/c_header.css">
	<header>
		<div class = "wrap">
			<div class = "imgdiv">
				<img src="<%=request.getContextPath()%>/images/logo.png" alt="로고" id = "logoimg">
			</div>
			<div class = "logo">
				<label id = "logo_Title">Redding</label>
			</div>
			<div class = "info">
				<div class = "info3">
					<label id="userlabel"><%=loginUser.getMemberName() %> 님</label>
					<label>logout</label>
				</div>
				<div class = "info2">
					<img src = "<%=request.getContextPath()%>/images/home.png"  alt = "home" onclick = "location.href = '<%=request.getContextPath() %>/views/company/c_main.jsp'">
					<img src = "<%=request.getContextPath()%>/images/info.png"  alt = "info">
					<img src = "<%=request.getContextPath()%>/images/c_user.png"  alt = "info2">
				</div>
		</div>
		</div>
	</header>

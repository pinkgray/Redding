<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.Member"%>
<%
	String msg = (String) request.getAttribute("msg"); 
%>

<!DOCTYPE html>
<html>
<head>
<title>Redding♥</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/login.css">
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<jsp:include page="/views/member/m_header.jsp"></jsp:include>
	</div>
	<br>

	<!-- 멤버 나브 -->
	<div>
		<jsp:include page="/views/member/m_nav.jsp"></jsp:include>
	</div>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">

			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<div class="col-sm-8 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>

				<div class="loginArea">
					<form id="loginForm" action="<%=request.getContextPath()%>/login.me" method="post">
					
						<br><br><br>
						<label class="title">LOGIN</label><br>
						<label class="subTitle">welcome to redding</label>
						<br><br><br>
						
						<table class="loginTable" align="center">
							<tr>
								
							</tr>
							<tr>
								<td><label>ID : </label></td>
								<td><input type="text" id="userId" name="memberId"></td>
								<td rowspan="2"><button class="loginBtn" onclick="login()">LOGIN</button></td>

							</tr>
							<tr>
								<td><label>PASSWORD : </label></td>
								<td><input type="password" id="userPwd" name="memberPwd">
								</td>	
							</tr>
							<tr>
								<td colspan = "3">
								<% if(msg != null){%> 
								<label style = "color:red"><%=msg %> </label>
								<% } %>
								</td>
							</tr>
						</table>
					</form>
					
					<br>
					<button class="loginMenu" onclick="location.href='<%=request.getContextPath()%>/views/common/join.jsp'">회원이 아니신가요?</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
					<button class="loginMenu" onclick= "location.href='<%=request.getContextPath()%>/views/member/m_idpasswordSearch.jsp'">ID/PASSWORD 찾기</button>
				</div>

			</div>

			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

		</div>

	</div>
	<br><br><br><br><br>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	
	<script>
		function login() {
			$("#loginForm").submit();
		}
	</script>

</body>
</html>
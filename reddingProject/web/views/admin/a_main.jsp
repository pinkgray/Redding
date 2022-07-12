<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.redding.member.model.vo.*"%>
<%-- <%
	Member loginUser = (Member) session.getAttribute("loginUser");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_main.css">
<style>


/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 600px;
}

/* Set gray background color and 100% height */
.sidenav1 {
	padding-top: 20px;
	background:MistyRose;
	height: 100%;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
<title>REDDING♥</title>
</head>
<body>

	<%-- <div>
		<jsp:include page="/views/admin/a_nav.jsp"></jsp:include>
	</div> --%>
	<%@ include file="/views/admin/a_sideNav.jsp" %>
	
	<% if( loginUser == null || loginUser.getMemberType() != 90) {
		request.setAttribute("msg","잘못된 경로 접근하셨습니다");
		request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
	 } else {%>
	<div class="container-fluid text-center">
		<div class="row content">
		
			<!-- <div class="col-sm-2 sidenav1">
			</div> -->
			
			
			<div class="col-sm-10 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="contentsArea">
												
					
					
				</div>
			
			</div>
			
			
			<div class="col-sm-2 sidenav2">
				
			</div>
		</div>
	</div>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	<% }%> 
	

</body>
</html>
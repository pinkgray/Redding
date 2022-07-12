<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String msg = (String) request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<title>REDDING♥</title>
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
   href="${pageContext.request.contextPath}/css/admin/a_nav.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/company/c_main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/errorPage.css">
</head>
<body>

	<div class="container-fluid text-center">
		<div class="row content">

			<div class="col-sm-2 sidenav1"></div>

			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="contents">
					<br>
					<label class="errorMsg">An error occurred!</label>
					<br><br><br>
					<img src="<%=request.getContextPath()%>/images/error.png" class="errorImg">
					<br><br>
					<div class="errorReason">
						<%=msg %>
					</div>
					<br><br>

          <button class="goHome" <%-- onclick="location.href='<%=request.getContextPath() %>/index.jsp'" --%>>이전으로 돌아가기</button>
					
          <br><br><br>
				</div>
			</div>
			<div class="col-sm-2 sidenav2"></div>

		</div>
	</div>
	<script>
		$(function(){
			$(".goHome").click(function(){
				history.back();
			});
		});
	</script>
</body>
</html>
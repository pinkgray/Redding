<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>REDDING♥</title>
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
	href="${pageContext.request.contextPath}/css/common/join.css">
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

				<div class="joinSelectionArea">
				
					<br><br><br>
					<label class="title">JOIN</label><br>
					<label class="subTitle">welcome to redding</label>
					<br><br><br>
					
					<button class="joinBtn" onclick="location='<%=request.getContextPath()%>/views/member/m_join.jsp'">
						<br>
						<img src="<%=request.getContextPath()%>/images/member.png" class="joinBtnImg">
						<br><br>
						<label class="label1">&nbsp;&nbsp;개인 회원&nbsp;&nbsp;</label>
						<br>
						<label class="label2">만 14세 이상 고객 회원가입</label>
						<br><br>
					</button>
					
					<button class="joinBtn" onclick="location='<%=request.getContextPath()%>/views/company/c_join.jsp'">
						<br>
						<img src="<%=request.getContextPath()%>/images/company.png" class="joinBtnImg">
						<br><br>
						<label class="label1">&nbsp;&nbsp;사업자 회원&nbsp;&nbsp;</label>
						<br>
						<label class="label2">사업자등록증 보유 고객 회원가입</label>
						<br><br>
					</button>

				</div>

			</div>

			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

		</div>

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>

</body>
</html>
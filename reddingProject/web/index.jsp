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
	rel="stylesheet"><!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<style>

.container {
	width:100%;
	color:salmon;
	font-family:'Noto Sans KR', sans-serif;
}

.row.content {
	height:100%;
}

.sidenav {
	height: 100%;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height:100%;
	}
}

.con1 {
	width:100%; 
	height:100%; 
	border-top:1px solid lightgray; 
	border-bottom:1px solid lightgray; 
	text-align:center; 
}
.con1label {
	font-size:35px;
	color:salmon;
	font-family:'Noto Sans KR', sans-serif;
}
.con1Table {
	width:100%;
	height:100%;
}
.conImg {
	width:70%;
}
.com1label2 {
	font-family:'Noto Sans KR', sans-serif;
	color:gray;
}
</style>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<jsp:include page="/views/member/m_header.jsp"></jsp:include>
	</div><br>

	<!-- 멤버 나브 -->
	<div class="memberNavArea">
		<jsp:include page="/views/member/m_nav.jsp"></jsp:include>
	</div>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">
			
			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-1 sidenav"></div>

			<div class="col-sm-10 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<br><br>
				<div class="container">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner" style="height:300px;">
							<div class="item active">
								<img src="<%=request.getContextPath()%>/images/Reddingmain.png" class="carouselImg" style="width:100%; height:300px;">
							</div>
							<div class="item">
								<img src="<%=request.getContextPath()%>/images/main2.png" class="carouselImg" style="width:100%; height:300px;">
							</div>
							<div class="item">
								<img src="<%=request.getContextPath()%>/images/main3.png" class="carouselImg" style="width:100%; height:300px;">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<br><br>
				<div class="con1">
					<br>
					<label class="con1label">Plan Your Special Day</label>
					<br><br><br>
					<table class="con1Table">
						<tr>
							<td><img src="<%=request.getContextPath()%>/images/conImg1.png" class="conImg"></td>
							<td><img src="<%=request.getContextPath()%>/images/conImg2.png" class="conImg"></td>
							<td><img src="<%=request.getContextPath()%>/images/conImg3.png" class="conImg"></td>
						</tr>
						<tr>
							<td class="com1label2"><br>내가 고른 스드메 업체 견적을 한눈에<br><br></td>
							<td class="com1label2"><br>간편하게 위시리스트에서 결제까지 한번에<br><br></td>
							<td class="com1label2"><br>커뮤니티 공간에서 정보 공유까지<br><br></td>
						</tr>
					</table>
					<br>
				</div>
				<br><br>
			</div>
			
			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-1 sidenav"></div>
			
		</div>

	</div>
	<br>
	
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	

</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.Member"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
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
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_myPage.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_myPage_checkList.css">
<style>

.container {
	width:100%;
	color:salmon;
	font-family:'Noto Sans KR', sans-serif;
}

.row.content {
	height: 450px;
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
		height: auto;
	}
}
.div1Table2Btn1 {
	width:100%;
	height:100%;
	text-align:center;
	font-family:'Noto Sans KR', sans-serif;
	font-size:17px;
	background:white;
	color:salmon;
	border-bottom:1px solid white;
	border-top:1px solid salmon;
	border-left:1px solid salmon;
	border-right:1px solid salmon;
}
</style>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<jsp:include page="/views/member/m_header.jsp"></jsp:include>
	</div><br>
	
	<div class="div1">
		<table class="div1Table">
			<tr>
				<td style="background:salmon"><img src="<%=request.getContextPath()%>/images/mplogo.png" height="70px"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<table class="div1Table2">
			<tr>
				<td><button class="div1Table2Btn">HOME</button></td>
				<td><button class="div1Table2Btn1" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_checkList.jsp'">CHECK LIST</button></td>
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_payment.jsp'">결제 내역</button></td>
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_coupon.jsp'">쿠폰함</button></td>
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_myWriting.jsp'">내 글 관리</button></td>
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_personalInformation.jsp'">개인정보 수정</button></td>
			</tr>
		</table>
	</div>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">
			
			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav" id="leftNav">
			
			</div>

			<div class="col-sm-10 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				
				<div class="contents">
				
					<div class="subTitle">
						[ <%=loginUser.getMemberName()%>님의 CHECK LIST ]
					</div>
					
					<br><br><br>
					
					<div class="line"></div>
				
					<table class="checkListForm">
						<tr>
							<td rowspan="2" width="150px"><input type="checkbox" class="checkListCheckBox"></td>
							<td><label class="dday">D-180</label></td>
						</tr>
						<tr>
							<td width="300px"><label class="listName">상견례</label></td>
							<td><button class="checkStatus">진행완료</button></td>
						</tr>
					</table>
					<br>
					<br>
					<br>
					<table class="checkListForm">
						<tr>
							<td rowspan="2" width="150px"><input type="checkbox" class="checkListCheckBox"></td>
							<td><label class="dday">D-170</label></td>
						</tr>
						<tr>
							<td width="300px"><label class="listName">예식장 조사하기</label></td>
							<td><button class="checkStatus">진행중</button></td>
						</tr>
					</table>
					<br>
					<br>
					<br>
					<table class="checkListForm">
						<tr>
							<td rowspan="2" width="150px"><input type="checkbox" class="checkListCheckBox"></td>
							<td><label class="dday">D-160</label></td>
						</tr>
						<tr>
							<td width="300px"><label class="listName">스드메 조사하기</label></td>
							<td><button class="checkStatus">진행중</button></td>
						</tr>
					</table>
					<br>
					<br>
					<br>
					
				</div>


			</div>
			
			<!-- 오른쪽 빈공간 -->
			<!-- <div class="col-sm-2 sidenav"></div> -->
			
		</div>

	</div>
	<br>
	
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>

</body>
</html>

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
	href="${pageContext.request.contextPath}/css/notice/contact_main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>

.container {
	width:100%;
	color:salmon;
	font-family:'Noto Sans KR', sans-serif;
}

.row.content {
	height: 600px;
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
	
	.noticetable{
		width : 400px;
	}
}
</style>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
			<%@ include file="/views/member/m_header.jsp"%>
	</div><br>

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

			<div class="container">
			
				
				<h2>1대 1 문의</h2>
				<hr>
				<div class = "wrap">
				<div class = "conMenu">
					<div class = "writerbtn">
						<i class="material-icons md-36" id = "writeIcon">border_color</i>
						<div class = "labeldiv">
							<label id = "wlabel">작성하기</label>
						</div>
					</div>
					<div class = "listbtn">
						<i class="material-icons md-36">insert_comment</i>
						<div class = "labeldiv">
							<label>문의내역</label>
						</div>
					</div>
				</div>
					<div class = "contactwrite">
						<form action = "<%=request.getContextPath() %>/QnAinsert.no" method = "post" id = "QnAForm">
						<% if (loginUser != null){ %>
						<input type = "hidden" value = "<%=loginUser.getMno()%>" name = "mno" id = "mno">
						<% } %>
						<table id = "writerTable">
							<tr>
								<th colspan = "2">카테고리</th>
								<td>
								<select name = "category">
									<option>선택해주세요 </option>
									<option value = "사이트문의">사이트문의</option>
									<option value = "업체문의">업체문의 </option>
								</select>
								</td>
							</tr>
							<tr>
								<th colspan = "2">제목</th>
								<td>
									<input type = "text" name = "conTilte" id = "conTilte">
								</td>
							</tr>
							<tr>
								<th rowspan = "5" colspan = "2">내용</th>
								<td>
									<textArea cols = "40" rows = "5" id = "contact" name = "contact"></textArea>
								</td>
							</tr>
						</table>
							<button type = "button" id = "consubmit">보내기</button>
						</form>
					</div>
				</div>
				
			
			</div>
			
			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>
			
		</div>

	</div>
	<br>
	
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	
	<script>
		$(function(){
			$(".listbtn").click(function(){
				
				<% if(loginUser != null) { %>
					location.href = "<%=request.getContextPath()%>/selectQnA.no?mno="+ <%=loginUser.getMno()%>;
				<% }else { %>	
					alert("로그인 후 이용 가능합니다.");
				<%}%>
			});
			
			$(".writerbtn").click(function(){
				location.href = "<%=request.getContextPath()%>/views/notice/contact_main.jsp";
			});
			
			$("#consubmit").click(function(){
				<% if(loginUser != null) { %>
					$("#QnAForm").submit();
				<% }else { %>				
					alert("로그인 후 이용가능");
				<%} %>
			
 			});
			
			
		})
		
	</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.* , com.kh.redding.member.model.vo.*"  %>
<%
   Member loginUser = (Member) session.getAttribute("loginUser");
%> 
<%
 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
 String today = formatter.format(new java.util.Date());
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
	href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/notice/Detail_Notice.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
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
		<jsp:include page="/views/member/m_header.jsp"></jsp:include>
	</div><br>

	<!-- 멤버 나브 -->
	<div>
		<jsp:include page="/views/member/m_nav.jsp"></jsp:include>
	</div>

	<% if (loginUser == null || loginUser.getMemberType() != 90) {
		request.setAttribute("msg","잘못된 경로 접근하셨습니다");
		request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
	}else {%>
	
	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">
			
			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<div class="col-sm-8 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>

			<div class="container">
				<h2>공지사항</h2>
				<hr>
				<div class = "wrap">
					<form action = "<%=request.getContextPath() %>/insertNotice.no" method = "post" id = "noticeSubmit">
					<table class = "noticetable">
						<tr>
							<th>제목 </th>
							<td colspan = "4"><input type = "text" name = "noticeTitle" id = "noticeTitle" placeholder ="제목을 입력해주세요" style = "width : 100%;"></td> 
							<td colspan = "4"></td>
						</tr>
						<tr>
							<th>작성자 </th>
							<td><span>관리자</span>
							<input type = "hidden" name = "writer" value = "<%=loginUser.getMno() %>" >
							</td> 
							<th>등록날짜</th>
							<td><span><%=today %></span></td>
							<td colspan = "6"></td>
						</tr>
						<tr>
							<th>내용 </th>
						</tr>
						<tr>
							<td colspan = "10">
								<textarea rows="10" cols="80" style="resize: none; text-align : left;" name = "noticeContent" id = "noticeContent" placeholder = "내용을 입력해주세요"]></textarea>
							</td>
						</tr>
						
					</table>
					<div class = "notice_footer">
						<div class = "notice_writer">
							<button type = "button" id = "writerbtn">글쓰기</button>
						</div>
					</div>
					</form>
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
			$("#writerbtn").click(function(){
				$("#noticeSubmit").submit();
			});
		});
	
	</script>
	
	<%} %>

</body>
</html>

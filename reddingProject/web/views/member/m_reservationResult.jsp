<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<% 
    ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>) session.getAttribute("resultList");
%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REDDING♥</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
.container {
	width: 100%;
	color: salmon;
	font-family: 'Noto Sans KR', sans-serif;
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
	
	
	td {
		text-align:center !important;
		border-right:1px solid black;
		border-left:1px solid black;
	}
	.resultTable{
		border-top:1px solid black;
		border:1px solid black !important;
		margin-left:auto;
		margin-right:auto;
	}
	
	td:nth-child(2n-1){
		background:salmon;
	}
	
	td:nth-child(2n){
		float:left; 
		background:white !important;
		color:black;
		border-left:1px soild black !important;
	}
	tbody{
		background:white !important;
	}
	
	.ui.inverted.grey.table{
		margin-left:auto;
		margin-right:auto;
	}
	
	table{
		width:50% !important;
	}




</style>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<%@ include file="/views/member/m_header.jsp" %>
	</div>
	<br>


	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">

			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="reservationResult" style="width:100;">
					<h2 align="center">신청하신 예약정보입니다.</h2>
					<br>
					
						<% for(int i=0; i<list.size(); i++) { 
							HashMap<String, Object> hmap = list.get(i);
						%>
						<table class="ui inverted grey table resultTable" style="width:80%; height:auto; text-align:center;">
						<tr style="border-bottom:1px solid lightgray;">
							<td>
								<label>업체명</label>					
							</td>
							<td>
								<%= hmap.get("cName") %>
							</td>
						</tr>
						<tr style="border-bottom:1px solid lightgray;">
							<td>
								<label>상품명</label>							
							</td> 
							<td>
								<%= hmap.get("pName") %>
							</td>
						</tr>
						<tr style="border-bottom:1px solid lightgray;">
							<td>
								<label>예약날짜/시간</label>							
							</td> 
							<td>
								<%=hmap.get("useDate")%>/<%=hmap.get("useStart") %>~<%=hmap.get("userEnd") %>
							</td>							
						</tr>
						<tr style="border-bottom:1px solid lightgray;">
							<td>
								<label>업체주소/번호</label>								
							</td> 
							<td>
								<% if(hmap.get("cAddress").toString().split("\\|").length > 2) {%>
								 (<%=hmap.get("cAddress").toString().split("\\|")[0]%>)&nbsp; <%=list.get(0).get("cAddress").toString().split("\\|")[1] %>
								&nbsp;(<%=list.get(0).get("cAddress").toString().split("\\|")[2] %>)/<%=hmap.get("cPhone") %>
								<% }else{ %>
								(<%=hmap.get("cAddress").toString().split("\\|")[0]%>)&nbsp; <%=list.get(0).get("cAddress").toString().split("\\|")[1] %>/<%=hmap.get("cPhone") %>						
								<% }%>
								
								
							</td>							
						</tr>
						<tr>
							<td>
								<label>예약자</label>								
							</td> 
							<td>
								<%= loginUser.getMemberName() %>
							</td>							
						</tr>
					</table>
					<br><br>
					<% } %>					
					<div align="center">
						<button class="ui button" onclick="location.href='<%=request.getContextPath()%>/views/member/m_myPage_payment.jsp'">예약목록</button>
						<button class="ui button" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">메인으로</button>
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

	</script>

</body>
</html>
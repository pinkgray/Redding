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
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_statistic.css">
<style>


/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 600px;
}

/* Set gray background color and 100% height */
.sidenav1 {
	padding-top: 20px;
	height: 100%;
	text-align:left;
	font-size:20px;
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
</head>
<body>

	<!-- 업체 나브 -->
	<div>
		
		<jsp:include page="/views/company/c_nav.jsp"></jsp:include>
	</div>

	<div class="container-fluid text-center">
		<div class="row content">
		
			<div class="col-sm-2 sidenav1">
			</div>
			
			
			<div class="col-sm-8 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
			<div class="contentsArea">
				<div class = "monthgraphArea">
					<h2>월별 매출현황</h2>
					<div class = "monthgraph">
						
					</div>
					<table id = "monthTable">
						<thead>
							<tr>
								<th></th>
								<th>1월</th>
								<th>2월</th>
								<th>3월</th>
								<th>4월</th>
								<th>5월</th>
								<th>6월</th>
								<th>7월</th>
								<th>8월</th>
								<th>9월</th>
								<th>10월</th>
								<th>11월</th>
								<th>12월</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>금액 </th>
								<td colspan = "12">등록된 정보가 없습니다.</td>
							</tr>
							<tr>
								<th>건수</th>
								<td colspan = "12">등록된 정보가 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>	
				<div class = "monthgraphArea">
					<h2>요일별 매출현황</h2>
					<div class = "monthgraph">
						
					</div>
					<table id = "monthTable">
						<thead>
							<tr>
								<th></th>
								<th>월요일</th>
								<th>화요일</th>
								<th>수요일</th>
								<th>목요일</th>
								<th>금요일</th>
								<th>토요일</th>
								<th>일요일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>금액 </th>
								<td colspan = "7">등록된 정보가 없습니다.</td>
							</tr>
							<tr>
								<th>건수</th>
								<td colspan = "7">등록된 정보가 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class = "monthgraphArea">
					<h2>년 별 매출현황</h2>
					<div class = "monthgraph">
						
					</div>
					<table id = "monthTable">
						<thead>
							<tr>
								<th></th>
								<th>2019년</th>
								<th>2020년</th>
								<th>2021년</th>
								<th>2022년</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>금액 </th>
								<td colspan = "4">등록된 정보가 없습니다.</td>
							</tr>
							<tr>
								<th>건수</th>
								<td colspan = "4">등록된 정보가 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
				
			</div>
				<div class="col-sm-2 sidenav2">
			</div>
		</div>
		
		</div>
	</div>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>


</body>
</html>
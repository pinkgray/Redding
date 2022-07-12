<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	background: MistyRose;
	height: 100%;
	text-align: left;
	color:black;
	font-size:20px;
}
/* #faqt{
 	margin-left:auto;
 	margin-right:auto;
 	width:1000px;
 	text-align:center;
 }
 #faqt th{
 	text-align:center;
 } */
  
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

	<div>
		<jsp:include page="/views/admin/a_nav.jsp"></jsp:include>
	</div>
	
	<div class="container-fluid text-center">
		<div class="row content">
		
			<div class="col-sm-2 sidenav1">
				<ul>
					<li><a href="a_CustomerCenter.jsp">FAQ</a></li>
					<li><a href="">공지사항</a></li>
				</ul>
			</div>
			
			
			<!-- <div class="col-sm-8 text-left"> -->
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="noticeArea">
				<br><br>
					<div class="faq">
						<h2 style="float: left; margin-left:9%;">FAQ</h2><br>
						<div style="float: right; margin-right:9%;">
							<input type="text">
							<button>등록</button>
							<button>수정</button>
							<button>삭제</button>
						</div>
						<br><br><br><br>
						<table id="faqt" align="center" width="1000">
							<tr style="background: lightgray;">
								<th>No</th>
								<th>제목</th>
								<th>등록 날짜</th>
								<th>수정 날짜</th>
								<th>수정하기</th>
								<th>삭제하기</th>
							</tr>
							<tr>
								<td>1</td>
								<td>예약 업체는 어떤 식으로 이루어지나요?</td>
								<td>2019-05-09</td>
								<td>2019-05-10</td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
							</tr>
							<tr>
								<td>2</td>
								<td>회원 혜택은 어떤게 있나요?</td>
								<td>2019-05-09</td>
								<td>2019-05-10</td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
							</tr>
							<tr>
								<td>3</td>
								<td>CSS가 안 먹는데 어떻게 해야 하나요?</td>
								<td>2019-05-09</td>
								<td>2019-05-10</td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
							</tr>
							<tr>
								<td>4</td>
								<td>시간 안에 완성할 수 있을까요?</td>
								<td>2019-05-09</td>
								<td>2019-05-10</td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
							</tr>
						</table>
							<br>
							<h4> < 1, 2, 3 > </h4>
					</div>
					
					<br><br><br><br><br><br>
					<div class="notice">
						<h2 style="float: left; margin-left:9%;">공지사항</h2><br>
						<div style="float: right; margin-right:9%;">
							<input type="text">
							<button>등록</button>
							<button>수정</button>
							<button>삭제</button>
						</div>
						<br><br><br><br>
						<table id="noticet" align="center" width="1000">
							<tr style="background: lightgray;">
								<th>No</th>
								<th>제목</th>
								<th>등록 날짜</th>
								<th>수정 날짜</th>
								<th>수정하기</th>
								<th>삭제하기</th>
							</tr>
							<tr>
								<td>1</td>
								<td>예약 업체는 어떤 식으로 이루어지나요?</td>
								<td>2019-05-09</td>
								<td>2019-05-10</td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
							</tr>
							<tr>
								<td>2</td>
								<td>회원 혜택은 어떤게 있나요?</td>
								<td>2019-05-09</td>
								<td>2019-05-10</td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
							</tr>
							<tr>
								<td>3</td>
								<td>CSS가 안 먹는데 어떻게 해야 하나요?</td>
								<td>2019-05-09</td>
								<td>2019-05-10</td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
							</tr>
							<tr>
								<td>4</td>
								<td>시간 안에 완성할 수 있을까요?</td>
								<td>2019-05-09</td>
								<td>2019-05-10</td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
							</tr>
						</table>
							<br>
							<h4> < 1, 2, 3 > </h4>
					</div>

				</div>
			
			<!-- </div> -->
			
			
			<!-- <div class="col-sm-2 sidenav2">
			</div> -->
			
		</div>
	</div>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>

	

</body>
</html>
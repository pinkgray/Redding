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
	href="${pageContext.request.contextPath}/css/admin/a_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath}/css/admin/a_updateSurvey.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">

<title>Redding♥</title>
</head>
<body>
	<div>
		<jsp:include page="/views/admin/a_nav.jsp"></jsp:include>
	</div>
	<div class="container-fluid text-center">
		<div class="row content">
		</div>

		<div class="visible-md visible-lg visible-sm">
			<div class="col-sm-2 sidenav1">
			</div>
		</div>
		
		<div class="visible-xs sideListnav2">
			<div class="col-sm-2 sidenav1">
			</div>
		</div>

			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="SurveyArea">
				<br>
					<h2 id="text1">설문 내용 수정</h2>
					<br>
					<div class="Survey">
						<table id="surveyList">
							<tr style="background: lightgray;">
								<th><input type="checkbox"></th>
								<th>번호</th>
								<th>질문</th>
								<th>답변</th>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1.</td>
								<td>예식장을 예약하셨나요?</td>
								<td>Y</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>2. </td>
								<td>선호하는 스타일은?</td>
								<td>보헤이만</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>3. </td>
								<td><input type="text"></td>
								<td><input type=></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>4. </td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>5. </td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>6. </td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>7. </td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>8. </td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>9.</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>10. </td>
								<td></td>
								<td></td>
							</tr>
							
						</table>
						<br>
						<div class="btns">
							<button id="insertList" class="ui pink button" style="background:salmon;">항목추가</button>
							<button id="deleteList" class="ui pink button" style="background:salmon;">삭제</button>
							<button id="updateList" class="ui pink button" style="background:salmon;">저장</button>
						</div>
					
				</div>


				<div class="col-sm-2 sidenav2"></div>

			</div>
		</div>
</div>
		<!-- 커먼 풋터 -->
		<div class="footerArea">
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
		</div>
</body>
</html>
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
	href="${pageContext.request.contextPath}/css/admin/a_companyDetail.css">
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
		
			<div class="visible-md visible-lg visible-sm">
			<div class="col-sm-2 sidenav1">
				<div class="sidenavArea">
					<ul class="navList">
						<li onclick="location.href='a_Company.jsp'">업체 목록</li>
						<li onclick="location.href= 'a_CompanyDetail.jsp';" style="color:lightgray; padding-left:25px">업체 정보 조회</li>
						<li onclick="location.href= 'a_Message.jsp';">업체 쪽지 관리</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="visible-xs sideListnav2">
					<div class="col-sm-2 sidenav1">
						<div class="sidenavArea2">
							<ul class="navList2">
								<li onclick="location.href='a_Company.jsp'">업체 목록</li>
								<li onclick="location.href= 'a_CompanyDetail.jsp';" style="color:lightgray; padding-left:25px">업체 정보 조회</li>
								<li onclick="location.href= 'a_Message.jsp';">업체 쪽지 관리</li>
							</ul>
					</div>
					</div>
					
					<br><br>
				</div>
		


			<div class="col-sm-10 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="comapnyArea">
					<div class="comapnyNum">
						<br>
						<h2>업체정보조회</h2>
						<table id="comapnyNumt">
							<tr>
								<td width="200" style="background: lightgray;">
								<span>사용자 등록 번호</span></td>
								<td><input type="text" class="form-control"
									value="123456789" disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;""><span>아이디</span></td>
								<td><input type="text" class="form-control"
									value="MakeUp01" disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;"><span>비밀번호</span></td>
								<td><input type="text" class="form-control" value="*****"
									disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;"><span>대표자명</span></td>
								<td><input type="text" class="form-control" value="남궁욱"
									disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;" rowspan="3"><span>주소</span></td>
								<td><input type="text" class="form-control" value="12345"
									disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="text" class="form-control"
									value="XXX XXX XXX" disabled></td>
								<td>기본주소</td>
							</tr>
							<tr>
								<td colspan="2"><input type="text" class="form-control"
									value="XXX XXX XXX" disabled></td>
								<td>상세주소</td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;" >연락처</td>
								<td style="float:left;"><input type="text" maxlength="3" name="tel1" size="2" disabled>-
									<input type="text" maxlength="4" name="tel2" size="2" disabled>-
									<input type="text" maxlength="4" name="tel3" size="2" disabled>
								</td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;" >휴대전화</td>
								<td style="float:left;"><input type="text" maxlength="3" name="tel1" size="2" disabled>-
									<input type="text" maxlength="4" name="tel2" size="2" disabled>-
									<input type="text" maxlength="4" name="tel3" size="2" disabled>
								</td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;"><span>통장번호</span></td>
								<td style="float:left;">
									<div class="ui right action left icon input">
										<input type="text" value="우리은행">
										<div class="ui basic floating dropdown button">
											<i class="dropdown icon"></i>
										</div>
									</div>
								</td>
								<td style="float:left;"><input type="text" class="form-control" value="10000-11110-52245" disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;" >영업시간</td>
								<td style="float:left;"><input type="time" disabled>~
									<input type="time" disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;" >이메일</td>
								<td><input type="text" class="form-control" value="only1yew@naver.cpm" disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;" >홈페이지</td>
								<td><input type="text" class="form-control" value="kh.co.kr" disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;" >인삿말</td>
								<td><input type="text" class="form-control" value="안녕하세요" disabled></td>
								<td colspan="5"></td>
							</tr>
						</table>
					</div>
					<br>
						<div class="btns">
							<button class="ui pink button" style="background: salmon;">뒤로가기</button>
						</div>
					</div>

				</div>

				<div class="col-sm-2 sidenav2"></div>

			</div>
		</div>

		<!-- 커먼 풋터 -->
		<div class="footerArea">
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
		</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="com.kh.redding.member.model.vo.*, com.kh.redding.admin.model.vo.*, java.util.*"%>
<%
	/* ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	TotalMemberPageInfo pi = (TotalMemberPageInfo) request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	ArrayList<HashMap<String, Object>> oneCompany = (ArrayList<HashMap<String, Object>>) request.getAttribute("oneCompany"); */
	Member company = (Member) request.getAttribute("company");
%>
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
	href="${pageContext.request.contextPath}/css/admin/a_company.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a_insertMessage.css">	

<title>REDDING♥</title>
</head>
<body>
	<%-- <div>
		<%@include file="/views/admin/a_nav.jsp"%>
	</div> --%>
	<%@ include file="/views/admin/a_sideNav.jsp" %>
	<div class="container-fluid text-center">
		<div class="row content">

			<div class="visible-md visible-lg visible-sm">
				<div class="col-sm-2 sidenav1">
					<%-- <div class="sidenavArea">
						<ul class="navList">
							<li onclick="location.href='<%=request.getContextPath()%>/selectList.co'">업체 목록</li>
							<li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_Message.jsp'">받은 쪽지 관리</li>
							<li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_SendMessage.jsp'">보낸 쪽지 관리</li>
						</ul>
					</div> --%>
				</div>
			</div>

			<div class="visible-xs sideListnav2">
				<div class="col-sm-2 sidenav1">
					<%-- <div class="sidenavArea2" style="margin-top:-10px; height: 60px;">
						<ul class="navList2">
							<li onclick="location.href='<%=request.getContextPath()%>/selectList.co'">업체 목록</li>
							<li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_Message.jsp'">받은 쪽지 관리</li>
							<li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_SendMessage.jsp'">보낸 쪽지 관리</li>
						</ul>
					</div> --%>
				</div>

				<br> <br>
			</div>

			<div class="col-sm-10 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="companyArea">
					<div id="sendMesToCompany">
						<div id="smTitle">
							<h2>쪽지 보내기</h2>
						</div>
						<div id="smSection">
							<form id="sendMesForm" method="post">
								<table id="smTB">
									<tr>
										<td>
											<input type="text" name="smCname" id="smCname" readonly value="<%=company.getMemberName()%>">
											<input type="hidden" name="smCno" id="smCno" value="<%=company.getMno()%>">
										</td>
									</tr>
									<tr>
										<td>
											<textarea name="smContent" id="smContent" placeholder="쪽지 내용을 입력해주세요"></textarea>
										</td>
									</tr>
									<tr>
										<td>
											<div id="Btns">
												<div id="sendBtn">보내기</div>
												<div id="cancelBtn">취소하기</div>
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
					


					<div class="col-sm-2 sidenav2"></div>

				</div>
			</div>
		</div>
		</div>
		<!-- 커먼 풋터 -->
		<div class="footerArea">
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
		</div>
		
		<script>
			$(function(){
				$("#sendBtn").click(function(){
						
						if($("#smContent").val()==""){
			        		 alert('내용을 입력해주세요');
			        	 }else{
			        		 $("#sendMesForm").attr("action","<%=request.getContextPath()%>/toCompany.mes");
								$("#sendMesForm").submit();
			        	 }
				});
				$("#cancelBtn").click(function(){
					location.href="<%=request.getContextPath()%>/selectList.co";
				});
			});
		</script>
</body>
</html>
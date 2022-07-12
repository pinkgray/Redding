<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="com.kh.redding.message.model.vo.*, com.kh.redding.admin.model.vo.*, java.util.*"%>
<%
	Message mes = (Message)request.getAttribute("mes");
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
	href="${pageContext.request.contextPath}/css/admin/a_selectMes.css">	

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
				<div class="companyArea rM">
					<div id="receiveArea">
						<div id="receiveHeader">
							<h2>보낸 쪽지 내용</h2>
						</div>
						<div id="receiveSection">
							<table id="receiveTB">
								<tr>
									<td>
										<input type="text" name="smCname" id="smCname" readonly value="<%=mes.getMname()%>">
									</td>
								</tr>
								<tr>
									<td>
										<textarea id="receiveContent" name="receiveContent"readonly><%=mes.getMesContent() %></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2">
                            			<div id="reset">이전으로</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="col-sm-2 sidenav2"></div>

				</div>
			</div>
		</div>
		</div>
		<!-- 커먼 풋터 -->
		<div class="footerArea">
			<%@include file="/views/common/footer.jsp"%>
		</div>
		
		<script>
			$(function(){
				$("#sendBtn").click(function(){
					var answer = window.confirm('<%=mes.getMname()%>에게 쪽지를 보내겠습니까?');
					if(answer){
						$("#sendMesForm").attr("action","<%=request.getContextPath()%>/replycomp.mes");
						$("#sendMesForm").submit();
					}else{
						
					}
					
				});
				$("#cancelBtn").click(function(){
					location.href="<%=request.getContextPath()%>/selectList.co";
				});
				$("#reset").click(function(){
					location.href="<%=request.getContextPath()%>/views/admin/a_SendMessage.jsp";
				});
			});
		</script>
</body>
</html>
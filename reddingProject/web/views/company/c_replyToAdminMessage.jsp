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
	href="${pageContext.request.contextPath}/css/company/c_replyToAdminMessage.css">	

<title>REDDING♥</title>
</head>
<body>
	<div>
		<%@include file="/views/company/c_nav.jsp"%>
	</div>
	<div class="container-fluid text-center">
		<div class="row content">

			<div class="col-sm-2 sidenav1 visible-md visible-lg visible-sm">
	            <button id="sendMessageBtn" onclick="location.href='<%=request.getContextPath()%>/views/company/c_sendMessage.jsp'">쪽지 보내기</button><br><br>
	            <button id="receiveListMessageBtn" onclick="location.href='<%=request.getContextPath()%>/views/company/c_messageManager.jsp'">전체 쪽지</button><br><br>
	            <button id="receiveListMessageBtn" onclick="location.href='<%=request.getContextPath()%>/views/company/c_receiveListMessage.jsp'">받은 쪽지</button><br><br>
	            <button id="sendListMessageBtn" onclick="location.href='<%=request.getContextPath()%>/views/company/c_sendListMessage.jsp'">보낸 쪽지</button><br><br>
            
         	</div>

			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="companyArea rM">
					<div id="receiveArea">
						<div id="receiveHeader">
							<h2>관리자가 보낸 쪽지 내용</h2>
						</div>
						<div id="receiveSection">
							<table id="receiveTB">
								<%-- <tr>
									<td>
										<input type="text" name="smCname" id="smCname" readonly value="<%=mes.getMname()%>">
									</td>
								</tr> --%>
								<tr>
									<td>
										<textarea id="receiveContent" name="receiveContent"readonly><%=mes.getMesContent() %></textarea>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div id="sendMesToCompany">
						<div id="smTitle">
							<h2>쪽지 보내기</h2>
						</div>
						<div id="smSection">
							<form id="sendMesForm" method="post">
								<table id="smTB">
									<tr>
										<td>
											
											<input type="hidden" name="code" id="code" value="<%=mes.getMessageCode()%>">
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
		<!-- 커먼 풋터 -->
		<div class="footerArea">
			<%@include file="/views/common/footer.jsp"%>
		</div>
		
		<script>
			$(function(){
				$("#sendBtn").click(function(){
					if($("#smContent").val()==""){
		        		 alert('내용을 입력해주세요');
		        	 }else{
						$("#sendMesForm").attr("action","<%=request.getContextPath()%>/replyToAdmin.mes");
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
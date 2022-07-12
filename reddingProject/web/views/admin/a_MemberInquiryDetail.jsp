<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.redding.board.model.vo.*,java.util.*"%>
 <%
	ArrayList<HashMap<String , Object>> QnADetail = (ArrayList<HashMap<String , Object>>)request.getAttribute("QnADetail");
 	HashMap<String , Object> QnA = QnADetail.get(0);
	String memberName = (String)QnA.get("mname");
	String nickName = (String)QnA.get("nickname");
	Board board = (Board)QnA.get("QnA"); 
	System.out.println("QnA 22 :" + QnA);
	Reply answer = (Reply)QnA.get("reply");
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
	href="${pageContext.request.contextPath}/css/admin/InquiryDetail.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<script src="<%=request.getContextPath()%>/css/semantic/semantic.min.js"></script>	
<script src="<%=request.getContextPath()%>/css/semantic/jquery-3.4.1.min.js"></script>
<style>
</style>
<title>REDDING♥</title>
</head>
<body>
	<%-- <div>
		<%@ include file="/views/admin/a_nav.jsp"%>
	</div> --%>
	<%@ include file="/views/admin/a_sideNav.jsp" %>
	<div class="row content">

		<div class="visible-md visible-lg visible-sm">
			<div class="col-sm-3 sidenav1">
				<%-- <div class="sidenavArea">
					<ul class="navList">
						<li onclick="location.href='a_TotalMember.jsp'">전체 회원</li>
						<li onclick="location.href='a_MemberOrder.jsp'">주문내역</li>
						<li onclick="location.href='<%=request.getContextPath()%>/AllQnA.no'" style="color:lightgray; padding-left:25px">문의</li>
					</ul>
				</div> --%>
			</div>
		</div>
		
		<div class="visible-xs sideListnav2">
					<div class="col-sm-2 sidenav1">
						<%-- <div class="sidenavArea2">
						<ul class="navList2">
						<li onclick="location.href='a_TotalMember.jsp'" style="color:lightgray; padding-left:25px">전체 회원</li>
						<li onclick="location.href='a_MemberOrder.jsp'">주문내역</li>
						<li onclick="location.href='<%=request.getContextPath()%>/AllQnA.no'" style="color:lightgray; padding-left:25px">문의</li>
						</ul>
					</div> --%>
					</div>
					
					<br><br>
				</div>
				<div class="col-sm-9 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
					<br>
					<h2>문의내역</h2>
					<table class = "QuestionArea">
						<tr>
							<th>문의제목</th>
							<td><%=board.getBtitle() %></td>
							<th>진행상태</th>
							<td>
								<% Reply reply = (Reply)QnADetail.get(0).get("reply");
								if (reply.getReply_code() != 0){ %>
									<span style = "color:blue;">진행완료</span>
								<%}else{ %>
									<span style = "color:red;">진행중</span>
								<%} %>
							</td>
						</tr>
						<tr>
							<th>작성자(닉네임)</th>
							<td><%=memberName%>(<%=nickName %>)</td>
							<th>작성일</th>
							<td><%=board.getBdate() %></td>
						</tr>
						<tr>
							<th>내용</th>
							<th colspan = "3"></th>
						</tr>
						<tr>
							<td colspan = "10">
								<textArea rows = "5" cols = "50" readonly style= "margin:0;width : 200px; height:258px; resize:none; border : none;"><%=board.getBcontent() %></textArea>
							</td>
						</tr>
					</table>
					<hr>
					<h2>답변</h2>
						<% if (answer.getReply_code() == 0 ){ %>
						<form action ="<%=request.getContextPath()%>/sendReply.no" method = "post" id = "ReplyForm"> 
							<div class="form-group">
      							<!-- <label for="comment">답변:</label> -->
      							<input type = "hidden" name = "bid" value = "<%=board.getBid()%>">
      							<input type = "hidden" name = "mno" value = "<%=loginUser.getMno()%>"> 
      							<textarea class="form-control" rows="5" id="comment" name = "comment" style = "resize:none;width:100%"></textarea>
      							<br>
      							<button type = "button" id = "replySubmit">전송</button>
      							
    						</div>
    					 </form> 
    					 <% } %>
    					 <%
    					 	for(int i = 0 ; i < QnADetail.size() ; i++){
    					 		HashMap<String , Object> hmap = QnADetail.get(i);
    					 		Reply Answer = (Reply)hmap.get("reply");
    					 		if (Answer.getReply_code() != 0){
    					 %>
    					  <div class="panel panel-default">
    						<div class="panel-heading">관리자 (<%=Answer.getReply_date() %>)</div>
    						<div class="panel-body"><%=Answer.getReply_content() %></div>
    						<!-- <button type = "button" id = "updateReply">수정</button> -->
  						  </div>
  						  <% }
  						  } %>
				</div>
				<!-- <div class="col-sm-2 sidenav2"></div> -->
		</div>
	

		<!-- 커먼 풋터 -->
		<div class="footerArea">
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
		</div>
		
		<script>
			$(function(){
				
				$("#replySubmit").click(function(){
					if ($("#comment") == ""){
						alert("답변내용을 작성해주세요");				
					}else {
						$("#ReplyForm").submit();
					}
				});
				
				
			});
		
		</script>
</body>
</html>
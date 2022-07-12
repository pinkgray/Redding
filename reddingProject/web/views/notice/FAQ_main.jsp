<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import = "com.kh.redding.member.model.vo.* , java.util.*, com.kh.redding.board.model.vo.*"%>
<%
   ArrayList<Board> FAQList = (ArrayList<Board>)request.getAttribute("FAQList");
   BoardPageInfo pi = (BoardPageInfo) request.getAttribute("pi");
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
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
	href="${pageContext.request.contextPath}/css/notice/main_notice.css">
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

#Q{
	color : blue;
}

#A{
	color : red;
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
		<%@ include file="/views/member/m_header.jsp"%>
	</div><br>

	<!-- 멤버 나브 -->
	<div>
		<jsp:include page="/views/member/m_nav.jsp"></jsp:include>
	</div>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">
			
			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<div class="col-sm-8 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>

			<div class="container">
				<h2>FAQ</h2>
				<hr>
				<table class = "noticetable">
					<tbody>
						<% if(FAQList != null || FAQList.size() > 0){ %>
						<% for(int i = 0 ; i < FAQList.size() ; i++) { 
							Board faq = FAQList.get(i);
						%>
						<tr id = "noticeTitle" onclick = "NoticeClick(this);">
							<td><span id = "Q">Q</span>&nbsp;&nbsp;<%=faq.getBtitle() %></td>
						</tr>
						<tr id = "noticecontent" style = "display:none;">
							<td colspan = "4">
								<span id = "A">A</span>
								<p id = "noticeContent">
									<%=faq.getBcontent() %>
								</p>
								<% if(loginUser != null && loginUser.getMemberType() == 90){  %>
								<button id = "noticeModify" onclick = "location.href='<%=request.getContextPath()%>/selectFAQone.no?num=' + <%=faq.getBid()%>">수정하기</button>
								<%} %>
							</td>
						</tr>
						<%} %>
						<%} %>
					</tbody>
				</table>
					<div class = "notice_footer">
					<!-- 페이지 버튼 처리 -->
						<div class="pagingArea" align="center">
						<button onclick="location.href='<%= request.getContextPath() %>/selectnotice.no?currentPage=1'"><<</button>
						<% if(currentPage <= 1) { %>
						<button disabled><</button>
						<% } else { %>
						<button onclick="location.href='<%= request.getContextPath() %>/selectnotice.no?currentPage=<%= currentPage - 1 %>'"><</button>
						<% } %>
						
						<% for(int p = startPage; p <= endPage; p++) { 
								if(p == currentPage) { %>
									<button disabled><%= p %></button>
						<% 		}else {%>
									<button onclick="location.href='<%= request.getContextPath() %>/selectnotice.no?currentPage=<%= p %>'"><%= p %></button>
						<%		} %>
							
						<% } %>
						
						<% if(currentPage >= maxPage) { %>
						<button disabled>></button>
						<% } else { %>
						<button onclick="location.href='<%= request.getContextPath() %>/selectnotice.no?currentPage=<%= currentPage + 1 %>'">></button>
						<% } %>
						<button onclick="location.href='<%= request.getContextPath() %>/selectnotice.no?currentPage=<%= maxPage %>'">>></button>
						</div>
						<div class = "notice_writer">
						<% if(loginUser != null &&  loginUser.getMemberType() == 90){  %>
						<button id = "writerbtn">글쓰기</button>
						<%} %>
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
		function NoticeClick(obj){
			var tr = $(obj);
			var sub = tr.next();
			
			if(sub.is(":visible")){
				sub.slideUp();
			}else{
				sub.slideDown();
			}
			
		}
		
		
		$(function(){
			$("#writerbtn").click(function(){
				location.href = "<%=request.getContextPath()%>/views/notice/FAQInsert.jsp";
			});
		});
	</script>

</body>
</html>

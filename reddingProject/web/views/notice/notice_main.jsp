<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "com.kh.redding.member.model.vo.* , java.util.*, com.kh.redding.board.model.vo.*"%>
<%
   Member loginUser = (Member) session.getAttribute("loginUser");
   ArrayList<HashMap<String , Object>> NoticeList = (ArrayList<HashMap<String , Object>>)request.getAttribute("NoticeList");
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
		<jsp:include page="/views/member/m_header.jsp"></jsp:include>
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
				<h2>공지사항</h2>
				<hr>
				<table class = "noticetable">
					<thead>
						<tr>
							<th>NO </th>
							<th>작성자</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<% if(NoticeList != null || NoticeList.size() > 0){ %>
							<% for(int i = 0 ; i < NoticeList.size() ; i++) { 
								HashMap<String, Object> hmap = NoticeList.get(i);
							%>
						<tr id = "noticeTitle" onclick = "NoticeClick(this);">
							<% Board board = (Board)hmap.get("board"); %>
							<td><%= hmap.get("num") %><input type = "hidden" value = "<%=board.getBid() %>" name = "bid"></td>
							<td><%=hmap.get("name") %><input type = "hidden" value = "<%=board.getBwriter() %>" name = "bwriter"></td>
							<td><%=board.getBtitle() %></td>
							<td><%=board.getBdate() %></td>
							<td><%=board.getBcount() %></td>
						</tr>
						<tr id = "noticecontent" style = "display:none;">
							<td colspan = "4">
								<p id = "noticeContent">
								<%= board.getBcontent() %>
								</p>
								<% if(loginUser != null &&  loginUser.getMemberType() == 90){  %>
								<button id = "noticeModify" onclick = "location.href='<%=request.getContextPath()%>/selectnoticeone.no?num=' + <%=board.getBid()%>">수정하기</button>
								<%} %>
							</td>
						</tr>
						<%} %>	
					<%}else { %>
						<tr id = "noticeTitle">
							<td colspan = "4">등록된 게시물이 없습니다.</td>
						</tr>
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
			var bid = $(obj).children().children().val();
			var bcount = $(obj).children().eq(4);
			
			if(sub.is(":visible")){
				sub.slideUp();
			}else{
				/* sub.slideDown(); */
		
				console.log(bid);
				
				<% if ((loginUser != null && loginUser.getMemberType() != 90)){%>
					$.ajax({
	          			url : "/redding/updateNoticecnt.no",
	          			type : "post",
	          			data : {bid : bid},
	          			success : function(data){			
	          				bcount.html(data);
	          				
	          	   			console.log(bcount);
	          				
	          				sub.slideDown();
	          	                    
	          			}, 
	          			error : function(){
	          				console.log("실패!");
	          			}
	          		});
				<%}else if(loginUser == null) {%>
					$.ajax({
	          			url : "/redding/updateNoticecnt.no",
	          			type : "post",
	          			data : {bid : bid},
	          			success : function(data){			
	          				bcount.html(data);
	          				
	          	   			console.log(bcount);
	          				
	          				sub.slideDown();
	          	                    
	          			}, 
	          			error : function(){
	          				console.log("실패!");
	          			}
	          		});
				<%}else {%>
					sub.slideDown();
				<%}%>
			}
			
		}
		
		function ModiClick(){
			
		}
		
		$(function(){
			
			$("#writerbtn").click(function(){
				location.href = "<%=request.getContextPath()%>/views/notice/noticeInsert.jsp";
			});
			
		});
	</script>

</body>
</html>

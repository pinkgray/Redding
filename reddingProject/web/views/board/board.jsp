<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.redding.board.model.vo.*, java.util.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
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
	rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<style>
.container {
	width: 100%;
	color: salmon;
	font-family: 'Noto Sans KR', sans-serif;
}

.row.content {
	height: 490px;
}

.sidenav {
	height: 100%;
}

.atag{
	text-decoration : none;
	color : black;
	
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

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<%-- <jsp:include page="/views/member/m_header.jsp"></jsp:include> --%>
		<%@ include file="/views/member/m_header.jsp"%>
	</div>
	<br>

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
			<%-- 	<form action="<%=request.getContextPath()%>/selectBoardList.bo"> --%>
					<br> <br>
					<div id="board">
						<form action = "<%=request.getContextPath()%>/searchBoard.bo" method = "post" id = "searchBoardform">
						<div class="input-append span12" align="right">
							<button type="button" id = "StoryBtn" 
							class="btn btn-outline-success slideright">수다쟁이</button>
							<button type="button" id = "QuestionBtn" 
							class="btn btn-outline-success slideright">질문있어요</button>
							<select name = "selectType"  style="height:32px;border:1px solid gray;">
								<option>-선택-</option>
								<option value ="Title">제목</option>
								<option value = "Writer">작성자</option>
								<option value = "Content">내용</option>
							</select>
							<input name = "serachText" type="text" class="search-query" placeholder="Search" style="height:32px; border:1px solid gray;">
							<button type="button" class="btn" id = "SearchBtn">
								<i class="fas fa-search"></i>
							</button>
						</div>
						</form>
						<table class="table table-striped" style="width: 100%;">
							<thead>
								<tr>
									<th>글번호</th>
									<th>카테고리</th>
									<th>제목</th>
									<th>작성자</th>
									<th><a class= "atag" href = "<%=request.getContextPath()%>/selectBoardList.bo">작성일</a></th>
									<th><a class= "atag" href = "<%=request.getContextPath()%>/ManyLookUp.bo">조회수</a></th>
									<th><a class= "atag" href = "<%=request.getContextPath()%>/ManyLike.bo">좋아요</a></th>
								</tr>
							</thead>
							<tbody>

								<%
									HashMap<String, Object> hmap = null;
									for (int i = 0; i < list.size(); i++) {
										hmap = list.get(i);
								%>
								<tr>
									<td><input type = "hidden" value = "<%=hmap.get("bid")%>" id = "bid" name= "bid">
									<%=hmap.get("no")%></td>
									<td><%=hmap.get("bcategory") %></td>
									<td><%=hmap.get("btitle")%></td>
									<td><%=hmap.get("bwriter")%></td>
									<td><%=hmap.get("bdate")%></td>
									<td><%=hmap.get("bcount")%></td>
									<td><%=hmap.get("blike")%></td>
								</tr>
								<%
									}
								%>

							</tbody>
						</table>
						<!-- <hr style="align:center; border-color:black; width:100%;" > -->
						<% if (loginUser != null){ %>
						<% if (loginUser.getMemberType() == 10){ %>
						<a class="btn btn-default" style="margin-left: 10%"
							onclick="location.href='<%=request.getContextPath()%>/views/board/boardWrite.jsp'">글쓰기</a>
						<%} 
						}%>
						<div class="text-center">
							<ul class="pagination">
								<button onclick="location.href='<%=request.getContextPath() %>/selectBoardList.bo?currentPage=1'"><<</button>
								<% if(currentPage <= 1){ %>
								<button disabled><</button>
								<% }else{ %>
								<button onclick="location.href='<%=request.getContextPath() %>/selectBoardList.bo?currentPage=<%=currentPage - 1%>'"><</button>
								<% } %>
								
								<% for(int p = startPage; p <= endPage; p++){
									if(p == currentPage){%>
										<button disabled><%= p %></button>
								<% }else{ %>
									<button onclick="location.href='<%=request.getContextPath() %>/selectBoardList.bo?currentPage=<%= p %>'"><%= p %></button>
								<% } %>
								<% } %>
								
								<% if(currentPage >= maxPage){ %>
								<button disabled>></button>
								<% }else{ %>
								<button onclick="location.href='<%=request.getContextPath() %>/selectBoardList.bo?currentPage=<%=currentPage + 1 %>'">></button>
								<% } %>
								<button onclick="location.href='<%=request.getContextPath() %>/selectBoardList.bo?currentPage=<%=maxPage %>'">>></button>
							</ul>
						</div>
					</div>
				<!-- </form> -->
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
		$(function(){
			//$("#BoardSearch").hide();
			
			$(".table-striped td").mouseenter(function(){
				$(this).parent().css({"background":"salmon", 
									"cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"none"});
			}).click(function(){
				var num = $(this).parent().children().eq(0).children().val();
				
				console.log(num);
				
				location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num; 
			});
			
			$("#StoryBtn").click(function(){
				var category = "수다쟁이";
				
				location.href = "<%=request.getContextPath()%>/BoardStory.bo?category=" + category
			});
			
			$("#QuestionBtn").click(function(){
				var category = "질문있어요";
				
				location.href = "<%=request.getContextPath()%>/BoardStory.bo?category=" + category
			});
			
			$("#SearchBtn").click(function(){
				$("#searchBoardform").submit();
			});
			
			
			
			
		})
	</script>
</body>
</html>
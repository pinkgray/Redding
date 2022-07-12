<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "java.util.* , com.kh.redding.board.model.vo.*"  %>
<% 
ArrayList<HashMap<String, Object>> QnAList = (ArrayList<HashMap<String, Object>>)request.getAttribute("QnAList");
BoardPageInfo pi = (BoardPageInfo) request.getAttribute("pi");
int Allcount = (int) request.getAttribute("Allcount");
int CompleteCount = (int)request.getAttribute("CompleteCount");
int ProgressCount = Allcount - CompleteCount;
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
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
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a_main.css"> --%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a_memberInquiry.css">
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
		<jsp:include page="/views/admin/a_nav.jsp"></jsp:include>
	</div> --%>
	<%@ include file="/views/admin/a_sideNav.jsp" %>
	<div class="container-fluid text-center">
		<div class="row content">

		<div class="visible-md visible-lg visible-sm">
			<div class="col-sm-2 sidenav1">
				<%-- <div class="sidenavArea">
					<ul class="navList">
						<li onclick="location.href='<%=request.getContextPath() %>/selectList.me'">전체 회원</li>
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
						<li onclick="location.href='<%=request.getContextPath()%>/AllQnA.no'" style="color:lightgray; padding-left:25px">문의</li>
						</ul>
					</div> --%>
					</div>
					
					<br><br>
				</div>
			

			<div class="col-sm-10 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="inquiryArea">
					<div class="inquiryNum">
						<br>
						<table id="inquiryNumt">
							<tr>
								<td width="250" style="background: salmon; color : white;" id = "QnAAllList">문의내역</td>
								<td width="100"><%=Allcount %></td>
								<td width="250" style="background: salmon;color : white;" id = "QnAProgress">진행중</td>
								<td width="100"><%=ProgressCount %></td>
								<td width="250" style="background: salmon; color : white;" id = "QnAComplete">진행완료</td>
								<td width="100"><%=CompleteCount %></td>
							</tr>
						</table>
					</div>
					<br>

					<h4 id="text1">문의 내역 조회</h4>
					<br> <br> <br>
					<div class="inquiryList">
						<form action = "<%=request.getContextPath()%>/searchQnA.no" method = "Post" id ="searchForm">
							<div class="ui category search">
								<div class="ui icon input" style = "margin-bottom: 3%;">
									<select name = "searchType" id = "searchType">
										<option>-선택-</option>
										<option value = "Code">문의번호</option>
										<option value = "Name">작성자</option>
										<option value = "NickName">닉네임</option>
										<option value = "Category">카테고리</option>
									</select> 
									<input type = "text" style = "width: 120px" name = "searchText" id = "searchText">
									<button type = "button" id = "searchBtn">검색</button>
								</div>
							</div>
						</form>	
					<div>
						<table id="inquiryListt">
							<tr style="background: salmon; color : white;">
								<td>문의 접수번호</td>
								<td>카테고리</td>
								<td>문의제목</td>
								<td>회원이름</td>
								<td>회원 닉네임</td>
								<td>진행상태</td>
								<!-- <td></td> -->
							</tr>
							<% if (QnAList == null || QnAList.size() == 0){ %>
							<tr>
								<td></td>
								<td colspan= "5">작성된 문의가 없습니다.</td>
								<td></td>
							</tr>
							<%}else { 
								int bid = 0;
							%>
							<% for (int i = 0 ; i < QnAList.size() ; i++){ 
								HashMap Qmap = QnAList.get(i);
								Board QnA = (Board)Qmap.get("QnA");
								Reply reply = (Reply)Qmap.get("reply");
								String memberid = (String)Qmap.get("memberId");
								String nickname = (String)Qmap.get("NickName");
								int no = (int)Qmap.get("num");
							%>
							<tr onclick = "location.href= '<%=request.getContextPath()%>/QnAOne.no?no='+<%=QnA.getBid()%>">
									<% if (bid != QnA.getBid()){ %>
									<td><%=QnA.getBid() %>
									<td><%=QnA.getBcategory() %></td>
									<td><%=QnA.getBtitle() %></td>
									<td><%=memberid %></td>
									<td><%=nickname %></td>
									<%if(reply == null || reply.getReply_code() == 0){%>
									<td><a class="ui red label">진행중</a></td>
									<%}else { %>
									<td><a class="ui blue label">진행완료</a></td>
									<%} %>
									<% bid = QnA.getBid();
									} %>
							</tr>
							<%} %>
						<%} %>
							
						</table>
						</div>
						<br>
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
						<button onclick="location.href='<%= request.getContextPath() %>/selectnotice.no?currentPage=<%= maxPage %>'">>></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<br> <br> <br> <br>



					</div>

				</div>
		</div>
		</div>
				<div class="col-sm-2 sidenav2"></div>
		</div>

		<!-- 커먼 풋터 -->
		<div class="footerArea">
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
		</div>
		
		
		<script>
		
			$(function(){
				
				$("#QnAAllList").click(function(){
					location.href= "<%=request.getContextPath()%>/AllQnA.no";
				});
				
				$("#QnAProgress").click(function(){
					location.href = "<%=request.getContextPath()%>/QnAProgress.no";
				});
				
				$("#QnAComplete").click(function(){
					location.href = "<%=request.getContextPath()%>/QnAComplete.no";
				});
				
				
				$("#searchBtn").click(function(){
					var text = $("#searchText").val();
					var type = $("#searchType").val();
					
					if (type == "-선택-"){
						alert("검색할 내용을 선택해주세요");
					}else if (text == ""){
						alert("검색할 타입을 선택해주세요");
					}else {
						$("#searchForm").submit();
					}
					
				});
				
			});
		
		</script>
</body>
</html>
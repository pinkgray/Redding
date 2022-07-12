<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "com.kh.redding.board.model.vo.*, java.util.* , com.kh.redding.attachment.model.vo.*"%>
<% 
HashMap<String , Object> boardMap = (HashMap<String,Object>)request.getAttribute("b"); 
HashMap<String , Object> boardDetail = (HashMap<String, Object>)boardMap.get("board");
ArrayList<Attachment> attachlist = (ArrayList<Attachment>)boardMap.get("attachlist");
//if (boardMap.get("replylist") != null){
ArrayList<HashMap<String , Object>> replylist = (ArrayList<HashMap<String , Object>>)boardMap.get("replylist");	
//}
Board board = (Board)boardDetail.get("board");
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/boardLook.css">
<style>
.container {
	width: 100%;
	color: salmon;
	font-family: 'Noto Sans KR', sans-serif;
}

.bntclass{
	background : salmon;
	outline : 0 ; 
	border : none;
	color : white;
	
}

.bntclass:hover{
	background : white;
	color : salmon;
}


.row.content {
	height: 490px;
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
				<div class="b_title" style="width:100%; height:auto;">
					<div style="width:50%; height:auto; float:left; font-size:30px; margin-top:18px;">
						<i class="fas fa-edit">Community</i>					
					</div>
					<div style="width:50%; height:auto; float:right;">
						<ul class="pager" style="float:right;">
						<li><button type="button" class="btn" onclick="location.href='<%=request.getContextPath() %>/selectBoardList.bo'" style="background:salmon; color:white;">목록</button></li>
  							<!-- <li><a href="#"><</a></li>
  							<li><a href="#">></a></li> -->
						</ul>
					</div>
					<hr style="width:100%; border: solid 3px black;">
					<div style="width:100%; height:auto;">
						<h3 style="color:salmon"><%=board.getBcategory() %></h3>
						<h3><%=board.getBtitle() %></h3>
						<% if (loginUser != null){ %>
						<% if (loginUser.getMno() == board.getBwriter()){ %>
						<!-- 	<button type= "button" id = "boardUpdate" style = "margin-left : 80%">수정</button> -->
						<% }%>
						<% if (loginUser.getMno() == board.getBwriter() || loginUser.getMemberId() == "admin"){ %>
							<button type= "button" id = "boardDel" style = "margin-left : 90%" class = "bntclass">삭제</button>
						<%} %>
						<% } %>
					</div>
					<hr style="width:100%; border: solid 1px lightgray;">
					<div style="width:100%; height:auto;">
						<table class = "boardTable">
							<tr>
								<th>작성자</th><td><%=boardDetail.get("nickName") %>(<%=boardDetail.get("mid")%>)</td>
								<th>작성일자</th><td><%=board.getBdate() %> </td>
							</tr>
							<tr>
								<th>조회수</th><td><%=board.getBcount() %></td>
								<th><button id = "like" type= "button">추천</button></th><td id = "blike"><%=board.getBlike() %></td>
								<th><button id = "hate" type= "button">신고</button></th>
							</tr>
						</table>
					</div>
					<hr style="width:100%; border: solid 1px lightgray;">
					<div>
						<p><%=board.getBcontent() %></p>
					</div>
					<hr>
					<h3>images</h3>
					<div>
						 <div class="row">
							  <% if(attachlist.size() > 0 && attachlist != null){ %>
							  <% for(int i = 0 ; i < attachlist.size() ; i++){ 
								  Attachment attach = (Attachment)attachlist.get(i);
								  
								  String filePath = attach.getFilepath();
								  String changename = attach.getChangename();
							  %>
							 <div class="col-md-4">
							    <div class="thumbnail">
							      <a href="/redding/board_upload/<%=changename%>">
							        <img src="/redding/board_upload/<%=changename %>"  style="width:100%">
							        <div class="caption">
							        </div>
							      </a>
							    </div>
							  </div>
							  <%} %>
							<%} %>
						</div>
					</div>
					<% if (loginUser != null){ %>
					<form action = "<%=request.getContextPath() %>/insertReply.bo" method = "post" id = "Replysubmit">
						<div class="form-group" style="width:100%;">
							<label for="comment">댓글</label><br>
							<input type = "hidden" id = "mno" name = "mno" value = "<%=loginUser.getMno()%>">
							<input type = "hidden" id = "bid" name = "bid" value = "<%=board.getBid()%>">
							<textarea class="form-control" rows="3" id="comment" name = "comment" style="width:90%; float:left; resize : none;"></textarea>
							<button type="button" class="btn btn-default" id = "replybtn" style="width:8%; height:75px; float:right;">등록</button>
						</div>
					</form>
					<% if(replylist != null && replylist.size() > 0 ){%>
					<% for(int i = 0 ; i < replylist.size() ; i++){ 
						HashMap<String , Object> replyMap = (HashMap<String , Object>)replylist.get(i);
						Reply reply = (Reply)replyMap.get("reply");
						String nickname = (String)replyMap.get("nickname");
						String mid = (String)replyMap.get("mid");
					%>	
						<% if (i != 0){ %>
						<div class = "replyWrap" id = "replyWrap">
						<hr style="width:100%; border: solid 1px lightgray;">
						<%}else { %>
						<br><br><br>
						<%} %>
							<div class="media">
								
						  		<div class="media-body">
								  	<input type = "hidden" id = "replycode" value = "<%=reply.getReply_code() %>">
								    <p class="media-heading"><%=nickname %> (<%=mid %>) </p>
								    <h4>
								    <textArea id = "replycontent" name = "replycontent" class = "replycontent" style = "border:none;width:100%;resize:none;height:auto;" readonly><%= reply.getReply_content() %></textArea>
								    </h4>
								    <% if(loginUser.getMemberId().equals(mid)){%>
								    	<button type = "button" id = "replyUpdate" class = "bntclass">수정</button>
								   		<button type = "button" id = "replyChange" class = "changebtn">변경</button>
								    <%} %>
								    <% if (loginUser.getMemberId().equals(mid) || loginUser.getMemberId().equals("admin")){ %>
								    	<button type = "button" id = "replydelete" class = "bntclass">삭제</button>
								    <%} %>
						  		</div>
						  		
							</div>
						</div>
						<%} %>
					<%} %>
				<%} %>
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
			
			
			<% if (loginUser == null){ %>
				alert("로그인해주세요");
				location.href = "<%=request.getContextPath()%>/views/common/login.jsp"
			<% } %>
			
			$(".changebtn").hide();
			
			
			$("#replybtn").click(function(){
				<% if (loginUser.getMemberType() != 10 ){ %>
					alert("회원만 댓글이 가능합니다.");
				<%}else{%>
					$("#Replysubmit").submit();
				<%}%>
			});
			
			$("#like").click(function(){
				var bid = <%=board.getBid() %>
				$.ajax({
          			url : "/redding/likeBoard.bo",
          			type : "post",
          			data : {bid : bid},
          			success : function(data){
          				 $("#blike").text(data);
          			}, 
          			error : function(){
          				console.log("실패!");
          			}
          		});
			});
			
			
			
			$(document).on("click", "#replyUpdate", function(){
				var replycode = $(this).parent().children().eq(0).val();
				var replycontent = $(this).parent().children().eq(2).children();
				
				replycontent.attr("readonly", false);
				replycontent.css("border" , "1px solid lightgray");
				
				console.log("code:" + replycode);
				
				var changeBtn = $(this).parent().children().eq(4);
				var deleteBtn = $(this).parent().children().eq(5);
				
				$(this).hide();
				deleteBtn.hide();
				changeBtn.show();
			
			});
			
		
			
			
			$(document).on("click", "#replyChange", function(){
				var replycode = $(this).parent().children().eq(0).val();
				
				var replycontent = $(this).parent().children().eq(2).children().val();
				
				console.log(replycode + ":" + replycontent);
				
				var changeBtn = $(this).parent().children().eq(3);
				var deleteBtn = $(this).parent().children().eq(5);
				
				$.ajax({
          			url : "/redding/upreply.bo",
          			type : "post",
          			data : {replycode : replycode, replycontent : replycontent},
          			success : function(data){
          				if (data != "fail"){
          					$(this).parent().children().eq(2).children().text(replycontent);
          				}else {
          					alert("변경 실패했습니다. ㅜㅜ")
          				}
          			
          			}, 
          			error : function(){
          				console.log("실패!");
          			}
          		});
				
				$(this).hide();
				deleteBtn.show();
				changeBtn.show();
				
			});
			
			$(document).on("click", "#replydelete", function(){
				var replycode = $(this).parent().children().eq(0).val();
				var media = $(this).parent().parent();
				
				$.ajax({
          			url : "/redding/delreply.bo",
          			type : "post",
          			data : {replycode : replycode},
          			success : function(data){
          				if (data != "fail"){
          					media.remove();
          				}else {
          					alert("변경 실패했습니다. ㅜㅜ")
          				}
          			
          			}, 
          			error : function(){
          				console.log("실패!");
          			}
          		});
				
			});
			
			
			$("#boardDel").click(function(){
				location.href = "<%=request.getContextPath()%>/boardDel.bo?num=<%=board.getBid()%>";
			});
			
			$("#boardUpdate").click(function(){
				location.href = "<%=request.getContextPath()%>/detail.bo?num=<%=board.getBid()%>";
			})
			
		});
		
	
		
		
	
	</script>

</body>
</html>
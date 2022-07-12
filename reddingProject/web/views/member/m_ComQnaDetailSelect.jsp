<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.*, com.kh.redding.company.model.vo.*, com.kh.redding.attachment.model.vo.*, com.kh.redding.product.model.vo.*, com.kh.redding.board.model.vo.*, java.util.*"%>
<%
	/* int cno = Integer.parseInt(request.getParameter("cno")); */
	/*ArrayList<HashMap<String, Object>> blist = (ArrayList<HashMap<String, Object>>) request.getAttribute("blist");
	HashMap<String, Object> list = blist.get(blist.size()-1);
	ArrayList<Product> prolist = (ArrayList<Product>)list.get("Product");
	ArrayList<Attachment> attachlist = (ArrayList<Attachment>)list.get("Attachment");
	Company com = (Company)list.get("Company");
	Member mem = (Member)list.get("Member");
	String companyAddress = "";
	Product pro = null;
	M_ComQnaListPageInfo cqlpi = (M_ComQnaListPageInfo) request.getAttribute("cqlpi");
	int currentPage = cqlpi.getCurrentPage();
	int maxPage = cqlpi.getMaxPage();
	int startPage = cqlpi.getStartPage();
	int endPage = cqlpi.getEndPage(); */
	//Board b = (Board)request.getAttribute("b");
	ArrayList<HashMap<String, Object>> ComQnaDetail = (ArrayList<HashMap<String, Object>>)request.getAttribute("ComQnaDetail");
	HashMap<String, Object> comQnA = ComQnaDetail.get(0);
	String memberName = (String)comQnA.get("mname");
	Board board = (Board)comQnA.get("comQnA");
	Reply answer = (Reply)comQnA.get("reply");
	int cno = (int) session.getAttribute("cno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REDDING♥</title>
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
   href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/common/footer.css">

<style>
.container {
   color: salmon;
   width: 100%;
   argin-left: auto;
   margin-right: auto;
   text-align: center;
   font-family: 'Noto Sans KR', sans-serif;
}

.row.content {
   height: 450px;
}

.sidenav {
   height: 100%;
}

.productlist {
   margin-left: auto;
   margin-right: auto;
   text-align: center;
   font-size: 30px;
   border: 1px solid salmon;
}

table {
   border-collapse: collapse;
   width: 100%;
}

/* td {
   border: 1px solid salmon;
} */

.result {
   text-align: center;
   color: salmon;
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
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
   <!-- 멤버 헤더 (미니메뉴, 로고) -->
   <div class="headerArea">
   </div>
   	  <%@ include file="/views/member/m_header.jsp" %>
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
            <%---------------------------------------------------------------------------------------------------------------%>
            <div class="container post post-show" style="width:100%; height:auto;"><br><br>
			   <div class="buttons" style="width:100%">
			    <a class="btn btn-default" onclick="location.href='<%=request.getContextPath() %>/selectDetailComQna.cq?cno=<%=cno%>'" style="float:left">목록으로</a>
			    <form action="<%=request.getContextPath() %>/DeleteQna.dq" method="post" id = "deleteForm">
			    <input type="hidden" name="cno" id="cno" value=<%=cno %>>
			    <input type="hidden" name="bid" id="bid" value=<%=board.getBid() %>>
			    <a class="btn btn-default" id = "deleteQnA" style="float:left">삭제하기</a>
			    </form>
			   </div>
			<br><br>
            <h1 style="font-family: 'Noto Sans KR', sans-serif;">"무엇이든 물어보세요"</h1>
			   <div class="contentBox" style="width:100%"><br>
			    <h3 class="contentBoxTop">제목: <%=board.getBtitle() %></h3><br><br>
			    <div class="row">
			     <div class="col-sm-4 col-sm-push-8">
			      <div class="post-info">
			       <div><span>작성자</span> : <%=memberName %></div>
			       <%-- <% if(post.updatedAt) { %> --%>
			        <div><span>작성날짜</span> : <%=board.getBdate() %></div>
			       <%-- <% } %> --%>
			      </div> <!-- post-info end -->
			     </div> <!-- col end-->
			     <div class="col-sm-8 col-sm-pull-4" style="width:100%;"><br><br>
			      <%=board.getBcontent() %>
			     </div> <!-- col end-->
			    </div> <!-- row end -->
			    <hr style="border-color: black; width:100%;">
			    	<h1 style="width:100%;">답변</h1>
			    	<% if(answer.getReply_code() == 0) { %>
			    	<form action = "<%=request.getContextPath() %>/insertComQnaReply.qr" method = "post" id ="ReplyForm">
			    <div class="form-group">
			    <input type = "hidden" name = "bid" value = "<%=board.getBid()%>">
			    <input type = "hidden" name = "mno" value = "<%=loginUser.getMno()%>">
					<textarea class="form-control" rows="3" id="comment" name = "content" style="width:92%; float:left;"></textarea>
					<button type="button" id = "replySubmit" class="btn btn-default" style="width:8%; float:right;">등록</button>
				</div>
				</form>
				<%} %>
				<%
					for(int i = 0; i < ComQnaDetail.size(); i++){
						HashMap<String, Object> hmap = ComQnaDetail.get(i);
						Reply Answer = (Reply)hmap.get("reply");
						if(Answer.getReply_code() != 0){
				%>
				<div class="panel panel-default" style="width:100%;">
				  <div class="panel-heading">업체 (<%=Answer.getReply_date()%>)</div>
				  <div class="panel-body"><%=Answer.getReply_content() %></div>
				</div>
				<% } } %>
			   </div> <!-- post-container end -->

  			</div> <!-- container end -->
            
            <%---------------------------------------------------------------------------------------------------------------%>
         </div>

         <!-- 오른쪽 빈공간 -->
         <div class="col-sm-2 sidenav"></div>

      </div>
	</div>
   </div>
   <br>

   <!-- 커먼 풋터 -->
   <div class="footerArea">
      <jsp:include page="/views/common/footer.jsp"></jsp:include>
   </div>
   
   <script>
   		$(function(){
   			$("#deleteQnA").click(function(){
   				$("#deleteForm").submit();
   			});
   		})
   		
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
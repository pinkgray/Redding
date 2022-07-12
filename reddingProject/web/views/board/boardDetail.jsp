<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "java.util.* , com.kh.redding.board.model.vo.* , com.kh.redding.attachment.model.vo.*"%>
<% 
	HashMap<String , Object> boardMap = (HashMap<String , Object>)request.getAttribute("b");
	HashMap<String , Object> boardDetail = (HashMap<String, Object>)boardMap.get("board");
	ArrayList<Attachment> attachlist = (ArrayList<Attachment>)boardMap.get("attachlist");
	Board board = (Board)boardDetail.get("board");
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
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<style>
.container {
	width: 100%;
	color: salmon;
	font-family: 'Noto Sans KR', sans-serif;
}

.row.content {
	height: 450px;
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
	
	<% if (loginUser != null){ %>
	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">

			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<h2>게시글 작성</h2>

				<div class="container">
					<!-- Login Form -->
					<div class="row">
				  <!-- Blog Entries Column -->
					  <div class="col-md-12 my-order">
						<div class="content-section">
							<form name="w_form" action="<%=request.getContextPath() %>/insert.bo" method="post"  encType= "multipart/form-data" id = "insertCommunity">
								<fieldset class="form-group">
									<legend class="border-bottom mb-4">New Post</legend>
									<div class="form-group">
											<label class="form-control-label">Category</label>
											<br>
											<select style = "color:black; width: 100%; height : 30px; border-radius : 3%;" name = "category" id = "category">
												<option>선택하세요</option>
												<option>수다쟁이 </option>
												<option>질문있어요</option>
											</select>
									</div>
									<div class="form-group">
											<label class="form-control-label">Title</label>
											<input class="form-control form-control-lg" name = "title" id = "title" type="text" value = "<%=board.getBtitle()%>">
									</div>
									<div class="form-group">
											<label class="form-control-label">Writer</label>
											<input class="form-control form-control-lg" type="text" name = "nickname" value = "<%=loginUser.getNickName()%>" readonly>
											<input type = "hidden" value = "<%=loginUser.getMno()%>" id = "mno" name = "mno">
									</div>
									<div class="form-group">
											<label class="form-control-label">Content</label>
									 		<textarea style="width: 100%; color: black;" rows="10" name="content" id="textAreaContent" cols="80"><%=board.getBcontent() %></textarea>
									</div>
									<div class="form-group">
											<label class="form-control-label">Images</label><br>											
											<img src = "/redding/images/noimg.gif" style = "width : 100%; height : 100%; max-width: 120px; max-height:120px;" id = "img1">
											<img src = "/redding/images/noimg.gif" style = "width : 100%; height : 100%; max-width: 120px; max-height:120px;" id = "img2">
											<img src = "/redding/images/noimg.gif" style = "width : 100%; height : 100%; max-width: 120px; max-height:120px;" id = "img3">
											<img src = "/redding/images/noimg.gif" style = "width : 100%; height : 100%; max-width: 120px; max-height:120px;" id = "img4">
									</div>
									<div class="form-group">
											<button class="btn btn-outline-info" type="button" style="background:salmon; color:white;">이전으로</button>
											<button type = "button" id = "sendBoard" class="btn btn-outline-info"  style="background:salmon; color:white;">글등록</button>
									</div>		
								</fieldset>
								<div id = "fileArea" align = "left">
									<input type = "file" id = "imgfile1" name = "imgfile1" onchange = "loadImg(this,1)">
									<input type = "file" id = "imgfile2" name = "imgfile2" onchange = "loadImg(this,2)">
									<input type = "file" id = "imgfile3" name = "imgfile3" onchange = "loadImg(this,3)">
									<input type = "file" id = "imgfile4" name = "imgfile4" onchange = "loadImg(this,4)">
								</div>
							</form>
						</div>
						</div>
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
	
	<%}else { 
		request.setAttribute("msg", "잘못된 경로접근입니다.");
		request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
	}%>
	<script>
		$("#fileArea").hide(); 
	
		$("#img1").click(function(){
			$("#imgfile1").click();
		});
		
		$("#img2").click(function(){
			$("#imgfile2").click();
		});
		
		$("#img3").click(function(){
			$("#imgfile3").click();
		});
		
		$("#img4").click(function(){
			$("#imgfile4").click();
		});
		
		function loadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					switch (num) {
					case 1:
						$("#img1").attr("src", e.target.result);
						break;
					case 2 : 
						$("#img2").attr("src" , e.target.result);
						break;
					case 3 : 
						$("#img3").attr("src" , e.target.result);
						break;
					case 4 : 
						$("#img4").attr("src" , e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
		
		$(function(){
			$("#sendBoard").click(function(){
				
				if ($("#category").val() == "선택하세요"){
					alert("카태고리 선택해주세요");
				}else if ($("#title").val() == ""){
					alert("제목 작성해주세요");
				}else {
					$("#insertCommunity").submit();			
				}
				
			});
			
			
		
			
		});
		
		
	</script>


 
 
 
</body>
</html>
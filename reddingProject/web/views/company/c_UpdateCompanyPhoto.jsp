<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import = "java.util.* , com.kh.redding.attachment.model.vo.* , com.kh.redding.member.model.vo.*"%>
<% 
	Member loginUser = (Member) session.getAttribute("loginUser");
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
<link href="https://fonts.googleapis.com/css?family=Sunflower:300"
	rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_CompanyUpdate.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 600px;
}

/* Set gray background color and 100% height */
.sidenav1 {
	padding-top: 20px;
	height: 100%;
	text-align: left;
	font-size: 17px;
}

.sidenav1 a {
	text-decoration: none;
	color: black;
}

.btnclass {
 	background-color: salmon;
   color: white;
   border: 1px solid salmon;
   width : 150px;
     border-radius: 5px;
}

.btnclass:hover{
   background-color: white;
   color: salmon;
   border: 1px solid salmon;
   cursor: pointer;
   border-radius: 5px;
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

	<!-- 업체 나브 -->
	<div>
		<jsp:include page="/views/company/c_nav.jsp"></jsp:include>
	</div>

	<div class="container-fluid text-center">
		<div class="row content">

			<div class="col-sm-2 sidenav1">
				<ul>
					<li><button class = "btnclass"
						onclick="location.href = '<%=request.getContextPath()%>/photo.co'">업체사진 </button></li>
					<li><button class = "btnclass"
					 onclick= "location.href= '<%=request.getContextPath()%>/selectcom.me'">업체 정보 수정 </button></li>
				</ul>
			</div>
			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
					<form action = "<%=request.getContextPath() %>/insertPhoto.co" method = "post"  encType= "multipart/form-data" id = "insertPhoto">
					<h2>대표사진<span style = "color:red">(대표사진은 반드시 추가해야합니다.)</span></h2>
					<div id = "titlePicture">
						<img src = "/redding/images/noimg.gif" alt = "대표사진" id = "titleimg">
					</div><br>
					<hr>
					<h2>서브사진</h2>
					<div id = "subPicture">
						<table id="imgTable">
					  		<tbody>
					  			<tr>
					  				<td>
					  					<div class = "imgArea" id = "subimg">
					  						<img  src = "/redding/images/noimg.gif"   id = "subimg1" name = "subimg1"  class = "subimg">
					  					</div>
					  				</td> 
					  				<td>
					  					<div class = "imgArea" id = "subimg">
					  						<img src = "/redding/images/noimg.gif"  id = "subimg2" name = "subimg2" class = "subimg">
					  					</div>
					  				</td> 
					  			</tr>
					  			<tr>
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  					<img src = "/redding/images/noimg.gif"  id = "subimg3" name = "subimg3"  class = "subimg">
					  					</div>
					  				</td> 
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  						<img src = "/redding/images/noimg.gif"  id = "subimg4" name = "subimg4" class = "subimg">
					  					</div>
					  				</td> 
					  			</tr>
					  			<tr>
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  						<img src = "/redding/images/noimg.gif"  id = "subimg5" name = "subimg5"  class = "subimg">
					  					</div>
					  				</td> 
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  						<img src = "/redding/images/noimg.gif"  id = "subimg6" name = "subimg6" class = "subimg">
					  					</div>
					  				</td> 
					  			</tr>
					  			<tr>
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  						<img src = "/redding/images/noimg.gif"  id = "subimg7" name = "subimg7"  class = "subimg">
					  					</div>
					  				</td> 
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  						<img src = "/redding/images/noimg.gif"  id = "subimg8" name = "subimg8" class = "subimg">
					  					</div>
					  				</td> 
					  			</tr>
					  			<tr>
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  					<img src = "/redding/images/noimg.gif"  id = "subimg9" name = "subimg9"  class = "subimg">
					  					</div>
					  				</td> 
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  					<img src = "/redding/images/noimg.gif"  id = "subimg10" name = "subimg10" class = "subimg">
					  					</div>
					  				</td> 
					  			</tr>
					  			
					  		</tbody>
						</table>
					</div>
					<div id = "fileArea" align = "left">
					<input type = "file" id = "CompanyImg1" name = "CompanyImg1" onchange = "loadImg(this,1)">
					<input type = "file" id = "CompanyImg2" name = "CompanyImg2" onchange = "loadImg(this,2)">
					<input type = "file" id = "CompanyImg3" name = "CompanyImg3" onchange = "loadImg(this,3)">
					<input type = "file" id = "CompanyImg4" name = "CompanyImg4" onchange = "loadImg(this,4)">
					<input type = "file" id = "CompanyImg5" name = "CompanyImg5" onchange = "loadImg(this,5)">
					<input type = "file" id = "CompanyImg6" name = "CompanyImg6" onchange = "loadImg(this,6)">
					<input type = "file" id = "CompanyImg7" name = "CompanyImg7" onchange = "loadImg(this,7)">
					<input type = "file" id = "CompanyImg8" name = "CompanyImg8" onchange = "loadImg(this,8)">
					<input type = "file" id = "CompanyImg9" name = "CompanyImg9" onchange = "loadImg(this,9)">
					<input type = "file" id = "CompanyImg10" name = "CompanyImg10" onchange = "loadImg(this,10)">
					<input type = "file" id = "CompanyImg11" name = "CompanyImg11" onchange = "loadImg(this,11)">
					</div>
				</form>
			</div>

			<div class="col-sm-2 sidenav2">
				<div class="sideMenu2">
					<button id="photoSubmit">등록하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	<script>
		$(function(){
			$("#fileArea").hide();
			
			$("#titlePicture").click(function(){
				$("#CompanyImg1").click();
			});
			
			$("#subimg1").click(function(){
				$("#CompanyImg2").click();
			});
			
			$("#subimg2").click(function(){
				$("#CompanyImg3").click();
			});
			
			$("#subimg3").click(function(){
				$("#CompanyImg4").click();
			});
			
			$("#subimg4").click(function(){
				$("#CompanyImg5").click();
			});
			
			$("#subimg5").click(function(){
				$("#CompanyImg6").click();
			});
			
			$("#subimg6").click(function(){
				$("#CompanyImg7").click();
			});
			
			$("#subimg7").click(function(){
				$("#CompanyImg8").click();
			});
			
			$("#subimg8").click(function(){
				$("#CompanyImg9").click();
			});
			
			$("#subimg9").click(function(){
				$("#CompanyImg10").click();
			});
			
			$("#subimg10").click(function(){
				$("#CompanyImg11").click();
			});
			
			$("#photoSubmit").click(function(){
				if ($("#titleimg").attr("src") == "/redding/images/redding.png"){
					alert("대표사진을 넣어주세요");
				}else{
					$("#insertPhoto").submit();
				}
			});
			
	 });
		
		
		function loadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					switch (num) {
					case 1:
						$("#titleimg").attr("src", e.target.result);
						break;
					case 2 : 
						$("#subimg1").attr("src" , e.target.result);
						break;
					case 3 : 
						$("#subimg2").attr("src" , e.target.result);
						break;
					case 4 : 
						$("#subimg3").attr("src" , e.target.result);
						break;
					case 5 : 
						$("#subimg4").attr("src" , e.target.result);
						break;
					case 6 : 
						$("#subimg5").attr("src" , e.target.result);
						break;
					case 7 : 
						$("#subimg6").attr("src" , e.target.result);
						break;
					case 8 : 
						$("#subimg7").attr("src" , e.target.result);
						break;
					case 9 : 
						$("#subimg8").attr("src" , e.target.result);
						break;
					case 10 : 
						$("#subimg9").attr("src" , e.target.result);
						break;
					case 11 : 
						$("#subimg10").attr("src" , e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	
		
	</script>

</body>
</html>
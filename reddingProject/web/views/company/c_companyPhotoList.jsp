<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.redding.attachment.model.vo.*, java.util.*"%>
<% ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list"); %>
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
<link href="https://fonts.googleapis.com/css?family=Sunflower:300"
	rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_nav.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_companyPhoto.css">
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
<title>REDDING♥</title>
</head>
<body>
	<!-- 업체 나브 -->
	<div>
		<%@ include file="/views/company/c_nav.jsp"%>
		<%-- <jsp:include page="/views/company/c_nav.jsp"></jsp:include> --%>
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
				<h3>이미지 리스트</h3>
				<table class = "photozone">
				<tr>
				<% for(int i = 0 ; i < list.size() ; i++){ 
					Attachment at = list.get(i);
				%>
				
				<% if (i % 2 != 0){ %>
						<td>
							<div class = 'imgArea' id = "img<%=i%>">
								<div class = "wrap" >
								<div class="centered"> 
									<img id = 'subimg<%=i%>' class = 'subimg' src = "<%=request.getContextPath()%>/company_upload/<%=at.getChangename()%>">
								</div>
								</div>
								<input type = "hidden" id = "Aid<%=i%>" class = "id" value = "<%=at.getAid() %>">
								<input type = "hidden" id = "Achangename<%=i%>" class = "changename" value = "<%=at.getChangename() %>">
								<input type = "hidden" id = "AoriginName<%=i%>" class = "originName" value = "<%=at.getOriginname() %>">
								<input type = "hidden" id = "ACNODIV<%=i%>" class = "cnodiv" value = "<%=at.getCno_div() %>">
								<button type = "button" class = "updatebtn" id = "updatePhoto">수정하기</button>
								<button type = "button" class = "updatebtn" id = "deletePhto">삭제하기</button>
							</div>	
						</td>
				<% }else{%>
					<tr>
					<td>
						<div class = 'imgArea' id = "img<%=i%>">
								<div class = "wrap" >
								<div class="centered"> 
								<img id = 'subimg<%=i%>' class = 'subimg' src = "<%=request.getContextPath()%>/company_upload/<%=at.getChangename()%>">
								</div>
								</div>
								<input type = "hidden" id = "Aid<%=i%>" class = "id" value = "<%=at.getAid() %>">
								<input type = "hidden" id = "Achangename<%=i%>" class = "changename" value = "<%=at.getChangename() %>">
								<input type = "hidden" id = "AoriginName<%=i%>" class = "originName" value = "<%=at.getOriginname() %>">
								<input type = "hidden" id = "ACNODIV<%=i%>" class = "cnodiv" value = "<%=at.getCno_div() %>">
								<button type = "button" class = "updatebtn" id = "updatePhoto">수정하기</button>
								<button type = "button" class = "updatebtn" id = "deletePhto">삭제하기</button>
						</div>	
					</td>
					<%} %>
				<% } %>
				</tr>
				</table>
				<hr>
				<div id = "AddPhotoArea">
					<form action = "<%=request.getContextPath()%>/addPhoto.co" method = "post" encType= "multipart/form-data" id = "AddPhotoForm">
						<button type ="button" id ="addPhoto">사진추가</button>
						<img id = "addPhotoImg">
						<input type = "hidden" id = "mno" name = "mno" value = "<%=loginUser.getMno()%>">
						<input type= "file" id = "addFile" name = "addFile" onchange = "loadAddImg(this)">
						<br><button type = "button" id = "addsubmit"></button>
					</form>
				</div>
				<div id = "changeImgArea">
					<form action = "<%=request.getContextPath() %>/changePhoto.co" method = "post" encType= "multipart/form-data" id = "changeForm">
						<h3 id = "changeheader"></h3>
						<br>
						<table>
							<tr>
								<td>
									<label id = "prelabel"></label><br>
									<img id = "originImg" name = "originImg" class = "upimg">
									<input type = "hidden" id = "changeAid" name = "changeAid">
									<input type = "hidden" id = "OriginchangeName" name = "OriginchangeName">
								</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td>
									<label id = "afterlabel"></label><br>
									<img id = "changeImg" name = "changeImgs" class = "upimg">
								</td>
							</tr>
							<tr>
								<td colspan= "2"></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;<button type = "button" id = "changeSubmit"></button>&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>
						</table>
						<div id = "fileArea">
							<input type= "file" id = "updateFile" name = "updateFile" onchange = "loadUpdateImg(this)">
						</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-sm-2 sidenav2">
	</div>
	<script>
		$(function(){
			$("#fileArea").hide();
			$("#addFile").hide();
			
			//수정버튼 클릭시
			$(document).on("click","#updatePhoto",function(){
				var aid = $(this).parent().children().eq(1).val();
				var imgsrc = "";
				var changename = $(this).parent().children().eq(2).val();
				
				var filePath = "<%=request.getContextPath()%>/company_upload/";
				
				imgsrc += filePath + changename;
				
				console.log(aid);
				
				offset = $("#changeImgArea").offset();
			    $('html, body').animate({scrollTop : offset.top}, 400);
				
			    $("#changeAid").val(aid);
			    $("#OriginchangeName").val(changename);
			    
			    console.log("aid :"+$("#changeAid").val());
			    
				$("#changeheader").text("변경할 이미지");
				$("#prelabel").text("변경전");
				$("#afterlabel").text("변경후");
				$("#changeSubmit").text("변경하기");
				$("#originImg").attr("src" , imgsrc);
				
				
				$("#updateFile").click();
			});
			
			//변경하기 클릭시
			$("#changeSubmit").click(function(){
				$("#changeForm").submit();
			});
			
			
			//삭제버튼 클릭시
			$(document).on("click","#deletePhto",function(){
				var aid = $(this).parent().children().eq(1).val();
				var changename = $(this).parent().children().eq(2).val();
				var cnodiv = $(this).parent().children().eq(4).val();
				
				console.log("aid :" + aid + ", changename :" + changename + "cnodiv :" + cnodiv );
			
				if (cnodiv == "대표"){
					alert("대표사진은 삭제할수 없습니다.");
				}else {
					location.href = '<%=request.getContextPath()%>/deletePhoto.co?num='+ aid;
				}
			});
			
			
			//추가 버튼 클릭시 
			$("#addPhoto").click(function(){
				$("#addFile").click();
				
				$("#addsubmit").text("등록하기");
				$("#addPhoto").hide();
			});
			
			$("#addsubmit").click(function(){
				$("#AddPhotoForm").submit();
			})
			
		});
	
	
		function loadUpdateImg(value){
	         console.log(value.files);
	         console.log(value.files[0]);
	         if(value.files && value.files[0]){
	            /* console.log(value); */
	            var reader = new FileReader();
	            reader.onload = function(e){
	               $("#changeImg").attr("src",e.target.result);  
	            };
	            
	            reader.readAsDataURL(value.files[0]);
	         }
	     }
		
		function loadAddImg(value){
			 console.log(value.files);
	         console.log(value.files[0]);
	         if(value.files && value.files[0]){
	            /* console.log(value); */
	            var reader = new FileReader();
	            reader.onload = function(e){
	               $("#addPhotoImg").attr("src",e.target.result);  
	            };
	            
	            reader.readAsDataURL(value.files[0]);
	         }
		}
	
	</script>
</body>
</html>
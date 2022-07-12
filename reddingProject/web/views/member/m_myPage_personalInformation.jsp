<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.Member"%>
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
	rel="stylesheet"><!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_myPage.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_myPage_personalInformation.css">

<style>

.container {
	width:100%;
	color:salmon;
	font-family:'Noto Sans KR', sans-serif;
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
.div1Table2Btn1 {
	width:100%;
	height:100%;
	text-align:center;
	font-family:'Noto Sans KR', sans-serif;
	font-size:17px;
	background:white;
	color:salmon;
	border-bottom:1px solid white;
	border-top:1px solid salmon;
	border-left:1px solid salmon;
	border-right:1px solid salmon;
}
</style>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<jsp:include page="/views/member/m_header.jsp"></jsp:include>
	</div><br>
	
	<div class="div1">
		<table class="div1Table">
			<tr>
				<td style="background:salmon"><img src="<%=request.getContextPath()%>/images/mplogo.png" height="70px"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<table class="div1Table2">
			<tr>
				<td><button class="div1Table2Btn">HOME</button></td>
				<%-- <td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_checkList.jsp'">CHECK LIST</button></td> --%>
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_payment.jsp'">결제 내역</button></td>
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_coupon.jsp'">쿠폰함</button></td>
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_myWriting.jsp'">내 글 관리</button></td>
				<td><button class="div1Table2Btn1" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_personalInformation.jsp'">개인정보 수정</button></td>
			</tr>
		</table>
	</div>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">
			
			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav" id="leftNav">
			
			</div>

			<div class="col-sm-10 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				
				<div class="contents">
				
					<div class="subTitle">
						<%=loginUser.getNickName()%>님의 개인정보 수정
					</div>
					
					<br><br>
					
					<form>
						<h4>비밀번호 수정</h4>
						<table class = "changeInfoTable">
							<tr>
								<td class="col1"><label>현재 비밀번호&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2">
									<input type="password" name="currentPwd" id="currentPwd" maxlength="16">&nbsp;&nbsp;&nbsp;&nbsp;(8~16자 이상 입력)&nbsp;&nbsp;&nbsp;&nbsp;
									<span id="Spwd1"></span>
								</td>
							</tr>
							<tr>
								<td class="col1"><label>변경할 비밀번호&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2">
									<input type="password" name="changePwd" id="changePwd" maxlength="16">&nbsp;&nbsp;&nbsp;&nbsp;
									<span id="Spwd2"></span>
								</td>
							</tr>
							<tr>
								<td class="col1"><label>변경할 비밀번호 확인&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2">
									<input type="password" name="passwordChange2" id="passwordChange2" maxlength="16">&nbsp;&nbsp;&nbsp;&nbsp;
									<span id="Spwd2"></span>
								</td>
							</tr>
						</table>
					</form>
					<br><br>
					<div class="changeInfoBtnArea">
						<input class="changeInfoBtn" type="reset" value="다시 입력하기">&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="changeInfoBtn" type="button" value="수정하기" onclick="PasswordChange()">
					</div>
					
					<br><br>
					<hr>
					<br><br>
					
					<form id="changeInfoForm" action="<%=request.getContextPath()%>/changeInfo.me" method="post">
						<h4>개인정보 수정</h4>
						<table class="changeInfoTable">
							<tr>
								<td class="col1"><label>아이디&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2">
									<input type="text" name="memberId" id="memberId" maxlength="16" value="<%=loginUser.getMemberId()%>" readonly>
									&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td class="col1"><label>비밀번호&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2">
									<input type="password" name="memberPwd" id="memberPwd" maxlength="16">&nbsp;&nbsp;&nbsp;&nbsp;(8~16자 이상 입력)&nbsp;&nbsp;&nbsp;&nbsp;
									<span id="Spwd1"></span>
								</td>
							</tr>
							<tr>
								<td class="col1"><label>이름&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2">
									<input type="text" name="memberName" id="memberName" value="<%=loginUser.getMemberName()%>" readonly>
								</td>
							</tr>
							<tr>
								<td class="col1"><label>닉네임&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td>
									<input type="text" name="nickName" id="nickName" value="<%=loginUser.getNickName()%>">&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="check" type="button" id="nickCheck">닉네임중복확인</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<span id="nickCheck2">사용가능한 닉네임입니다.</span>
								</td>
							</tr>
							<tr>
								<td class="col1"><label>휴대전화&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2">
									<select name="tel1" style="width: 53px;" value="<%= loginUser.getPhone().split("-")[0]%>">
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
									</select>&nbsp;- 
									<input type="text" name="tel2" style="width:60px;" value="<%= loginUser.getPhone().split("-")[1] %>">&nbsp;-
									<input type="text" name="tel3" style="width:60px;" value="<%= loginUser.getPhone().split("-")[2] %>">&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td class="col1"><label>비상연락번호</label></td>
								<td class="col2">
									<select name="con1" style="width: 53px;" value="<%=loginUser.getEmergenCon().split("-")[0]%>">
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
									</select>&nbsp;- 
									<input type="text" name="con2" style="width:60px;" value="<%= loginUser.getEmergenCon().split("-")[1]%>">&nbsp;-
									<input type="text" name="con3" style="width:60px;" value="<%= loginUser.getEmergenCon().split("-")[2]%>"></td>
							</tr>
							<tr>
								<td class="col1"><label>이메일&nbsp;&nbsp;</label><label
									class="star">*</label></td>
								<td class="col2">
									<input type="text" name="email1" value="<%= loginUser.getEmail().split("@")[0]%>">&nbsp;&nbsp;@&nbsp;&nbsp;
									<input type="text" name="email2" id="email2" value="<%= loginUser.getEmail().split("@")[1]%>">&nbsp;&nbsp;
									<select name="email3" id="email3">
										<option>- 이메일 선택 -</option>
										<option>naver.com</option>
										<option>daum.net</option>
										<option>nate.com</option>
										<option>hotmail.com</option>
										<option>yahoo.com</option>
										<option>empas.com</option>
										<option>korea.com</option>
										<option>gmail.com</option>
										<option>직접입력</option>
									</select>&nbsp;&nbsp;&nbsp;&nbsp;
									<button type= "button" class="check" id = "emailckbtn">인증하기</button>
									<span id="Semailck"></span>
									<input type = "hidden" readonly = "readonly" name = "code_check" id = "code_check">
								</td>
							</tr>
							<tr>
								<td class="col1"><label>성별&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2">
									<input type="radio" name="gender" value="M">남자&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="radio" name="gender" value="F">여자
								</td>
							</tr>
							<tr>
								<td class="col1"><label>결혼날짜&nbsp;&nbsp;</label></td>
								<td class="col2">
									<input type="date" name="weddingDate" id="weddingDate">&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
						</table>
					</form>
					<br> <br>
					<div class="changeInfoBtnArea">
						<input class="changeInfoBtn" type="reset" value="다시 입력하기">&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="changeInfoBtn" type="button" value="수정하기" onclick="changeInfo()">&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<br><br>
					<hr>
					<input id = "deletebtn" type = "button" value = "개인정보및 사이트 탈퇴" >
				</div>

			</div>

			<!-- 오른쪽 빈공간 -->
			<!-- <div class="col-sm-2 sidenav"></div> -->

		</div>

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>

	<script>
		$(function() {
			
			//엔터 막기
			document.addEventListener('keydown', function(event) {
			    if (event.keyCode === 13) {
			        event.preventDefault();
			    }
			}, true);

			
			//닉네임 다시 작성할때
			 $("input[name=nickName]").change(function(){
				$("#nickCheck").text("닉네임중복확인");
				$("#nickCheck").css("color","white");
				$("#nickCheck2").text("닉네임확인해주세요");
				$("#nickCheck2").css("color","red");
			});
			
			
			//닉네임 체크 함수
			$("#nickCheck").click(function(){
				var nickname = $("input[name=nickName]").val();
				console.log(nickname);
				
				if (nickname == ""){
					alert("닉네임을 입력해주세요.");
				}else {
					$.ajax({
		    			url : "/redding/nickcheck.me",
		    			type : "post",
		    			data : {nickname : nickname},
		    			success : function(data){
		    				if (data === "success"){
		    					$("#nickCheck2").text("사용가능한 닉네임입니다.");
		    					$("#nickCheck2").css("color","green");
		    				}else {
		    					$("#nickCheck2").text("중복된 닉네임입니다.");
		    					$("#nickCheck2").css("color","red");
		    					$("input[name=nickName]").val("");
		    				}
		    			}, 
		    			error : function(){
		    				console.log("닉네임 변경 실패!");
		    			}
		    		});
				}
			});
					
				
			//select에서 바꿀때
			$("#email3").change(function(){
				$("#email3").children().eq(0).attr("disabled","true");
				
				var value = $(this).val();
				
				$("#email2").val(value);
				
				if(value == "직접입력") {
					$("#email2").val("");
				}
			});
			
			//성별 체크
			$("input[name=gender]").each(function() {
				var memberGender = "<%=loginUser.getGender()%>";
				if($(this).val() == memberGender) {
					$(this).attr("checked", true);
				}
				
			});
			
			
			
			//이메일 기본값
		 	var result = "<%=loginUser.getEmailCheck() %>";
			
			if (result == "N"){
				$("#emailckbtn").css("background","white");
				$("#emailckbtn").css("color","red");
				$("#emailckbtn").css("border","1px solid red");
				$("#emailckbtn").text("인증안됨");
				$("#email_check").val("인증안됨");
			}else {
				$("#emailckbtn").css("background","white");
				$("#emailckbtn").css("color","blue");
				$("#emailckbtn").css("border","1px solid blue");
				$("#emailckbtn").text("인증됨");
				$("#email_check").val("인증됨");
			} 
		 	
			//이메일 바꿀경우 
			$("input[name=email1]").change(function(){
				$("#emailckbtn").css("background","#FB6E5F");
				$("#emailckbtn").css("color","white");
				$("#emailckbtn").css("border","1px solid #FB6E5F");
				$("#emailckbtn").text("인증하기");
				$("#email_check").val("인증안됨");
			});
			
			$("#email2").change(function(){
				$("#emailckbtn").css("background","#FB6E5F");
				$("#emailckbtn").css("color","white");
				$("#emailckbtn").css("border","1px solid #FB6E5F");
				$("#emailckbtn").text("인증하기");
				$("#email_check").val("인증안됨");
			}); 
			
			//select에서 바꿀때
			$("#email3").change(function(){
				$("#email3").children().eq(0).attr("disabled","true");
				
				var value = $(this).val();
				
				$("#email2").val(value);
				
				$("#emailckbtn").css("background","#FB6E5F");
				$("#emailckbtn").css("color","white");
				$("#emailckbtn").css("border","1px solid #FB6E5F");
				$("#emailckbtn").text("인증하기");
				$("#email_check").val("인증안됨");
			});
			
		 	//이메일 인증
			$("#emailckbtn").click(function(){	
				var email1 = $("input[name=email1]").val();		//이메일1
				var email2 = $("#email2").val();
				
				var email = email1 + "@" + email2;
				
				if (email1 == ""){
					alert("이메일을 작성해주세요");
				}else if (email2 == ""){
					alert("이메일을 작성해주세요");
				}else {
					$.ajax({
	          			url : "/redding/send",
	          			type : "post",
	          			data : {email : email},
	          			success : function(data){
	          				$("#code_check").val(data);
	          	   			
	          	          	popupOpen();
	          	                    
	          			}, 
	          			error : function(){
	          				console.log("실패!");
	          			}
	          		});
				}
				
				
			});
		 	
		 	$("#deletebtn").click(function(){
		 		var memberid = "<%=loginUser.getMemberId()%>";
		 		
		 		var result = confirm("정말 탈퇴하실 건가요?");
		 		if (result == true){		 			
		 			location.href = '<%=request.getContextPath()%>/secession.me?mid=' + memberid;
		 		}else {
		 			alert("잘생각하셨습니다.\n많은 정보를 받을 수 있는 REDDING이 되겠습니다.")
		 		}
		 		
		 	});
			
			
			
		});
		
		//수정하기 버튼 누를 때
		function changeInfo() {
			var nickCheck = $("#nickCheck2").text();
			var nickname = $("input[name=nickName]").val();
			
			if ($("#emailckbtn").text() != "인증됨"){
				alert("인증하지 않으면 비밀번호 찾지 못할수 있습니다. 인증해주세요");	
			}else if ($("#memberPwd").val() == ""){
				alert("비밀번호 입력해주세요");
			}else if (nickCheck != "사용가능한 닉네임입니다."){
				alert("닉네임 확인해주세요");	
			}else if (nickname == ""){
				alert("닉네임 확인해주세요");	
			}else {
				$("#changeInfoForm").submit();
			}
			
		}
		
		
		function popupOpen(){
			var url= "<%=request.getContextPath()%>/views/common/checkcode.jsp";    //팝업창에 출력될 페이지 URL
			var winWidth = 200;
		    var winHeight = 200;
		    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
		    var myWindow = window.open(url,"TestName",popupOption);
		}
		
		
		//비밀번호 변경 클릭
		function PasswordChange(){
			var currentPwd =  $("#currentPwd").val();
			var changePwd = $("#changePwd").val();
			var changepwd2 = $("#passwordChange2").val();
			var memberId = $("#memberId").val();
			
			if (currentPwd == ""){
				alert("비밀번호 입력해주세요" + pwd);
			}else if (changePwd == ""){
				alert("변경할 비밀번호 다시 확인해주세요" + changepwd);
			}else if (changepwd2 == ""){
				alert("변경할 비밀번호 다시 확인해주세요" + changepwd2);
			}else if (changePwd != changepwd2){
				alert("변경할 비밀번호 다시 확인해주세요" + changepwd + changepwd2);
			}else {
				$.ajax({
          			url : "/redding/changePassword.me",
          			type : "post",
          			data : {currentPwd : currentPwd , changePwd : changePwd , memberId : memberId},
          			success : function(data){
          				if (data == "success"){
          					alert("성공! 비밀번호 변경되었습니다.");
          					
          				}else {
          					alert("비밀번호 변경이 실패했습니다. 다시 한번 입력해주세요");
          				}
          			}, 
          			error : function(){
          				console.log("실패!");
          			}
          		});
				
				$("#currentPwd").val("");
				$("#changePwd").val("");
				$("#passwordChange2").val("");
			}			
		}
		
		
		
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/idpassSearch.css">
</head>
</head>
<body>
	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<jsp:include page="/views/member/m_header.jsp"></jsp:include>
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
				<div class="IDArea">
					<h3>아이디 찾기</h3>
					<table class = "idpassTable">
						<tr>
							<th>NAME</th>
							<td><input type = "text" name = "MemberName" id = "MemberName"> </td>
						</tr>
						<tr>
							<th>EMAIL</th>
							<td><input type="text" name="email1" id = "email1">&nbsp;&nbsp;@&nbsp;&nbsp;
									<input type="text" name="email2" id="email2">
									<select name="email3" id="email3">
										<option>직접입력</option>
										<option>naver.com</option>
										<option>daum.net</option>
										<option>nate.com</option>
										<option>hotmail.com</option>
										<option>yahoo.com</option>
										<option>empas.com</option>
										<option>korea.com</option>
										<option>gmail.com</option>
									</select></td>
							<td>
						</tr>
						<tr id = "codeArea">
							<th>인증코드</th>
							<td><input type = "text" id = "codeCheck">
							</td>
						</tr>
					</table>
					<br>
					<button type = "button" class = "SearchBtn" id = "SearchBtn">아이디 찾기</button>
					<button type = "button" class = "SearchBtn" id = "idBtn">아이디 찾기</button>
				</div>
				<br>
				<hr>
				<div class = "PassArea">
					<h3>비밀번호 찾기</h3>
					<table class = "idpassTable">
						<tr>
							<th>ID</th>
							<td><input type = "text" name = "PwdMemberID" id = "PwdMemberID"> </td>
						</tr>
						<tr>
							<th>Name</th>
							<td><input type = "text" name = "PWdMemberName" id = "PwdMemberName"></td>
						</tr>
						<tr>
							<th>EMAIL</th>
							<td><input type="text" name="Pemail1" id = "Pemail1">&nbsp;&nbsp;@&nbsp;&nbsp;
									<input type="text" name="Pemail2" id="Pemail2">
									<select name="email3" id="Pemail3">
										<option>직접입력</option>
										<option>naver.com</option>
										<option>daum.net</option>
										<option>nate.com</option>
										<option>hotmail.com</option>
										<option>yahoo.com</option>
										<option>empas.com</option>
										<option>korea.com</option>
										<option>gmail.com</option>
									</select></td>
							<td></td>
						</tr>
						<tr id = "PwdcodeArea">
							<th>인증코드</th>
							<td><input type = "text" id = "PwdcodeCheck">
							</td>
						</tr>
					</table>
					<br>
					<button type = "button" class = "SearchBtn" id = "pwdchange">비밀번호 찾기</button>
					<button type = "button" class = "SearchBtn" id = "pwdemailcheck">비밀번호 찾기</button>
				</div>
				<div id = "UpDatePassword">
					<h3>비밀번호 변경</h3>
					<table class = "idpassTable">
						<tr>
							<th>변경할 비밀번호</th>
							<td><input type = "password" name = "changepwd" id = "changepwd"></td>
						</tr>
						<tr>
							<th>변경할 비밀번호 확인</th>
							<td><input type = "password" name = "changepwdcheck" id = "changepwdcheck"> </td>
						</tr>
					</table>
					<br>
					<button type = "button" class = "SearchBtn" id = "updatePass">비밀번호 변경</button>
				</div>
			</div>

			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

		</div>

	</div>
	<br><br><br><br><br>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	
	<script>
		$(function(){
			//엔터 막기
			document.addEventListener('keydown', function(event) {
			    if (event.keyCode === 13) {
			        event.preventDefault();
			    }
			}, true);
			
			$("#UpDatePassword").hide();
			$("#codeArea").hide();
			$("#idBtn").hide();
			
			//아이디 찾기
			var result = "";
			$("#SearchBtn").click(function(){
				
				var memberid = $("#MemberName").val();
				
				var email1 = $("#email1").val();
				var email2 = $("#email2").val();
				var email = email1 + "@" + email2;
				
				console.log("memberid :" + memberid);
				console.log("email :" + email);
				
				if (memberid == ""){
					alert("이름 입력해주세요");
				}else if (email1 == ""){
					alert("이메일 입력해주세요");
				}else if (email2 == ""){
					alert("이메일 입력해주세요");
				}else {
					$.ajax({
	          			url : "/redding/idSearch",
	          			type : "post",
	          			data : {memberid: memberid,email : email},
	          			success : function(data){
	          				if (data == "없음"){
	          					alert("존재하지 않습니다");
	          				}else {
	          				
	          					$.ajax({
	        	          			url : "/redding/send",
	        	          			type : "post",
	        	          			data : {email : email},
	        	          			success : function(data){
	        	          				//console.log(data);
	        	          				$("#codeArea").show();
	          							$("#SearchBtn").hide();
	          							$("#idBtn").show();
			          					
	        	          				$("#codeCheck").change(function(){
	        	          					var idcode = $(this).val();
	        	          					
		        	          				//console.log("idcode:"+idcode);
	        	          					if (data == idcode){
		        	          					result = "이메일인증성공";
		        	          				}else {
		        	          					result = "이메일인증실패";
		        	          				}
	        	          				});
	        	          				
	        	          				
	        	          				
	        	          			}, 
	        	          			error : function(){
	        	          				console.log("실패!");
	        	          			}
	        	          		});
	          				}
	          				
	          			}, 
	          			error : function(){
	          				console.log("실패!");
	          			}
	          		});
				}
				
			});
			
			$("#idBtn").click(function(){
				var memberid = $("#MemberName").val();
				var email1 = $("#email1").val();
				var email2 = $("#email2").val();
				var email = email1 + "@" + email2;
				
				console.log("result :" + result);
				
				if (result == "이메일인증성공"){
					$.ajax({
	          			url : "/redding/idSelect",
	          			type : "post",
	          			data : {memberid: memberid,email : email},
	          			success : function(data){
	          				var result = memberid+"님의 아이디는 "
	          				result += data + "입니다";
	          				
	          				alert(result);
	          			}, 
	          			error : function(){
	          				console.log("실패!");
	          			}
	          		});
				}else {
					alert("잘못된 인증입니다.");
					
				}
				
				$("#codeArea").hide();
				$("#idBtn").hide();
				$("#SearchBtn").show();
				$("#MemberName").val("");
				$("#email1").val("");
				$("#email2").val("");
				$("#email3 option:eq(0)").prop("selected", true);
			});
			
			$("#PwdcodeArea").hide();
			$("#pwdemailcheck").hide();
			
			var pwdresut = "";
			var memberId = "";
			
			//비밀번호 찾기
			$("#pwdchange").click(function(){
				var memberid = $("#PwdMemberID").val();
				var membername = $("#PwdMemberName").val();
				
				memberId = memberid;
				
				var pemail1 = $("#Pemail1").val();
				var pemail2 = $("#Pemail2").val();
				
				var email = pemail1 +"@" + pemail2;
				
				console.log(memberid + membername + email)
				
				if (memberid == ""){
					alert("아이디를 확인해주세요.");
				}else if (membername == ""){
					alert("이름을 확인해주세요.");
				}else if (pemail1 == ""){
					alert("이메일을 확인해주세요.");
				}else if (pemail2 == ""){
					alert("이메일을 확인해주세요");
				}else {
					$.ajax({
	          			url : "/redding/pwdSelect",
	          			type : "post",
	          			data : {memberid:memberid,membername:membername,email:email},
	          			success : function(data){
	          				if (data == "없음"){
	          					alert("존재하지 않습니다");
	          				}else {
	          					$.ajax({
	        	          			url : "/redding/send",
	        	          			type : "post",
	        	          			data : {email : email},
	        	          			success : function(data){
	        	          				//console.log(data);
	        	          				$("#PwdcodeArea").show();
	        	          				$("#pwdemailcheck").show();
	        	          				$("#pwdchange").hide();
	       
	        	          				$("#PwdcodeCheck").change(function(){
	        	          					var idcode = $(this).val();
	        	          					
	        	          					//console.log("idcode:"+idcode);
	        	          					if (data == idcode){
	        	          						pwdresut = "이메일인증성공";
		        	          				}else {
		        	          					pwdresut = "이메일인증실패";
		        	          				}
	        	          				});
	        	          				
	        	          				
	        	          				
	        	          			}, 
	        	          			error : function(){
	        	          				console.log("실패!");
	        	          			}
	        	          		});
	          				}
	          			}, 
	          			error : function(){
	          				console.log("실패!");
	          			}
	          		});
				}
			});
			
			$("#pwdemailcheck").click(function(){
				if (pwdresut == "이메일인증성공"){
					$("#UpDatePassword").show();
				}else {
					alert("잘못된 인증입니다.");
					$("#PwdcodeArea").hide();
					$("#pwdemailcheck").hide();
					$("#pwdchange").show();	
				}	
			});
			
			$("#updatePass").click(function(){
				var memberPwd = $("#changepwd").val();
				var changepwdcheck = $("#changepwdcheck").val();
				
				if (memberPwd == ""){
					alert("변경할 비밀번호를 확인해주세요.");
				}else if (changepwdcheck == ""){
					alert("변경할 비밀번호를 확인해주세요.");
				}else if (memberPwd != changepwdcheck){
					alert("변경할 비밀번호를 확인해주세요.");
				}else {
					$.ajax({
	          			url : "/redding/changePwd.me",
	          			type : "post",
	          			data : {memberId: memberId,memberPwd : memberPwd},
	          			success : function(data){
	          				if (data == "fail"){
	          					alert("비밀번호 변경이 실패하셨습니다.");
	          				}else {
	          					alert("비밀번호 변경을 성공하셨습니다.");
	          					
	          					location.href='<%=request.getContextPath()%>/views/common/login.jsp';
	          				}
	          			}, 
	          			error : function(){
	          				console.log("실패!");
	          			}
	          		});
				}
				
				
			});
			
			
			
			//select에서 바꿀때
			$("#email3").change(function(){
				$("#email3").children().eq(0).attr("disabled","true");
				
				var value = $(this).val();
				
				$("#email2").val(value);
			});
			
			//select에서 바꿀때
			$("#Pemail3").change(function(){
				$("#Pemail3").children().eq(0).attr("disabled","true");
				
				var value = $(this).val();
				
				$("#Pemail2").val(value);
			});
			
			
		});
		
		
	</script>
								
</body>
</html>
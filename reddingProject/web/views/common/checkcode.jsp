<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REDDING♥</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
	<!--이메일 팝업창  -->
	<form id = "form2" action = "javascript:getPassword()">
		<table>
			<tr>
				<td><h3>이메일로 인증번호를 발송했습니다.</h3></td>
			</tr>
			<tr>
				<td><input type = "text" name = "code" id = "code" onchange = "checkCode()" placeholder= "인증번호 입력">
				<div id = "checkCode">
					<input type = "hidden" id = "result">
				</div>
				</td>
				<td>
					<input type = "hidden" readonly = "readonly" name = "code_check" id = "child_code_check"> 
				</td>
			</tr>
		</table>
		<input id = "submit" type = "button" value = "닫기"/>
	</form>
	<script>
		function checkCode(){
			/* 받아온 이메일 인증번호와 입력정보 확인  */
			var v1 = $("#child_code_check").val();
			var v2 =  $("#code").val();
			
			//console.log("v1 :" + v1 + "v2 :" + v2);
			
			if (v1 != v2){
				$("#result").css("color","red");
				$("#result").text("잘못된 인증번호");
			}else{
				$("#result").css("color","blue");
				$("#result").text("인증확인");
			}
		}
		
		
		$(function(){
			var checkcode =$("#code_check", opener.document).val();
			
			$("#child_code_check").val(checkcode);
			
			$("#submit").click(function(){
				var result = $("#result").text();
							
				if (result == "잘못된 인증번호"){
					$("#emailckbtn", parent.opener.document).css("background","white");
					$("#emailckbtn", parent.opener.document).css("color","red");
					$("#emailckbtn", parent.opener.document).css("border","1px solid red");
					$("#emailckbtn", parent.opener.document).text("인증안됨");
					$("#email_check", parent.opener.document).val("인증안됨");
				}else {
					$("#emailckbtn", parent.opener.document).css("background","white");
					$("#emailckbtn", parent.opener.document).css("color","blue");
					$("#emailckbtn", parent.opener.document).css("border","1px solid blue");
					$("#emailckbtn", parent.opener.document).text("인증됨");
					$("#email_check", parent.opener.document).val("인증됨");
				}

				window.self.close();
			})
		})
	
	</script>
</body>
</html>
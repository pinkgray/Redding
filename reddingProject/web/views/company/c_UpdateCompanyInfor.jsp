<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "java.util.*, com.kh.redding.company.model.vo.*, com.kh.redding.member.model.vo.*, com.kh.redding.attachment.model.vo.*"%>
<% 
   HashMap<String,Object> loginCompany = (HashMap<String,Object>)(request.getAttribute("loginCompany"));
   Member member = (Member)loginCompany.get("member");
   Company company = (Company)loginCompany.get("company");
   Attachment attachment = (Attachment)loginCompany.get("attachment");
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
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_CompanyUpdate.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
	
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
				<div class="contentsArea">
					<div class="contentsArea con1">
						<table>
							<tr>
								<td>
									<h2>비밀번호 변경</h2>
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group">
										<label for="inputsm">현재 비밀번호</label> 
										<input type = "password"
										class="form-control input-sm" id="currentPwd">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group">
										<label for="inputsm">변경할 비밀번호</label> <input type = "password" 
											class="form-control input-sm" id="changePwd">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group">
										<label for="inputsm">변경할 비밀번호 확인</label> 
										<input class="form-control input-sm" id="passwordChange2" type="password">
										<p id = "checkPwd"></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group">
										<button type = "button" id = "pwdbtn" onclick = "PasswordChange();">변경하기</button>
									</div> 
								</td>
							</tr>
						</table>
						<hr>
						<form action = "<%=request.getContextPath()%>/updatecompany.me" method = "post" enctype="multipart/form-data" id = "updateCompany">
						<table class = "comTable">
							<tr>
								<td colspan = "2">
									<h3>회원정보 변경</h3>
								</td>
							</tr>
							<tr>
								<th>사업자 등록번호</th>
								<td>
									<div class="fileBox">
										<input type="text" class="fileName" id = "reg_num" name = "reg_num" readonly="readonly" value = "<%=attachment.getOriginname()%>">
										<label for="uploadBtn" class="btn_file">찾아보기</label> <input
											type="file" name = "uploadFile" id="uploadBtn" class="uploadBtn">
										<input type="hidden" id = "aid" name = "aid" readonly="readonly" value = "<%=attachment.getAid()%>">
										<input type="hidden" id = "Achangename" name = "Achangename" readonly="readonly" value = "<%=attachment.getChangename()%>">
									</div>
								</td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><input type = "text" name = "memberId" id = "memberId" value = "<%=member.getMemberId() %>"  readonly></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type = "password" name = "memberPwd" id = "memberPwd"></td>
							</tr>
							<tr>
								<th>업체 종류</th>
								<td><input type="radio" name="company_type" id="studio"
									value="스튜디오" checked> <label for="studio">스튜디오</label>
									<input type="radio" name="company_type" id="dress" value="드레스">
									<label for="dress">드레스</label> <input type="radio"
									name="company_type" id="make" value="메이크업"> <label
									for="make">메이크업 & 헤어</label></td>
							</tr>
							<tr>
								<th>업체명</th>
								<td><input type="text" maxlength="30" name="name" id="name" value = "<%=member.getMemberName() %>"></td>
								<td></td>
							</tr>
							<tr>
								<th>대표자 명</th>
								<td><input type="text" maxlength="30" name="rep_name"
									id="rep_name" value = "<%= company.getRepName()  %>"></td>
								<td></td>
							</tr>
							<%
            					String phone = member.getPhone();
            	
            					String tel1 = phone.split("-")[0];
            					String tel2 = phone.split("-")[1];
            					String tel3 = phone.split("-")[2];
            	
            				%>
							<tr>
								<th>전화번호</th>
								<td><input type="text" maxlength="3" name="phone1"
									id="phone1" size="5" value = "<%=tel1%>"> - <input type="text"
									maxlength="4" name="phone2" id="phone2" size="5" value = "<%=tel2%>"> - <input
									type="text" maxlength="4" name="phone3" id="phone3" size="5" value = "<%=tel3%>"></td>
							</tr>
							<%
            					String address = company.getComAddress();
            					String[] addresses = address.split("\\|");
            				%>
							<tr>
								<th>주소</th>
								<td><input type="text" id="postcode" placeholder="우편번호"
									name="postcode" value = "<%= addresses[0] %>"> <input type="button"
									onclick="execDaumPostcode()" value="우편번호 찾기"><br>
								</td>
							</tr>
							<tr>
								<td></td>
								
								<td><input type="text" id="address" placeholder="주소"
									name="address" value = "<%= addresses[1] %>" style = "width : 250px;"><br></td>
							</tr>
							<tr>
								<td></td>
								<%  if (addresses.length >2 ){ %>
								<td><input type="text" id="detailAddress"
									placeholder="상세주소" name="detailAddress" value = "<%= addresses[2]%>"> 	
									<input type="text" id="extraAddress" placeholder="참고항목" name="extraAddress">
								<%} %>
							</tr>
							<tr>
								<th>입금계좌</th>
								<td><select name="accountcode" id = "accountcode" style = "height : 25px;">
										<option>-- 은행선택 --</option>
										<option value="011">NH농협</option>
										<option value="020">우리은행</option>
										<option value="088">신한은행</option>
										<option value="004">국민은행</option>
										<option value="081">하나은행</option>
										<option value="005">외한은행</option>
										<option value="003">IBK기업은행</option>
										<option value="045">새마을은행</option>
										<option value="032">부산은행</option>
										<option value="039">경남은행</option>
										<option value="034">광주은행</option>
										<option value="037">전북은행</option>
										<option value="048">신협은행</option>
										<option value="023">SC제일은행</option>
										<option value="031">대구은행</option>
										<option value="035">제주은행</option>
										<option value="071">우체국은행</option>
										<option value="007">수협은행</option>
								</select></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" name="account_num" id="account_num"
									placeholder="계좌번호(-없이 적어주세요)" style = "width: 350px"
									value = "<%=company.getAccountNum() %>"></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" name="account_name"
									id="account_name" placeholder="예금주" value = "<%=company.getAccountName() %>"></td>
							</tr>
							<%
								String email = member.getEmail();
								
								String email1 = email.split("@")[0];
								String email2 = email.split("@")[1];
							%>
							<tr>
								<th class="col1">이메일&nbsp;&nbsp;</th>
								<td class="col2"><input type="text" name="email1" value = "<%=email1%>">&nbsp;&nbsp;@&nbsp;&nbsp;
									<input type="text" name="email2" id="email2" value = "<%=email2%>">&nbsp;&nbsp;
									<select name="email3" id="email3" style = "height:25px;">
										<option>직접입력</option>
										<option>naver.com</option>
										<option>daum.net</option>
										<option>nate.com</option>
										<option>hotmail.com</option>
										<option>yahoo.com</option>
										<option>empas.com</option>
										<option>korea.com</option>
										<option>gmail.com</option>
								</select>&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="check" id="emailckbtn">인증하기</button>
									<span id="Semailck"></span> <input type="hidden"
									id="email_check" name="email_check" value="인증안됨">
									<input type = "hidden" readonly = "readonly" name = "code_check" id = "code_check"></td>
							</tr>
							
							<tr>
								<th>홈페이지</th>
								<td><input type="url" name="homepage" id="homepage"
									placeholder="http://" value = "<%=company.getComUrl()%>" style = "width:200px;"></td>
							</tr>
							<tr>
								<th>영업시간</th>
								<td><input type="time" name="strartime" id="strartime" value = "<%=company.getOpenTime()%>" readonly>
									~ <input type="time" name="endtime" id="endtime" value = "<%=company.getEndTime()%>" readonly></td>
							</tr>
							<tr>
								<th>휴무일</th>
								<td>
									<input type = "checkbox" value = "월" id = "Monday" name = "weekend" disabled>
									<label for = "Monday">월</label>
									<input type = "checkbox" value = "화" id = "Tuesday" name = "weekend" disabled>
									<label for = "Tuesday">화</label>
									<input type = "checkbox" value = "수" id = "Wednesday" name = "weekend" disabled>
									<label for = "Wednesday">수</label>
									<input type = "checkbox" value = "목" id = "Thusday" name = "weekend" disabled>
									<label for = "Thusday">목</label>
									<input type = "checkbox" value = "금" id = "Friday" name = "weekend" disabled>
									<label for = "Friday">금</label>
									<input type = "checkbox" value = "토" id = "Saturday" name = "weekend" disabled>
									<label for = "Saturday">토</label>
									<input type = "checkbox" value = "일" id = "Sunday" name = "weekend"disabled>
									<label for = "Sunday">일</label>
								</td>
							</tr>
							<tr>
								
								<td colspan = "2">
									<div class="form-group">
										
										<label style = "color:red">영업시간과 휴무일을 변경할수 없습니다.</label>
										<button type = "button" id = "delete">탈퇴하기</button>
										<button type = "button" id = "combtn">변경하기</button>
									</div>
								</td>
							</tr>
						</table>
						</form>
					</div>
					

				</div>
				


			<div class="col-sm-2 sidenav2"></div>
		</div>
	</div>
	</div>
	
		
	

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>

	<script>
		//주소 api
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("extraAddress").value = extraAddr;

							} else {
								document.getElementById("extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress").focus();
						}
					}).open();

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
		
		
		function popupOpen(){
			var url= "<%=request.getContextPath()%>/views/common/checkcode.jsp";    //팝업창에 출력될 페이지 URL
			var winWidth = 200;
		    var winHeight = 200;
		    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
		    var myWindow = window.open(url,"TestName",popupOption);
		  //  myWindow.document.write("<h1>"+myWindow.name+"</h1>");
		}

		$(function() {
			document.addEventListener('keydown', function(event) {
			    if (event.keyCode === 13) {
			        event.preventDefault();
			    }
			}, true);
			
			var accountCode = <%= company.getAccountCode() %>;
			
			
			//업체 정보
			$("input[name=company_type]").each(function(){
				var comtype = "<%=company.getComType()%>";
				
				console.log(comtype)
				if ($(this).val() == comtype){
					$(this).attr("checked", true);
				}
			});
			
					
			//은행 select 선택 - 조회시 기본으로 보여주는
			$("#accountcode option").each(function(){
			    if($(this).val() == accountCode){
			      $(this).prop("selected","true"); // attr적용안될경우 prop으로 
			    }
			});
			
			//이메일 select 선택 
			$("#email3 option").each(function(){
				if ($(this).val() == $("#email2").val()){
					$(this).prop("selected", "true");
				}
			});
			
			//휴일 받아오기
			$("input[name = weekend]").each(function(){
				var weekends = '<%=company.getHoliday()%>'.split(",");
							
				for (var i = 0 ; i < weekends.length ; i++){
        			if ($(this).val() == weekends[i]){
        				$(this).attr("checked",true);
            		}
        		}
				
			});
			
			//업체 정보 수정하기
			$("#combtn").click(function(){
				if ($("#emailckbtn").text() != "인증됨"){
					alert("인증하지 않으면 비밀번호 찾지 못할수 있습니다. 인증해주세요");	
				}else if ($("#memberPwd").val() == ""){
					alert("비밀번호 입력해주세요");
				}else {
					$("#updateCompany").submit();
				}
			});
			
			
			//파일 
			var uploadFile = $('.fileBox .uploadBtn');
		 	uploadFile.on('change', function(){
		 		if(window.FileReader){
		 			var filename = $(this)[0].files[0].name;
		 		} else {
		 			var filename = $(this).val().split('/').pop().split('\\').pop();
		 		}
		 		$(this).siblings('.fileName').val(filename);
		 	});
		 	
		 	//이메일 기본값
		 	var result = "<%=member.getEmailCheck() %>";
			
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
		 	
		 	
			$("#delete").click(function(){
		 		var memberid = "<%=member.getMemberId()%>";
		 		
		 		var result = confirm("정말 탈퇴하실 건가요?");
		 		if (result == true){		 			
		 			location.href = '<%=request.getContextPath()%>/secession.me?mid=' + memberid;
		 		}else {
		 			alert("잘생각하셨습니다.\n많은 정보를 받을 수 있는 REDDING이 되겠습니다.")
		 		}
		 		
		 	});
		 	
		});
		
		
		
		
		
	</script>

</body>
</html>
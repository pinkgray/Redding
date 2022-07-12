<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.*, com.kh.redding.admin.model.vo.*, java.util.*"%>
<%
	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>) request.getAttribute("list");
	TotalMemberPageInfo pi = (TotalMemberPageInfo) request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	Member onemember = (Member) request.getAttribute("onemember");
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
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a_totalMember.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<script src="<%=request.getContextPath()%>/css/semantic/semantic.min.js"></script>	
<script src="<%=request.getContextPath()%>/css/semantic/jquery-3.4.1.min.js"></script>
<link href="${pageContext.request.contextPath}/css/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/css/dist/js/datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/css/dist/js/i18n/datepicker.en.js"></script>
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
						<li onclick="location.href='a_TotalMember.jsp'" style="color:lightgray; padding-left:25px">전체 회원</li>
						<li onclick="location.href='<%=request.getContextPath()%>/AllQnA.no'">문의</li>
					</ul>
				</div> --%>
			</div>
		</div>
		
		<div class="visible-xs sideListnav2">
					<div class="col-sm-2 sidenav1">
						<%-- <div class="sidenavArea2">
						<ul class="navList2">
						<li onclick="location.href='a_TotalMember.jsp'" style="color:lightgray; padding-left:25px">전체 회원</li>
						<li onclick="location.href='<%=request.getContextPath()%>/AllQnA.no'">문의</li>
						</ul>
					</div> --%>
					</div>
					
					<br><br>
				</div>
			


			<div class="col-sm-10 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="memberArea">
					<div class="memberNum">
						<br> <br> <br>
						<table class="memberNumtable">
							<tr>
								<td class="memberNumTableTd1">전체회원</td>
								<td><%=request.getAttribute("allMemberlistCount")%>명</td>
								<td class="memberNumTableTd1">신규회원</td>
								<td><%=request.getAttribute("newMemberlistCount")%>명</td>
								<td class="memberNumTableTd1">탈퇴회원</td>
								<td><%=request.getAttribute("withdrawalMemberlistCount")%>명</td>
							</tr>
						</table>
					</div>
					<br> <br> <br>

					<div class="memberList">
						<label class="subtitle">회원 목록</label>
						<br> <br> <br>
						<form method="post"> 
							<table class="searchMemberList">
								<tr>
									<td class="searchMemberListTd1">개인정보</td>
									<td class="searchMemberListTd2">
										<select class="memberInfoSelect" style="border:1px solid darkgray; height:25px;">
											<option style="border:1px solid darkgray; height:25px;">- 선택 -</option>
											<option style="border:1px solid darkgray; height:25px;">회원명</option>
											<option style="border:1px solid darkgray; height:25px;">닉네임</option>
											<option style="border:1px solid darkgray; height:25px;">연락처</option>
											<option style="border:1px solid darkgray; height:25px;">이메일</option>
										</select>
										<input type="text" style="border:1px solid darkgray; height:25px;" class="memberInfoInput" name="memberInfoInput">
									</td>
								</tr>
								<tr>
									<td rowspan="2" class="searchMemberListTd1">가입일</td>
									<td class="searchMemberListTd2"><input type="radio" value="전체" name="memberEnrollDate" checked>&nbsp;&nbsp;전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" value="오늘" name="memberEnrollDate">&nbsp;&nbsp;오늘&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 										
										<input type="radio" value="일주일 이내" name="memberEnrollDate">&nbsp;&nbsp;일주일 이내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" value="1개월 이내" name="memberEnrollDate">&nbsp;&nbsp;1개월 이내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" value="3개월 이내" name="memberEnrollDate">&nbsp;&nbsp;3개월 이내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td class="searchMemberListTd2"><input type="radio" value="검색" name="memberEnrollDate">&nbsp;&nbsp;검색&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type='text' class='datepicker-here efirstDate pick' id="datePicker" data-language='en' data-date-format ='yyyy-mm-dd' style="border:1px solid darkgray; height:25px;">&nbsp;&nbsp;-&nbsp;&nbsp; 
										<input type='text' class='datepicker-here elastDate pick' id="datePicker" data-language='en' data-date-format ='yyyy-mm-dd' style="border:1px solid darkgray; height:25px;">
									</td>
								</tr>
								<tr>
									<td rowspan="2" class="searchMemberListTd1">결혼예정일</td>
									<td class="searchMemberListTd2"><input type="radio" value="전체" name="memberWeddingDate" checked>&nbsp;&nbsp;전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" value="오늘" name="memberWeddingDate">&nbsp;&nbsp;오늘&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" value="일주일 이내" name="memberWeddingDate">&nbsp;&nbsp;일주일 이내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" value="1개월 이내" name="memberWeddingDate">&nbsp;&nbsp;1개월 이내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" value="3개월 이내" name="memberWeddingDate">&nbsp;&nbsp;3개월 이내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td class="searchMemberListTd2"><input type="radio" value="검색" name="memberWeddingDate">&nbsp;&nbsp;검색&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type='text' class='datepicker-here wfirstDate pick' data-language='en' data-date-format ='yyyy-mm-dd' style="border:1px solid darkgray; height:25px;">&nbsp;&nbsp;-&nbsp;&nbsp; 
										<input type='text' class='datepicker-here wlastDate pick' data-language='en' data-date-format ='yyyy-mm-dd' style="border:1px solid darkgray; height:25px;">
									</td>
								</tr>
								<tr>
									<td class="searchMemberListTd1">활동 상태</td>
									<td class="searchMemberListTd2"><input type="radio" value="전체" name="memberStatus" checked>&nbsp;&nbsp;전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" value="Y" name="memberStatus">&nbsp;&nbsp;활동회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" value="N" name="memberStatus">&nbsp;&nbsp;탈퇴회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
							</table>
							<br>
							<div class="searchMemberListBtnArea">
								<button type="button" class="searchMemberListBtn">검색</button>
							</div>
						</form>
						<br> <br>
						<div class="memberBaseInfo">
							<table class="memberListTable">
								<thead>
									<tr style="background:mistyrose;">
										<td>선택</td>
										<td>번호</td>
										<td>닉네임</td>
										<td>회원 이름</td>
										<td>성별</td>
										<td>연락처</td>
										<td>이메일주소</td>
										<td>가입일</td>
										<td>결혼예정일</td>
										<td>활동상태</td>
									</tr>
								</thead>
								<% 
									for(int i = 0 ; i < list.size() ; i++) { 
										HashMap<String, Object> hmap = list.get(i);
								%>
								<tbody>
									<tr>
										<td><input type="checkbox"></td>
										<td><%= hmap.get("num") %></td>
										<% Member member = (Member)hmap.get("member"); %>
										<td><%= member.getNickName() %></td>
										<td><%= member.getMemberName() %></td>
										<td><%= member.getGender() %></td>
										<td><%= member.getPhone() %></td>
										<td><%= member.getEmail() %></td>
										<td><%= member.getEnrollDate() %></td>
										<td><%= member.getWeddingDate() %></td>
										<td><%= member.getStatus() %></td>
									</tr>
								</tbody>
								<% 
									} 
								%>
							</table>
							<br>
							<!-- 페이지 버튼 처리 -->
							<div class="pagingArea" align="center">
							<button onclick="location.href='<%= request.getContextPath() %>/selectList.me?currentPage=1'"><<</button>
							<% if(currentPage <= 1) { %>
							<button disabled><</button>
							<% } else { %>
							<button onclick="location.href='<%= request.getContextPath() %>/selectList.me?currentPage=<%= currentPage - 1 %>'"><</button>
							<% } %>
							
							<% for(int p = startPage; p <= endPage; p++) { 
									if(p == currentPage) { %>
										<button disabled><%= p %></button>
							<% 		}else {%>
										<button onclick="location.href='<%= request.getContextPath() %>/selectList.me?currentPage=<%= p %>'"><%= p %></button>
							<%		} %>
								
							<% } %>
							
							<% if(currentPage >= maxPage) { %>
							<button disabled>></button>
							<% } else { %>
							<button onclick="location.href='<%= request.getContextPath() %>/selectList.me?currentPage=<%= currentPage + 1 %>'">></button>
							<% } %>
							<button onclick="location.href='<%= request.getContextPath() %>/selectList.me?currentPage=<%= maxPage %>'">>></button>
							<br>
<!-- 							<div class="btns">
								<button class="ui pink button" style="background:salmon;">블랙리스트 추가</button>
								<button class="ui pink button" style="background:salmon;">탈퇴</button>
							</div> -->
						</div>
						<br> <br> <br>
						<label class="subtitle">회원 상세정보 조회</label>
						<br>
						
						<div>
							<br> <br>
								<table class="memberDetailInfo">
									<tr>
										<td class="memberDetailInfoTd1">아이디</td>
										<td class="memberId"></td>
										<td class="memberDetailInfoTd1">이름</td>
										<td class="memberName"></td>
									</tr>
									<tr>
										<td class="memberDetailInfoTd1">닉네임</td>
										<td class="memberNickName"></td>
										<td class="memberDetailInfoTd1">성별</td>
										<td class="memberGender"></td>
									</tr>
									<tr>
										<td class="memberDetailInfoTd1">전화번호</td>
										<td class="memberPhone"></td>
										<td class="memberDetailInfoTd1">비상연락처</td>
										<td class="memberEmergenCon"></td>
									</tr>
									<tr>
										<td class="memberDetailInfoTd1">이메일</td>
										<td class="memberEmail"></td>
										<td class="memberDetailInfoTd1">신고횟수</td>
										<td class="memberMnotiType"></td>
									</tr>
									<tr>
										<td class="memberDetailInfoTd1">가입일</td>
										<td class="memberEnrollDate"></td>
										<td class="memberDetailInfoTd1">결혼예정일</td>
										<td class="memberWeddingDate"></td>
									</tr>
									<tr>
										<td class="memberDetailInfoTd1">활동상태</td>
										<td class="memberStatus"></td>
										<td class="memberDetailInfoTd1">탈퇴일</td>
										<td class="memberOutDate"></td>
									</tr>
								</table>
								<br> <br> <br>
								
							</div>


							<!-- <div class="survey">
								<h4 id="surveyTitle" onclick="surveyClick(this);">설문조사 <i class="dropdown icon"></i></h4>
								<table class="surveyTable" id="surveyContent" style="display:none;">
									<tr id="surveyHead">
										<th>번호</th>
										<th>질문</th>
										<th>내용</th>
									</tr>
									<tr>
										<td>1</td>
										<td>예식장을 예약하셨나요?</td>
										<td>Y</td>
									</tr>
									<tr>
										<td>2</td>
										<td>선호하는 드레스 스타일은?</td>
										<td><p>보헤미안 스타일</p></td>
									</tr>
									<tr>
										<td>3</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>4</td>
										<td></td>
										<td></td>
									</tr>
								</table>
							</div> -->

							<br>

						


						</div>

					</div>


				</div>


				<!-- <div class="col-sm-2 sidenav2"></div> -->

			</div>
		</div>
		</div>
		

		<!-- 커먼 풋터 -->
		<div class="footerArea">
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
		</div>
		
		<script>
			/* function surveyClick(obj){
				var tr = $(obj);
				var sub = tr.next();
				
				if(sub.is(":visible")){
					sub.slideUp();
				}else{
					sub.slideDown();
				}
			} */
			
			
			$(function() {
				
				 $('#datePicker').datepicker({
	                    showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
	                    buttonImage: "images/calendar.gif", // 버튼 이미지
	                    buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
	                    buttonText: "날짜선택",             // 버튼의 대체 텍스트
	                    dateFormat: "yy-mm-dd",             // 날짜의 형식
	                    changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
	                    minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
	                    onClose: function( selectedDate ) {    
	                        // 시작일(fromDate) datepicker가 닫힐때
	                        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	                        $("#toDate").datepicker( "option", "minDate", selectedDate );
	                    }                
	                });

	                //종료일
	                $('#datePicker').datepicker({
	                    showOn: "both", 
	                    buttonImage: "images/calendar.gif", 
	                    buttonImageOnly : true,
	                    buttonText: "날짜선택",
	                    dateFormat: "yy-mm-dd",
	                    changeMonth: true,
	                    minDate: 0, // 오늘 이전 날짜 선택 불가
	                    onClose: function( selectedDate ) {
	                        // 종료일(toDate) datepicker가 닫힐때
	                        // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
	                        $("#fromDate").datepicker( "option", "maxDate", selectedDate );
	                    }                
	                });
				
				// 회원 조건 검색 ajax
				$(".searchMemberListBtn").click(function() {
					console.log("버튼눌림");
					
					// 가입일
					var efirstDate = $(".efirstDate").val();
					var elastDate = $(".elastDate").val();
					 
					var efirstDateArr = new Array();
					var elastDateArr = new Array();
					
					for(var i=0; i<efirstDate.split("-").length; i++){
						 efirstDateArr[i] = efirstDate.split("-")[i];
						 elastDateArr[i] = elastDate.split("-")[i];
					}
					
					// 결혼 예쩡일
					var wfirstDate = $(".wfirstDate").val();
					var wlastDate = $(".wlastDate").val();
					 
					var wfirstDateArr = new Array();
					var wlastDateArr = new Array();
					
					for(var i=0; i<wfirstDate.split("-").length; i++){
						 wfirstDateArr[i] = wfirstDate.split("-")[i];
						 wlastDateArr[i] = wlastDate.split("-")[i];
					}
					
					var searchCondition = [$(".memberInfoSelect option:selected").val(), 
										   $(".memberInfoInput").val(), 
										   $("input:radio[name=memberEnrollDate]:checked").val(),
										   efirstDateArr.join(""), 
										   elastDateArr.join(""),
										   $("input:radio[name=memberWeddingDate]:checked").val(),
										   wfirstDateArr.join(""), 
										   wlastDateArr.join(""),
										   $("input:radio[name=memberStatus]:checked").val()];
					
					// console.log(searchCondition);
					
					$.ajaxSettings.traditional = true;
					$.ajax({
						url:"searchMember.ad",
						traditional:true,
						data:{searchCondition:searchCondition},
						type:"get",
						success:function(data) {
							$(".memberListTable tbody").empty();
							
							for(var i in data) {
								$infoTr = $("<tr>");
								$inputTd = $("<td>");
								$checkbox = $("<input type='checkbox'>");
								$rNumTd = $("<td>").text(data[i].num);
								$nickNameTd = $("<td>").text(data[i].member.nickName);
								$memberNameTd = $("<td>").text(data[i].member.memberName);
								$genderTd = $("<td>").text(data[i].member.gender);
								$phoneTd = $("<td>").text(data[i].member.phone);
								$emailTd = $("<td>").text(data[i].member.email);
								$enrollDateTd = $("<td>").text(data[i].member.enrollDate);
								$weddingDateTd = $("<td>").text(data[i].member.weddingDate);
								$statusTd = $("<td>").text(data[i].member.status);
								
								$inputTd.append($checkbox);
								$infoTr.append($inputTd);
								$infoTr.append($rNumTd);
								$infoTr.append($nickNameTd);
								$infoTr.append($memberNameTd);
								$infoTr.append($genderTd);
								$infoTr.append($phoneTd);
								$infoTr.append($emailTd);
								$infoTr.append($enrollDateTd);
								$infoTr.append($weddingDateTd);
								$infoTr.append($statusTd);
								
								$(".memberListTable").append($infoTr);
								
								searchMemberDetailInfo();
								
							}
							
						},
						error:function(data) {
							console.log("에러펑션");
						}
					});

				});
				
				
				// 회원 상세 정보 조회 ajax
				function searchMemberDetailInfo() {
					$(".memberListTable tbody td").mouseenter(function() {
						$(this).parent().css({"background":"mistyrose", "cursor":"pointer"});
					}).mouseout(function() {
						$(this).parent().css({"background":"white"});
					}).click(function() {
						var num = $(this).parent().children().eq(1).text();
						$.ajax({
							url:"selectOneMember.ad",
							data:{num:num},
							type:"get",
							success:function(data) {
								$(".memberId").text(data.memberId);	
								$(".memberName").text(data.memberName);	
								$(".memberNickName").text(data.nickName);	
								$(".memberGender").text(data.gender);	
								$(".memberPhone").text(data.phone);	
								$(".memberEmergenCon").text(data.emergenCon);	
								$(".memberEmail").text(data.email);	
								$(".memberMnotiType").text(data.mnotiType);	
								$(".memberEnrollDate").text(data.enrollDate);	
								$(".memberWeddingDate").text(data.weddingDate);	
								$(".memberStatus").text(data.status);	
								$(".memberOutDate").text(data.outDate);
							}
						});
						
					});
				}	
					
			});
			
		</script>
		
</body>
</html>
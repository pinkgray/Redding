<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.redding.member.model.vo.*, com.kh.redding.admin.model.vo.*, java.util.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	TotalMemberPageInfo pi = (TotalMemberPageInfo) request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	ArrayList<HashMap<String, Object>> oneCompany = (ArrayList<HashMap<String, Object>>) request.getAttribute("oneCompany");
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
	href="${pageContext.request.contextPath}/css/admin/a_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a_company.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<link href="${pageContext.request.contextPath}/css/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/css/dist/js/datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/css/dist/js/i18n/datepicker.en.js"></script>

<title>Redding♥</title>
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
							<li onclick="location.href='<%=request.getContextPath()%>/selectList.co'">업체 목록</li>
							<li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_Message.jsp'">받은 쪽지 관리</li>
                     		<li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_SendMessage.jsp'">보낸 쪽지 관리</li>
						</ul>
					</div> --%>
				</div>
			</div>

			<div class="visible-xs sideListnav2">
				<div class="col-sm-2 sidenav1">
					<%-- <div class="sidenavArea2">
						<ul class="navList2">
							<li onclick="location.href='<%=request.getContextPath()%>/selectList.co'">업체 목록</li>
							<li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_Message.jsp'">받은 쪽지 관리</li>
                     		<li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_SendMessage.jsp'">보낸 쪽지 관리</li>
						</ul>
					</div> --%>
				</div>

				<br> <br>
			</div>

			<div class="col-sm-10 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="companyArea">
					<div class="companyNum">
						<br> <br> <br>
						<table class="companyNumtable">
							<tr>
								<td class="companyNumTableTd1">전체업체</td>
								<td><%=request.getAttribute("allCompanyListCount")%>개</td>
								<td class="companyNumTableTd1">신규업체</td>
								<td><%=request.getAttribute("newCompanyListCount")%>개</td>
								<td class="companyNumTableTd1">탈퇴업체</td>
								<td><%=request.getAttribute("withdrawalCompanyListCount")%>개</td>
							</tr>
						</table>
					</div>
					<br> <br> <br>

					<div class="companyList">
						<label class="subtitle">업체 목록</label>
						<br> <br> <br>
						<form method="post"> 
							<table class="searchCompanyList">
								<tr>
									<td class="searchCompanyListTd1">업체명</td>
									<td class="searchCompanyListTd2"><input type="text" style="border:1px solid darkgray; height:25px;" class="companyName" name="companyName"></td>
								</tr>
								<tr>
									<td class="searchCompanyListTd1">업체구분</td>
									<td class="searchCompanyListTd2"><input type="radio" value="전체" name="companyCategory" checked>&nbsp;&nbsp;전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" value="스튜디오" name="companyCategory">&nbsp;&nbsp;스튜디오&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" value="드레스" name="companyCategory">&nbsp;&nbsp;드레스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" value="메이크업" name="companyCategory">&nbsp;&nbsp;메이크업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td rowspan="2" class="searchCompanyListTd1">가입일</td>
									<td class="searchCompanyListTd2"><input type="radio" value="전체" name="companyEnrollDate" checked>&nbsp;&nbsp;전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" value="오늘" name="companyEnrollDate">&nbsp;&nbsp;오늘&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" value="일주일 이내" name="companyEnrollDate">&nbsp;&nbsp;일주일 이내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" value="1개월 이내" name="companyEnrollDate">&nbsp;&nbsp;1개월 이내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" value="3개월 이내" name="companyEnrollDate">&nbsp;&nbsp;3개월 이내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td class="searchCompanyListTd2"><input type="radio" value="검색" name="companyEnrollDate">&nbsp;&nbsp;검색&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type='text' class='datepicker-here firstDate pick' data-language='en' data-date-format ='yyyy-mm-dd' style="border:1px solid darkgray; height:25px;">&nbsp;&nbsp;-&nbsp;&nbsp; 
										<input type='text' class='datepicker-here lastDate pick' data-language='en' data-date-format ='yyyy-mm-dd' style="border:1px solid darkgray; height:25px;">
									</td>
								</tr>
								<tr>
									<td class="searchCompanyListTd1">활동 상태</td>
									<td class="searchCompanyListTd2"><input type="radio" value="전체" name="companyStatus" checked>&nbsp;&nbsp;전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" value="Y" name="companyStatus">&nbsp;&nbsp;활동업체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" value="N" name="companyStatus">&nbsp;&nbsp;탈퇴업체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
							</table>
							<br>
							<div class="searchCompanyListBtnArea">
								<button type="button" class="searchCompanyListBtn">검색</button>
							</div>
						</form>
						<br> <br>
						<div class="companyBaseInfo">
							<table class="companyListTable" id="detail">
								<thead>
									<tr style="background:mistyrose;">
										<td>선택</td>
										<td>번호</td>
										<td>업체구분</td>
										<td>업체명</td>
										<td>가입일</td>
										<td>활동상태</td>
										<td>쪽지보내기</td>
									</tr>
								</thead>
								<%
									for (int i = 0; i < list.size(); i++) {
											HashMap<String, Object> hmap = list.get(i);
								%>
								<tbody>
									<tr>
										<td><input type="checkbox"></td>
										<td><%=hmap.get("num")%></td>
										<%
											Member company = (Member) hmap.get("member");
										%>
										<td><%=hmap.get("comType")%></td>
										<td><%=company.getMemberName()%></td>
										<td><%=company.getEnrollDate()%></td>
										<td><%=company.getStatus()%></td>
										<td><div class="reply">쪽지보내기</div>
											<input type="hidden" class="cno" name="cno" id="cno" value="<%=company.getMno()%>">
										</td>
									</tr>
								</tbody>
								<%
									}
								%>
							</table>
							<br>
							<!-- 페이지 버튼 처리 -->
							<div class="pagingArea" align="center">
								<button
									onclick="location.href='<%=request.getContextPath()%>/selectList.co?currentPage=1'"><<</button>
								<%
									if (currentPage <= 1) {
								%>
								<button disabled><</button>
								<%
									} else {
								%>
								<button
									onclick="location.href='<%=request.getContextPath()%>/selectList.co?currentPage=<%=currentPage - 1%>'"><</button>
								<%
									}
								%>

								<%
									for (int p = startPage; p <= endPage; p++) {
										if (p == currentPage) {
								%>
								<button disabled><%=p%></button>
								<% 
									} else {
								%>
								<button onclick="location.href='<%=request.getContextPath()%>/selectList.co?currentPage=<%=p%>'"><%=p%></button>
								<%
									}
								%>

								<%
									}
								%>

								<%
									if (currentPage >= maxPage) {
								%>
								<button disabled>></button>
								<%
									} else {
								%>
								<button onclick="location.href='<%=request.getContextPath()%>/selectList.co?currentPage=<%=currentPage + 1%>'">></button>
								<%
									}
								%>
								<button onclick="location.href='<%=request.getContextPath()%>/selectList.co?currentPage=<%=maxPage%>'">>></button>
								<br>
								<!-- <div class="btns">
									<button class="ui pink button" style="background: salmon;">블랙리스트
										추가</button>
									<button class="ui pink button" style="background: salmon;">탈퇴</button>
								</div> -->
							</div>

						</div>
						<br> <br> <br>
						<label class="subtitle">업체 상세정보 조회</label>
						<br>

						<div>
							<br> <br>
							<table class="companyDetailnfo">
								<tr>
									<td class="companyDetailInfoTd1">아이디</td>
									<td class="memberId"></td>
									<td class="companyDetailInfoTd1">대표자명</td>
									<td class="repName"></td>
								</tr>
								<tr>
									<td class="companyDetailInfoTd1">업체구분</td>
									<td class="comType"></td>
									<td class="companyDetailInfoTd1">업체명</td>
									<td class="memberName"></td>
								</tr>
								<tr>
									<td class="companyDetailInfoTd1">이메일</td>
									<td class="memberEmail"></td>
									<td class="companyDetailInfoTd1">전화번호</td>
									<td class="memberPhone"></td>
								</tr>
								<tr>
									<td class="companyDetailInfoTd1">주소</td>
									<td class="companyAddress"></td>
									<td class="companyDetailInfoTd1">URL</td>
									<td class="companyUrl"></td>
								</tr>
								<tr>
									<td class="companyDetailInfoTd1">OPEN TIME</td>
									<td class="companyOpenTime"></td>
									<td class="companyDetailInfoTd1">CLOSE TIME</td>
									<td class="companyCloseTime"></td>
								</tr>
								<tr>
									<td class="companyDetailInfoTd1">은행</td>
									<td class="companyBank"></td>
									<td class="companyDetailInfoTd1">계좌번호</td>
									<td class="companyBankNum"></td>
								</tr>
								<tr>
									<td class="companyDetailInfoTd1">휴일</td>
									<td class="companyHoliday"></td>
									<td class="companyDetailInfoTd1">가입일</td>
									<td class="memberEnrollDate"></td>
								</tr>
								<tr>
									<td class="companyDetailInfoTd11">활동상태</td>
									<td class="memberStatus"></td>
									<td class="companyDetailInfoTd11">탈퇴일</td>
									<td class="memberEndDate"></td>
								</tr>

							</table>
							<br> <br> <br>



						</div>


					</div>


					<!-- <div class="col-sm-2 sidenav2"></div> -->
				</div>
				</div>
			</div>
		</div>
		<!-- 커먼 풋터 -->
		<div class="footerArea">
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
		</div>

		<script>
		
			$(function() {
				
				$(".searchCompanyListBtn").click(function() {
					
					var firstDate = $(".firstDate").val();
					var lastDate = $(".lastDate").val();
					 
					var firstDateArr = new Array();
					var lastDateArr = new Array();
					
					for(var i=0; i<firstDate.split("-").length; i++){
						 firstDateArr[i] = firstDate.split("-")[i];
						 lastDateArr[i] = lastDate.split("-")[i];
					}
					
					var searchCondition = [$(".companyName").val(), 
										   $("input:radio[name=companyCategory]:checked").val(), 
										   $("input:radio[name=companyEnrollDate ]:checked").val(), 
										   $("input:radio[name=companyStatus]:checked").val(), 
										   firstDateArr.join(""), 
										   lastDateArr.join("")];
					// console.log(searchCondition);
					$.ajaxSettings.traditional = true;
					$.ajax({
						url:"searchCompany.ad",
						traditional:true,
						data:{searchCondition:searchCondition},
						type:"get",
						success:function(data) {
							// console.log(data);
							
							$(".companyListTable tbody").empty();
							
							for(var i in data) {
								$infoTr = $("<tr>");
								$inputTd = $("<td>");
								$checkbox = $("<input type='checkbox'>");
								$rNumTd = $("<td>").text(data[i].num);
								$comTypeTd = $("<td>").text(data[i].comType);
								$memberNameTd = $("<td>").text(data[i].member.memberName);
								$enrollDateTd = $("<td>").text(data[i].member.enrollDate);
								$statusTd = $("<td>").text(data[i].member.status);
								
								$replyTd = $("<td>");
		                        $replyIn = $("<div class='reply'>");
		                        $replyIn.html("쪽지보내기");
		                        
		                        $cnoIn = $("<input type='hidden' class='cno' name='cno' id='cno' readonly>");
	                            $cnoIn.val(data[i].member.mno);
	                             
	                            $replyIn.append($cnoIn);
		                        $replyTd.append($replyIn);
								
								$inputTd.append($checkbox);
								$infoTr.append($inputTd);
								$infoTr.append($rNumTd);
								$infoTr.append($comTypeTd);
								$infoTr.append($memberNameTd);
								$infoTr.append($enrollDateTd);
								$infoTr.append($statusTd);
								$infoTr.append($replyTd);
								
								$(".companyListTable").append($infoTr);
								
								$(".reply").click(function(){
									var cno = $(this).children().val();
		                               console.log(cno);
		                               location.href="<%=request.getContextPath()%>/getComNo.mes?cno="+cno;

		                        });
								
								searchCompanyDetailInfo();
							}
						},
						error:function(data) {
							console.log("에러펑션");
						}
					});
					
				}); 
				
				// 업체 상세 정보 조회 ajax
				function searchCompanyDetailInfo() {
					$(".companyListTable tbody td").mouseenter(function() {
						$(this).parent().css({"background":"mistyrose", "cursor":"pointer"});
					}).mouseout(function(){
						$(this).parent().css({"background":"white"});
					}).click(function() {
						var num = $(this).parent().children().eq(1).text();
						$.ajax({
							url:"selectOneCompany.ad",
							data:{num:num},
							type:"get",
							success:function(data) {
								
								$(".memberId").text(data[0].memberId);
								$(".repName").text(data[0].repName);
								$(".comType").text(data[0].comType);
								$(".memberName").text(data[0].memberName);
								$(".memberEmail").text(data[0].memberEmail);
								$(".memberPhone").text(data[0].memberPhone);
								$(".companyAddress").text(data[0].companyAddress);
								$(".companyUrl").text(data[0].companyUrl);
								$(".companyOpenTime").text(data[0].companyOpenTime);
								$(".companyCloseTime").text(data[0].companyCloseTime);
								$(".companyBank").text(data[0].companyBank);
								$(".companyBankNum").text(data[0].companyBankNum);
								$(".companyHoliday").text(data[0].companyHoliday);
								$(".memberEnrollDate").text(data[0].memberEnrollDate);
								$(".memberStatus").text(data[0].memberStatus);
								$(".memberOutDate").text(data[0].memberOutDate);
							}
						});
					});
					
				}
				$(".reply").click(function(){
					var cno = $(this).siblings(".cno").val();
	                  console.log(cno);
	                  location.href="<%=request.getContextPath()%>/getComNo.mes?cno="+cno;

	            });
				
			});
			
	
		</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.redding.admin.model.vo.*, java.util.*" %>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	TotalMemberPageInfo pi = (TotalMemberPageInfo) request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
	href="${pageContext.request.contextPath}/css/admin/a_calculateRefund.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/a_stats.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<title>REDDING♥</title>
</head>
<body>

	<%-- <div>
		<jsp:include page="/views/admin/a_nav.jsp"></jsp:include>
	</div> --%>
	<%@ include file="/views/admin/a_sideNav.jsp" %>
	
	<div class="container-fluid text-center">
		<div class="row content">
		
			
				
				<!-- 여기는 큰화면 -->
				<div class="visible-md visible-lg visible-sm">
				<div class="col-sm-2 sidenav1">
					<!-- <div class="sidenavArea">
						<ul class="navList">
							<li id="memCalc">회원 정산</li>	
							<li id="memRefund">회원 환불 정산</li>	
							<li id="comCalc">업체 정산</li>
						</ul>
					</div> -->
				</div>
			</div>
				
				
				<!-- 여기는 스마트폰 -->
				<div class="visible-xs sideListnav2">
					<div class="col-sm-2 sidenav1">
					</div>
					
					<br><br>
				</div>
				
			
			
			<div class="col-sm-10 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
		<br>
				<div class="pselectArea">
				<div class="memberRefund">
				<h2 style="margin-left:20px;">정산 대기 리스트</h2>
				<br>
					<table class="refundTable">
						<tr>
							<th>No.</th>
							<th>결제번호</th>
							<th>결제코드</th>
							<th>이전 코드</th>
							<th>업체</th>
							<th>상품</th>
							<th>판매액</th>
							<th>주문자</th>
							<th>결제수단</th>
							<th>결제완료일</th>
							<th>최종금액</th>
							<th>결제상태</th>
							<th>승인상태</th>
							<th>환불</th>
						</tr>
					<%
						for (int i = 0; i < list.size(); i++) {
						HashMap<String, Object> hmap = list.get(i);
					%>
						<tr>
							<td id="mno" hidden><%=hmap.get("mno") %></td>
							<td id="rnum"><%=hmap.get("rnum")%></td>
							<td id="payno"><%=hmap.get("payno") %></td>
							<td id="paycode"><%=hmap.get("paycode") %></td>
							<td id="replaycode"><%=hmap.get("replaycode") %></td>
							<td id="cname"><%=hmap.get("cname") %></td>
							<td id="pname"><%=hmap.get("pname") %></td>
							<td id="price"><%=hmap.get("price") %></td>
							<td id="mname" style="width:60px;"><%=hmap.get("mname") %></td>
							<td id="pselect"><%=hmap.get("pselect")%></td>
							<td id="pcompdate"><%=hmap.get("pcompdate") %></td>
							<td id="fprice"><%=hmap.get("fprice") %></td>
					<%
							if(hmap.get("paydiv").equals("환불")){
					%>
							<td id="paydiv" style="width:40px;"><%=hmap.get("paydiv") %></td>
					<% 
							}else{
					%>		
							<td id="paydiv" style="width:40px; color:green;"><%=hmap.get("paydiv") %></td>
					<%
							}
					%>		
							
					<%
							if(hmap.get("pstatus").equals("승인")){
					%>
							<td id="pstatus" class="pstatus" style="color:blue;"><%=hmap.get("pstatus") %></td>
					<% 
							}else{
					%>		
							<td id="pstatus" class="pstatus" style="color:red;"><%=hmap.get("pstatus") %></td>
					<%
							}
					%>		
						
					<%
							if(hmap.get("pstatus").equals("승인")){
					%>		
							<td><button class="ui green button" id="refund" style="width:70px;" disabled>환불</button></td>
					<% 
							}else{
					%>
							<td><button class="ui green button" id ="refund" style="width:70px;">환불</button></td>	
					<%
							}
					%>	
						
						
						</tr>
					<%	
						}
					%>	
					</table>
					</div>
					<br>
					
					
					
					<div class="pagingArea" align="center">
						<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showRefund.ad?currentPage=1'"><<</button>
						<% if(currentPage <= 1) { %>
						<button disabled class="ui button"><</button>
						<% } else { %>
						<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showRefund.ad?currentPage=<%= currentPage - 1 %>'"><</button>
						<% } %>
						
						<% for(int p = startPage; p <= endPage; p++) { 
								if(p == currentPage) { %>
									<button class="ui button" disabled><%= p %></button>
						<% 		}else {%>
									<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showRefund.ad?currentPage=<%= p %>'"><%= p %></button>
						<%		} %>
							
						<% } %>
						
						<% if(currentPage >= maxPage) { %>
						<button class="ui button" disabled>></button>
						<% } else { %>
						<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showRefund.ad?currentPage=<%= currentPage + 1 %>'">></button>
						<% } %>
						<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showRefund.ad?currentPage=<%= maxPage %>'">>></button>
						<br>
						</div>
				</div>
				<br><br>
				
				
			<!-- <div class="col-sm-2 sidenav2"></div> -->
		</div>
	</div>
	</div>
	<br><br><br>
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	
	<script>	
	
	//배경 바꾸기
	$(function() {
		$(".calcTable td").mouseenter(function() {
			$(this).parent().css({"background":"mistyrose", "cursor":"pointer"});
		}).mouseout(function() {
			$(this).parent().css({"background":"white"});
		}); 
	});
	
	
	//회원정산메뉴 클릭
	$("#memCalc").click(function(){
		 location.href="<%=request.getContextPath()%>/showCalc.ad"; 
		
	});
	
	//회원 환불 메뉴 클릭
	$("#memRefund").click(function(){
		location.href="<%=request.getContextPath()%>/showRefund.ad"; 
	});
	
	//업체 정산 메뉴 클릭
	$("#comCalc").click(function(){
		location.href="<%=request.getContextPath()%>/showComCalc.ad"; 
	});
		
	
	
	//환불 메소드
	$(document).on("click","#refund",function(){
		var payno = $(this).closest("td").siblings('#payno').text();
		
		$.ajax({
			url : "/redding/memberRefund.ad",
  			data : {payno:payno},
  			type : "post",
  			success : function(data){
  				if(data>0){
  					alert("환불 성공!");
  					
  					location.href="<%=request.getContextPath()%>/showRefund.ad?currentPage=<%= currentPage%>";
  				}else{
  					alert("환불 실패!");
  				}
  				
  				
  			},error:function(){
  				console.log("환불하기 실패!");
  			}
		});
		
		
	});
	
	
		
	</script>

	
	

</body>
</html>
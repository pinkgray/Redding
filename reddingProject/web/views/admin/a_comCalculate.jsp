<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.redding.admin.model.vo.*, java.util.*" %>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	TotalMemberPageInfo pi = (TotalMemberPageInfo) request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	ArrayList<HashMap<String, Object>> slist = (ArrayList<HashMap<String, Object>>) request.getAttribute("slist");
	ArrayList<HashMap<String, Object>> clist = (ArrayList<HashMap<String, Object>>) request.getAttribute("clist");
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
	href="${pageContext.request.contextPath}/css/admin/a_comCalculate.css">
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
					
					
				</div>
				
			
			
			<div class="col-sm-10 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
		<br>
				<div class="pselectArea">
				<div class="memberRefund">
				<h2 style="margin-left:20px;">정산 대기 리스트 확인</h2>
				<br>
					<table class="comCalcTable">
						<tr>
							<th>No.</th>
							<th>업체번호</th>
							<th>업체명</th>
							<th>정산금액</th>
							<th></th>
						</tr>
					<%
					if (list != null){
						for (int i = 0; i < list.size(); i++) {
							HashMap<String, Object> hmap = list.get(i);
					%>
						<tr>
							<td id="rnum"><%=hmap.get("rnum")%></td>
							<td id="cno" class = "cno"><%=hmap.get("cno") %></td>
							<td id="cname"><%=hmap.get("cname") %></td>
							<td id="final"><%=hmap.get("final") %></td>
							<td><button class="ui blue button" id="confirm">확인요청</button></td>
						</tr>
					<%
						}
					}
					%>
					</table>
					</div>
					<br>
					<div class="pagingArea" align="center">
						<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showComCalc.ad?currentPage=1'"><<</button>
						<% if(currentPage <= 1) { %>
						<button disabled class="ui button"><</button>
						<% } else { %>
						<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showComCalc.ad?currentPage=<%= currentPage - 1 %>'"><</button>
						<% } %>
						
						<% for(int p = startPage; p <= endPage; p++) { 
								if(p == currentPage) { %>
									<button class="ui button" disabled><%= p %></button>
						<% 		}else {%>
									<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showComCalc.ad?currentPage=<%= p %>'"><%= p %></button>
						<%		} %>
							
						<% } %>
						
						<% if(currentPage >= maxPage) { %>
						<button class="ui button" disabled>></button>
						<% } else { %>
						<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showComCalc.ad?currentPage=<%= currentPage + 1 %>'">></button>
						<% } %>
						<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showComCalc.ad?currentPage=<%= maxPage %>'">>></button>
						<br>
						</div>
					
					
					
					<br><br><br><br><br>

					<div class="memberRefund">
						<h2 style="margin-left:20px;">정산 상태 리스트</h2>
						<button class="ui button" id="status" style="margin-left:20px; background:salmon; color:white">확인</button>
						<br><br>
						<table class="comCalcTable2" id="comCalcTable2">
							<thead>
							<tr>
								<th>월</th>
								<th>결제코드</th>
								<th>업체명</th>
								<th>정산금액</th>
								<th>정산예정날짜</th>
								<th>승인날짜</th>
								<th>답변상태</th>
							</tr>
							</thead>
							<tbody></tbody>
							
							
						</table>
					
					</div>



				</div>
				<br><br>
				
				
			<div class="col-sm-2 sidenav2"></div>
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
		
		
		
		//확인요청 disabled
		<%for(int j=0; j<clist.size(); j++){
				HashMap<String, Object> chmap = clist.get(j); 
				int listcno = (int)chmap.get("cno"); 
				int price = (int)chmap.get("price");
				%>
			$(".cno").each(function(index){
				//console.log(index + ":" + $(this).text());
				var cno = $(this).text();
				var finalprice = $(this).parent().children().eq(3).text();
				
				if (cno == <%=listcno%> ){
					if (finalprice == <%=price%>){
					var btn = $(this).parent().children().eq(4).children();
					
					console.log(btn);
					
					btn.attr("disabled", true);
					}
				}
				
			});
		<% } %>	
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
		
	
	
	//확인요청 메소드
	$(document).on("click","#confirm",function(){
		var cno = $(this).closest("td").siblings('#cno').text();
		var price =$(this).closest("td").siblings("#final").text();
		var but = $(this);
		
		
		$.ajax({
			url : "/redding/confirmComCalc.ad",
  			data : {cno:cno, price:price},
  			type : "post",
  			success : function(data){
  				if(data>0){
  					alert("확인 요청 성공!");
  					but.attr("disabled",true);
  				}else{
  					alert("이미 확인 요청 했습니다!");
  				}
  				
  			},error:function(){
  				console.log("확인 요청 실패!");
  			}
		});
		
		
	});
	
	
	$("#status").click(function(){
		$.ajax({
			url : "/redding/comCalcStatus.ad",
  			type : "post",
  			success : function(data){
  				console.log(data);
  				
  				$comCalcTableBody = $("#comCalcTable2 tbody");
  				$comCalcTableBody.html('');
				
  				for(var i in data){
  					console.log(i);
	  				var $tr = $("<tr>");
	  				var $month = $("<td>").text(data[i].month);	
	  				var $calccode = $("<td>").text(data[i].calccode);
	  				var $cname = $("<td>").text(data[i].cname);
	  				var $price= $("<td>").text(data[i].price);
	  				var $caldate = $("<td>").text(data[i].caldate);
	  				var $confirm = $("<td>").text(data[i].confirm);
	  				var $answer = $("<td>").text(data[i].answer);
	  				
	  				$tr.append($month);
	  				$tr.append($calccode);
	  				$tr.append($cname);
	  				$tr.append($price);
	  				$tr.append($caldate);
	  				$tr.append($confirm);
	  				$tr.append($answer);
	  				$comCalcTableBody.append($tr);
  				
  				}
  			},error:function(){
  				console.log("상태 조회 실패!");
  			}
			
			
		});
		
		
		<%-- location.href="<%=request.getContextPath()%>/comCalcStatus.ad"; --%> 
		
	});
		
	</script>

	
	

</body>
</html>
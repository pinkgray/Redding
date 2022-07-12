<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.redding.admin.model.vo.*, java.util.*, com.kh.redding.member.model.vo.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_calcComHistory.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<style>
.row.content {
	height: auto;
}

.sidenav1 {
	padding-top: 20px;
	height: 100%;
}

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

			
			<div class="col-sm-2 sidenav1 visible-md visible-lg visible-sm">
				<div id="requestCalc">정산 요청</div>
				<br><br>
				<div id="clacHistory">정산 내역</div>
			</div>


			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>

				<div class="contentsArea">

					<br>
					<br>
					<br>
					
						<label class="subSubTitle" style="color:salmon;">정산 내역</label>
						<label style="float: right; color:salmon;">월 별 검색</label> 
							<select id="monthSelect" style="float: right;">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
						</select> <br>
						<br>

					<div class="CalcHistory">
						<table class="calcHistoryTable">
							<thead>
							<tr>
								<th>년/월</th>
								<th>업체명</th>
								<th>정산금액</th>
								<th>정산날짜</th>
								<th>승인여부</th>
								<th>확인날짜</th>
							</tr>
							</thead>
							<tbody>
						<%
						for (int i = 0; i < list.size(); i++) {
						HashMap<String, Object> hmap = list.get(i);
						%>
							<tr>
								<td id="mno" hidden><%=loginUser.getMno() %></td>
								<td id="cno" hidden><%= hmap.get("cno") %></td>
								<td id="calccode" hidden><%= hmap.get("calccode") %></td>
								<td id="month"><%= hmap.get("month") %></td>
								<td id="cname"><%=hmap.get("cname") %></td>
								<td id="price"><%=hmap.get("final") %></td>
								<td id="caldate"><%=hmap.get("caldate") %></td>
								<td id="confirm"><%=hmap.get("confirm") %></td>
								<td id="checkdate"><%=hmap.get("checkdate") %></td>
							</tr>
							<%	
						}
					%>
					</tbody>
						</table>
					</div>
				</div>
			</div>


			<br><br><br><br><br><br>
			<br><br><br><br><br><br>
			<br><br><br><br><br><br>
			<br><br><br><br><br><br>
			<br><br><br><br><br><br>


			<div class="col-sm-2 sidenav2"></div>
		</div>
	</div>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	<script>
 	//업체 정산 메뉴
	$("#requestCalc").click(function(){
		 location.href="<%=request.getContextPath()%>/showMonCalc.co?mno=<%=loginUser.getMno()%>"; 
	});
	
	//업체 정산 내역
	$("#clacHistory").click(function(){
		location.href="<%=request.getContextPath()%>/calcHistory.co?mno=<%=loginUser.getMno()%>";
	});

	//달 가져오기
	$("#monthSelect").on("change", function() {
		var month = $("#monthSelect option:selected").val();
		var mno = <%=loginUser.getMno() %>;
		
		
		$.ajax({
			url : "/redding/searchMonCalc.co",
 			data : {month:month, mno:mno},
 			type : "post",
 			success : function(data){
 				
 				$calcHistoryTableBody = $(".calcHistoryTable tbody");
 				$calcHistoryTableBody.html('');
 				
  				for(var i in data){
  					var $tr = $("<tr>");
  					var month = $("<td>").text(data[i].month);
  					var cname = $("<td>").text(data[i].cname);
  					var price = $("<td>").text(data[i].price);
  					var caldate = $("<td>").text(data[i].caldate);
  					var confirm = $("<td>").text(data[i].confirm);
  					var checkdate = $("<td>").text(data[i].checkdate);
  					
  					$tr.append(month);
  					$tr.append(cname);
  					$tr.append(price);
  					$tr.append(caldate);
  					$tr.append(confirm);
  					$tr.append(checkdate);
  					$calcHistoryTableBody.append($tr);
  				}
 				
 				
 			},error:function(){
 				console.log("월별 정산 내역 조회 실패!");
 			}
		});
		 
		
	});
	</script>
</body>
</html>
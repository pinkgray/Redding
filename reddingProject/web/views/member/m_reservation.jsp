<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.redding.member.model.vo.Member"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	/* String reserveList = (String) request.getAttribute("reservList"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REDDING♥</title>
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
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_myPage.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_reservation.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/semantic/dropdown.min.css">
<script src="<%=request.getContextPath()%>/js/semantic.min.js"></script>
<script src="<%=request.getContextPath()%>/js/dropdown.min.js"></script>
	


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
.container {
	width: 100%;
	color: salmon;
	font-family: 'Noto Sans KR', sans-serif;
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
</style>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<%@ include file="/views/member/m_header.jsp" %>
	</div>
	<br>


	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">

			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="reserveArea">
					<%
						for (int i = 0; i < list.size(); i++) {
							HashMap<String, Object> hmap = list.get(i);
							System.out.println(list);
					%>

					<table
						style="width: 100%; margin-left: auto; margin-right: auto; background: mistyrose; margin-top:40px;">
						<tr>
							<td colspan="4"><h1 align="center" style="color: salmon; font-size: 35px;">예약</h1></td>
						</tr>
						<tr>
							<td class="imagetd" width="40%" height="470px"><img id="image" style=" max-width:100%; height:400px;" src="<%= request.getContextPath() %>/company_upload/<%=hmap.get("changename").toString()%>">
								<br>
							<br> <input class="form-control" id="productDetail"
								type="text" readonly value=<%=hmap.get("pContent")%>></td>

							<td class="visible-md visible-lg visible-sm visible-xs" width="30%"
								style="padding: 5%"><br>
								<table style="width: 100%">
									<tr>
										<td><label>업체명</label><input class="form-control"
											id="CompanyName" type="text" value='<%=hmap.get("cName")%>'
											style="width: 100%; height: 30px" readonly><br>
										</td>
									</tr>
									<tr>
										<td><label>상품명</label><input class="form-control"
											id="productName" type="text" value='<%=hmap.get("pname")%>'
											style="width: 100%; height: 30px" readonly><br>
										</td>
									</tr>
									<tr>
										<td><label>예약자</label> <br> <input
											class="form-control" id="userMno" type="text"
											style="width: 100%; height: 30px; float: left; margin-right: 20px"
											value="<%=loginUser.getMemberName()%>" readonly> <br>
										<br>
										<br></td>
									</tr>
									<tr>
										<td><label>가격</label> <br> <input
											class="form-control" id="price" type="text"
											value='<%=hmap.get("price")%>'
											style="width: 100%; height: 30px; float: left; margin-right: 20px"
											readonly> <br>
										<br>
										<br></td>
									</tr>
									<tr>
										<td><label>예약날짜</label> <br> <select
											id="reserveDate<%= hmap.get("pno")%>" class="ui search dropdown reserveDate" style="width: 100%; height:auto">
												<option>-- 날짜 선택 --</option>
											</select><br>
										<br>
										<br></td>
									</tr>
									<tr>
										<td><label>예약시간</label> <br> <select
											id="reserveTime<%= hmap.get("pno")%>" class="ui search dropdown reserveTime" style="width: 100%; height:auto">
											<option>-- 시간 선택 --</option>
											</select><br>
										<br>
										<br></td>
									</tr>

								</table>							
						</tr>
					</table>
						
					<%
						}
					%>

				</div>
				<br>
					<div style="text-align: center">
									<button class="ui gray button" id="reserve">예약</button>
									<button class="ui gray button" id="cancle"
										onclick="location.href='<%=request.getContextPath()%>/showList.wi?num=<%= loginUser.getMno() %>'">취소</button>
								</div>
				<br>

			</div>


			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

		</div>

	</div>
	<br>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>

	<script>
		$(function(){

		
				var $selectDate = $("select.reserveDate");				
						    
			    
			    
			    for(var i = 0; i<$("select.reserveDate").length; i++){

			    	var pnoId = $("select.reserveDate")[i].id;
			    	
			    	var pno = pnoId.replace(/[^0-9]/g,"");
			    	
			    	var $selectUseDate = $("#"+pnoId);
			    	
			    	if($selectUseDate.children().length == 1){
				    	useDateList(pno,pnoId);
				    }else{
				    	
				    }
			    }
			    
			    
			function useDateList(pno,pnoId){
				
			    $.ajax({
			    	url:"<%=request.getContextPath()%>/mselect.re",
			    	data: {pno:pno},
			    	type:"post",
			    	success:function(data){

			    		var $selectUseDate = $("#"+pnoId);
			    		
			    		$selectUseDate.empty();
			    		
			    		for(var key in data){
			    			
			    			if(data[key].uNum > 0){
			    				var $optionDate = $("<option>").text(data[key].useDate).val(data[key].useDate);
			    			}else{
			    				var $optionDate = $("<option>").text(data[key].useDate+"(마감)").val(data[key].useDate).css("background","lightgray").attr("disabled" ,true);
			    			}
			    			
			    			
			    			$selectUseDate.append($optionDate);
			    		}
			    		
			    		
			    		
			    		
			    	},
			    	error:function(data){
			    		console.log("error : " + data);
			    	}
			    });
				
			    }
			
			
			
			$("select.reserveDate").change(function(){
					
				    var useDate = $(this).val().split("-");
				    				    
			    	var pnoId = this.id;
			    	
			    	var pno = pnoId.replace(/[^0-9]/g,"");
			    	
			    	var $selectUseDate = $("#"+pnoId);
			    	
			    	$.ajax({
			    		url:"<%=request.getContextPath()%>/mselect.re",
			    		data:{pno:pno, useDate:useDate.join('')},
			    		type:"post",
			    		success:function(data){
			    			var $reserveTime = $("#reserveTime" + pno);
			    			$reserveTime.empty();
			    			
			    			for(var key in data){
			    				if(data[key].uNum > 0){
			    					$optionTime = $("<option>").text(data[key].startDate + "~" + data[key].endDate+ " (남은예약수 :" + data[key].uNum + ")").val(data[key].uPno);
			    				}else{			    				
			    					$optionTime = $("<option>").text(data[key].startDate + "~" + data[key].endDate+ "").val(data[key].uPno).css("background","lightgray").attr("disabled" ,true);
			    				}
			    				$reserveTime.append($optionTime);
			    			}
			    			
			    			
			    			
			    		},
			    		error:function(data){
			    			console.log("에러 : " + data); 
			    		}
			    		
			    	}); 
			    	
			    	
			    });
				
			$("#reserve").click(function(){
				var $selects = $("select.reserveTime");

				var pno = new Array();
				var num = 0;
				for(var i=0; i<$selects.length; i++){
					if($selects[i].children.length > 1){
					pno[i] = $selects[i].value;
					}else{
						num++;
					}					
				}
				console.log(pno);
				if(num > 0){
					window.alert("모든 예약을 선택하세요");
					num = 0;
				}else{
					
					var upno = new Array();
					<% for(int i=0; i<list.size(); i++){  %>
						
						upno[<%=i%>] = <%=list.get(i).get("pno") %>
				
					
				<%	} %>
										
				    location.href="<%=request.getContextPath() %>/insert.re?pno=" + pno.join(",") + "&mno=" + <%= loginUser.getMno() %> + "&upno="  + upno.join(",");
				}
				
				
				
				
				
					
			});
			
			
				
			});
				
		
		
		
		
		
		
	
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.redding.member.model.vo.Member"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	Member loginUser = (Member) session.getAttribute("loginUser");
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
	href="${pageContext.request.contextPath}/css/member/m_wishList.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<jsp:include page="/views/member/m_header.jsp"></jsp:include>
	</div>
	<br>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">

			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>

				<div class="wishListArea">
					<h1 style="text-align: center; color: salmon;">Wish List</h1>
					<div class="wishList">
						<table id="wishListTable">
							<tr>
								<th>업체명</th>
								<th></th>
								<th>제품명</th>
								<th>상품금액</th>
								<th><input type="checkbox" id="allCheck"></th>
							</tr>
							<%
								for (int i = 0; i < list.size(); i++) {
									HashMap<String, Object> hmap = list.get(i);
							%>
							<tr>
								<td class="cName"><%=hmap.get("mname")%></td>
								<td class="imagetd"><img id="image"
									style="max-width: 80%; height: 100px;"
									src="<%= request.getContextPath() %>/company_upload/<%=hmap.get("changename").toString()%>">
								</td>
								<td class="pName"><%=hmap.get("pname")%></td>
								<td class="price"><%=hmap.get("price")%></td>
								<td><input name="check" type="checkbox" id="checkbox"
									class="checkbox"></td>
								<td class="pno" hidden><%=hmap.get("pno")%></td>
								<td class="cType" hidden><%=hmap.get("ctype")%></td>
								<td class="wishCode" hidden><%=hmap.get("wishcode")%></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
					<br>
					<div class="button">
						<button class="ui gray button" id="eachReserve"
							style="display: inline-block">개별 예약</button>
						<button class="ui gray button" id="package"
							style="display: inline-block">패키지에 담기</button>
						<button class="ui gray button" id="delete"
							style="display: inline-block">삭제</button>
						<form action="<%=request.getContextPath()%>/delete.wi"
							method="post" id="deleteWishForm">
							<input type="hidden" name="deleteList" id="deleteList"> <input
								type="hidden" name="deleteListMno">
						</form>
					</div>

				</div>
				<br>
				<br>
				<br>
				<div class="pResult">
					<div class="wishpackage">
						<h2>패키지 구성</h2>
						<hr style="border-color: salmon; width:100%;">
						<div class="pack">
							<div class="packageArea" id="packageArea"
								style="display: inline-block">
								<div class="firstStudio" style="display: inline-block;"></div>
								<div class="packImg" style="display: inline-block">
									<img id="plus"
										src="<%=request.getContextPath()%>/images/plus.png">
									<p></p>
								</div>
								<div class="firstDress" style="display: inline-block;">
									<p></p>
								</div>
								<div class="packImg" style="display: inline-block">
									<img id="plus"
										src="<%=request.getContextPath()%>/images/plus.png">
									<p></p>
								</div>
								<div class="firstMakeup" style="display: inline-block;">
									<p></p>
								</div>
							</div>
						<hr style="border-color: salmon; width:100%;">
							<div class="packageArea2" id="packageArea2"
								style="display: inline-block">
								<!-- <div class="secondStudio" style="display:inline-block">
						</div>
						<div class="packImg" style="display:inline-block">
						</div>
						<div class="secondDress" style="display:inline-block">
						</div>
						<div class="packImg" style="display:inline-block">
						</div>
						<div class="secondMakeup" style="display:inline-block">
						</div>
						<div class="packImg" style="display:inline-block"> -->
								<table class="secondTable"
									style="text-align: center; background: lightgray;">
									<thead></thead>
								</table>
							</div>
						</div>
						
						<div>
							<table style="width:100%; height:100px; border-top:2px solid salmon;">
								<tr>
								<td>
									<%-- <img style="float: left;" src="<%=request.getContextPath()%>/images/equal.png"> --%>
									<label style="font-size:40px; color:gray;">=</label>
								</td>
								<td>
									<div class="finalPrice">	
									</div>
								</td>
								<td>
									<div class="button">
									<button class="ui pink button" style="background: salmon; float: left;" id="packReserve">패키지 예약하기</button>
									</div>
								</td>
								</tr>
							</table>
						</div>
						
						
						
						<%-- <div class="priceWrap">
							<img style="float: left;" src="<%=request.getContextPath()%>/images/equal.png">
							<div class="finalPrice">
							</div>
							<div class="button">
								<button class="ui pink button" style="background: salmon; float: left;" id="packReserve">패키지 예약하기</button>
							</div>
							<div class="totalPrice" style="float: left"></div>
						</div> --%>
					</div>
				</div>
			</div>

		</div>
				
				<br><br><br><br>
					

				</div>

			</div>


			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<script>
				$('#delete').click(function() {
					var deleteList = "";

					$("input[name=check]:checked").each(function() {
						if(deleteList == "") {
							deleteList = $(this).closest('td').siblings('.pno').text();
						} else {
							deleteList = deleteList + "," + $(this).closest('td').siblings('.pno').text();
						}
					});
					//console.log(deleteList);
					
					$("#deleteList").val(deleteList);
					
					$("#deleteWishForm").submit();
				});
				
				
				//개별 예약하기
				$('#eachReserve').click(function(){
					var result = confirm('패키지로 결제하면 할인이 적용됩니다. 그래도 개별 결제 하시겠습니까?');
					
					if(result){
					var reserveList = "";
					var page = "";
					
					
					$("input[name=check]:checked").each(function(){
						if(reserveList == ""){
							reserveList = $(this).closest('td').siblings('.pno').text();
						}else{
							reserveList = reserveList + "," + $(this).closest('td').siblings('.pno').text();
						}
					});
					
					if(reserveList != "") {
						location.href="<%=request.getContextPath()%>/wishList.re?reserveList="+reserveList; 
						}else {
							alert("선택하신 상품이 없습니다.");
						}
					}
					
				});
				
		
				
				//패키지 구성에 담기
				 $("#package").click(function(){
					 var packList = [];
					 var ctn=0;
					 var mno = <%=loginUser.getMno()%>;
					 
					$("input[name=check]:checked").each(function(){
					var pno = $(this).closest("td").siblings('.wishCode').text();
					
						if($(this).prop("checked") == true){
							/* packList[ctn] = pno;
							ctn++; */
							packList.push(pno);
						}
					});
					
					if(packList != ""){
						//$.ajaxSettings.traditional = true;
						$.ajax({
		          			url : "/redding/insertPack.wi",
		          			traditional:true,
		          			data : {packList:packList},
		          			type : "post",
		          			success : function(data){
		          				//console.log(data);
		          				if(data>0){
								alert("패키지 담기에 성공했습니다!");
								
								$.ajax({
		      						url : "/redding/showPack.wi",
				          			data : {mno:mno},
				          			type : "post",
				          			success : function(data){
				          				$firstStudio = $(".firstStudio"); 
				          				$firstDress = $(".firstDress");
				          				$firstMakeup = $(".firstMakeup");
				          				$secondStudio = $(".secondStudio");
				          				$secondDress = $(".secondDress");
				          				$secondMakeup = $(".secondMakeup");
				          				$finalPrice = $(".finalPrice");
				          				$packageArea2 = $(".packageArea2");
				          				
				          				var sctn = 0;
				          				var dctn = 0;
				          				var mctn = 0;
				          				var totalPrice = 0;
				          				var src = "";
				          				var fPrice = "";
				          				
				          				$firstStudio.empty();
				          				$firstDress.empty();
				          				$firstMakeup.empty();
				          				$secondStudio.empty();
				          				$secondDress.empty();
				          				$secondMakeup.empty();
				          				$finalPrice.empty();
				          				$packageArea2.empty();
				          				
				          				for(var i in data){
					          				var cname = data[i].cname;
					          				var pname = data[i].pname;
					          				var price = data[i].price;
					          				var ctype = data[i].comType;
					          				var pno = data[i].pno;
					          				var changename = data[i].changename;
					          				
					          				src = '<img src="' + "<%=request.getContextPath() %>/company_upload/" + changename + '" style="width:200px; height:200px;">';
					          				
					          				
					          				if(ctype == "스튜디오" && sctn==0){
					          					$firstStudio.append("<p class=" + pno + ">" + src + "<br>" + cname + "<br>" + pname + "<br>" + price + "<br>" + "</p>"+"<br>")
					          					sctn++;
					          				}else if(ctype == "드레스" && dctn==0 ){
				    	      					$firstDress.append("<p class=" + pno + ">" + src + "<br>" + cname + "<br>" + pname + "<br>" + price + "<br>" + "</p>"+"<br>")
				        	  					dctn++;
				        	  				}else if(ctype == "메이크업" && mctn==0){
				          						$firstMakeup.append("<p class=" + pno + ">" + src + "<br>" + cname + "<br>" + pname + "<br>" + price + "<br>" +"</p>"+"<br>")
				          						mctn++;
				          					}else{
				          						$packageArea2.append("<p class=" + pno + ">" + src + "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" +cname + 
	          											"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" + pname  + 
	          											"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" + price  +  "</p>"+"<br>");
	          								}
					          				
					          				
						          			totalPrice += price; 
						          			
				          				}
				          					fPrice = '<label id="price">' + totalPrice + '</label>';
				          					
				          					$(".finalPrice").append(fPrice); 
					          				//$("#price").html(totalPrice);
					          				
					          			}
					          			
		      					});
								
		          				}else{
		          				alert("이미 패키지 담겨 있습니다!");	
		          				}        
		          			}, 
		          			error : function(){
		          				console.log("패키지 넣기 실패!!");
		          			}
		          		});
					}else{
						alert("선택한 상품이 없습니다!");
					}
				}); 
				
				
				
				//패키지 구성 불러오기
				$(document).ready(function(){
					var mno = <%=loginUser.getMno()%>;
					
					$.ajax({
		          			url : "/redding/showPack.wi",
		          			data : {mno:mno},
		          			type : "post",
		          			success : function(data){
		          				//console.log(data);
		          				
		          				$firstStudio = $(".firstStudio"); 
		          				$firstDress = $(".firstDress");
		          				$firstMakeup = $(".firstMakeup");
		          				$packageArea2 = $(".packageArea2");
		          			
		          				var sctn = 0;
		          				var dctn = 0;
		          				var mctn = 0;
		          				var totalPrice = 0;
		          				var src = "";
		          				var fPrice = "";
		          				
		          				for(var i in data){
		          				var cname = data[i].cname;
			          			var pname = data[i].pname;
			          			var price = data[i].price;
			          			var ctype = data[i].comType;
			         			var pno = data[i].pno;
		          				var changename = data[i].changename;
		          				src = '<img id="imgT" src="' + "<%=request.getContextPath() %>/company_upload/" + changename + '" style="width:200px; height:150px;">';
		        				
		          				
		        				
		          				if(ctype == "스튜디오" && sctn==0){
		          					$firstStudio.append("<p class=" + pno + ">" + src + "<br>" + cname + "<br>" + pname + "<br>" + price + "<br>" +"</p>"+"<br><br>");
		          					sctn++;
		          				}else if(ctype == "드레스" && dctn==0 ){
	    	      					$firstDress.append("<p class=" + pno + ">" + src + "<br>" + cname + "<br>" + pname + "<br>" + price + "<br>" +"</p>"+"<br><br>");
	        	  					dctn++;
	        	  				}else if(ctype == "메이크업" && mctn==0){
	          						$firstMakeup.append("<p class=" + pno + ">" + src + "<br>" + cname + "<br>" + pname + "<br>" + price + "<br>" +"</p>"+"<br><br>");
	          						mctn++;
	          					}else{
	          						$packageArea2.append("<p class=" + pno + ">" + src + "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" +cname + 
	          											"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" + pname  + 
	          											"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" + price  +  "</p>"+"<br>");
	          					}
		          				
			          				totalPrice += price;
		          				}
		          				
		          				fPrice = '<label id="price">' + totalPrice + "</label>";
		          				$(".finalPrice").append(fPrice);
		          				
		          			}, 
		          			error : function(){
		          				console.log("패키지 불러오기 실패!!");
		          			}
		          		});
				});
					
				

				//패키지 삭제 메소드
				$(document).on('click','p',function(){
					var pno = $(this).prop("class");			
					var mno = <%=loginUser.getMno()%>;
					
					var result = confirm('패키지에서 삭제 하시겠습니까?'); 
					
					if(result){
						$.ajax({
							url : "/redding/deletePack.wi",
			      			traditional:true,
			      			data : {pno:pno, mno:mno},
			      			type : "post",
			      			success : function(data){
			      			//console.log(data);
			      				
			      				if(data>0){	
			      					alert("패키지 삭제에 성공했습니다!");
			      					
			      					$.ajax({
			      						url : "/redding/showPack.wi",
					          			data : {mno:mno},
					          			type : "post",
					          			success : function(data){
					          				$firstStudio = $(".firstStudio"); 
					          				$firstDress = $(".firstDress");
					          				$firstMakeup = $(".firstMakeup");
					          				$secondStudio = $(".secondStudio");
					          				$secondDress = $(".secondDress");
					          				$secondMakeup = $(".secondMakeup");
					          				$finalPrice = $(".finalPrice");
					          				$packageArea2 = $(".packageArea2");
					          				
					          				var sctn = 0;
					          				var dctn = 0;
					          				var mctn = 0;
					          				var totalPrice = 0;
					          				var src = "";
					          				var fPrice = "";
					          				
					          				$firstStudio.empty();
					          				$firstDress.empty();
					          				$firstMakeup.empty();
					          				$secondStudio.empty();
					          				$secondDress.empty();
					          				$secondMakeup.empty();
					          				$finalPrice.empty();
					          				$packageArea2.empty();
					          				
					          				for(var i in data){
						          				var cname = data[i].cname;
						          				var pname = data[i].pname;
						          				var price = data[i].price;
						          				var ctype = data[i].comType;
						          				var pno = data[i].pno;
						          				var changename = data[i].changename;
						          				
						          				src = '<img src="' + "<%=request.getContextPath() %>/company_upload/" + changename + '" style="width:200px; height:200px;">';
						          				
						          				
						          				if(ctype == "스튜디오" && sctn==0){
						          					$firstStudio.append("<p class=" + pno + ">" + src + "<br>" + cname + "<br>" + pname + "<br>" + price + "<br>" + "</p>"+"<br>")
						          					sctn++;
						          				}else if(ctype == "드레스" && dctn==0 ){
					    	      					$firstDress.append("<p class=" + pno + ">" + src + "<br>" + cname + "<br>" + pname + "<br>" + price + "<br>" + "</p>"+"<br>")
					        	  					dctn++;
					        	  				}else if(ctype == "메이크업" && mctn==0){
					          						$firstMakeup.append("<p class=" + pno + ">" + src + "<br>" + cname + "<br>" + pname + "<br>" + price + "<br>" +"</p>"+"<br>")
					          						mctn++;
					          					}else{
					          						$packageArea2.append("<p class=" + pno + ">" + src + "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" +cname + 
		          											"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" + pname  + 
		          											"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" + price  +  "</p>"+"<br>");
		          								}
						          				
							          			totalPrice += price; 
					          				}
					          				
					          				/* console.log("삭제:" + totalPrice); */
					          				fPrice = '<label id="price">' + totalPrice + '</label>';
				          					
				          					$(".finalPrice").append(fPrice); 
						          				
						          				
						          			},error : function(){
						          				console.log("패키지 불러오기 실패!!");
						          			}
			      					});
					          	}
			      			
			      			},error : function(){
		          				console.log("패키지 불러오기 실패!!");
		          			}
						});
						
						
					}else{
						alert("패키지 삭제에 실패했습니다!");
					}
				});
				
				
				//전체 체크 선택
				$("#allCheck").click(function(){
					 $('.checkbox').prop('checked', this.checked);
				});

				
				
				//패키지 결제
				$('#packReserve').click(function(){
					var mno = <%=loginUser.getMno()%>;
					var packList = "";
					
					
					$.ajax({
						url : "/redding/serachPack.wi",
	          			data : {mno:mno},
	          			type : "post",
	          			success : function(data){
	          				
	          				for(var i in data){
	          					if(packList == ""){
	    							packList = data[i];
	    						}else{
	    							packList = packList + "," + data[i];
	    						}
	          				}
	          				
	          				if(packList != "") {
	    						location.href="<%=request.getContextPath()%>/wishList.re?reserveList="+packList; 
	    						}else {
	    							alert("패키지 상품이 없습니다.");
	    						}
	          				
	          			},error : function(){
	          				console.log("패키지 예약 시 패키지 목록 조회 실패!");
	          			}
					});
					
				});
				
					  
				
				
			</script>
			
		</div>

	</div>
	<br>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>


</body>
</html>
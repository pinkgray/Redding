<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
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
	rel="stylesheet"><!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a_event.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/modal.min.css">
<script src="<%=request.getContextPath()%>/js/modal.min.js"></script>
<script src="<%=request.getContextPath()%>/js/semantic.min.js"></script>
<title>REDDING♥</title>
<style>
	.ui.dimmer .ui.modal{
      margin-left:auto;
      margin-right:auto;
      margin-top:auto;
      margin-bottom:auto;
   }
</style>
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
					<!-- <div class="esidenavArea">
						<br><br><br><br>
						
					</div> -->
				</div>
			</div>

			<!-- 여기는 스마트폰 -->
			<div class="visible-xs sideListnav2">
				<!-- <div class="col-sm-2 sidenav1"></div>
					<br><br><br><br>
					<button class="ui button createBtn">쿠폰 생성</button>
				<br> <br> -->
			</div>

			<div class="col-sm-10 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				
				<div class="couponArea">
					<br><br><br>
					<label class="subTitle">쿠폰 리스트</label> <button class="ui button createBtn" style="float:right">쿠폰 생성</button>
					<br><br>
					<div class="couponList" align="center">
						<table class="couponListTable">
							<thead>
								<tr>
									<td>쿠폰이미지</td>
									<td>카테고리</td>
									<td>쿠폰명</td>
									<td>할인형태</td>
									<td>할인율(액)</td>
									<td>시작날짜</td>
									<td>종료날짜</td>
									<td>쿠폰발급가능상태</td>
								</tr>
							</thead>
							<tbody>
							<%
								for (int i = 0; i < list.size(); i++) {
									HashMap<String, Object> hmap = list.get(i);
							%>

							<tr>
								<td><img src="/redding/coupon_upload/<%=hmap.get("changeName")%>" height="80px"></td>
								<td><%=hmap.get("couponCategory")%></td>
								<td><%=hmap.get("couponName")%></td>
								<td><%=hmap.get("discountType")%></td>
								<% if((hmap.get("discountType")).equals("퍼센트 할인")) { %>
									<td><%=hmap.get("discountRate")%>%</td>
								<% }else { %>
									<td><%=hmap.get("discountAmount")%>원</td>
								<% } %>
								<td><%=hmap.get("couponStartDate")%></td>
								<td><%=hmap.get("couponEndDate")%></td>
								<td>
									<% if((hmap.get("couponStatus")).equals("N")) { %>
										<button class="nonIssuableCoupon">발급불가능</button>
									<% }else if((hmap.get("couponStatus")).equals("Y")) { %>
										<button class="issuableCoupon">발급가능</button>
									<% } %>
								
								</td>
							</tr>

							<%
								}
							%>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>
	<br><br><br><br>
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>

	<!-- 쿠폰 등록 모달 -->

	<div class="ui modal">

		<div class="header" style="background:salmon; color:white">
			<label class="modalHeader">쿠폰 생성</label>
			<i class="close icon"></i>
		</div>
		<div class="modalContents">
			<form action="<%=request.getContextPath()%>/insertCoupon.ad" encType="multipart/form-data" method="post">
				<table class="modalTable">
					<tr>
						<td class="modalTableTd">쿠폰 이미지 선택</td>
						<td colspan="3">
							<div class="couponImgArea">
								<img id="couponImg" height="170px">
							</div>
						</td>
					</tr>
					<tr>
						<td class="modalTableTd">쿠폰 카테고리</td>
						<td>
							<select name="couponCategory">
								<option>-- 카테고리 선택 --</option>
								<option>스튜디오</option>
								<option>드레스</option>
								<option>메이크업</option>
							</select>
						</td>
						<td class="modalTableTd">쿠폰명</td>
						<td><input type="text" name="couponName"></td>
					</tr>
					<tr>
						<td class="modalTableTd">할인 종류</td>
						<td>
							<select class="discountType" name="discountType">
								<option>-- 할인종류 선택 --</option>
								<option>퍼센트 할인</option>
								<option>금액 할인</option>
							</select>
						</td>
						<td class="modalTableTd" id="discount"></td>
						<td><input type="text" id="discountInput"></td>
					</tr>
					<tr>
						<td class="modalTableTd">시작 날짜</td>
						<td><input type="date" name="couponStartDate"></td>
						<td class="modalTableTd">종료 날짜</td>
						<td><input type="date" name="couponEndDate"></td>
					</tr>
					<tr>
						<td class="modalTableTd">쿠폰 내용</td>
						<td colspan="3"><textarea name="couponDescrition" style="resize:none;"></textarea></td>
					</tr>
				</table>
				<div id="fileArea">
					<input type="file" id="couponImgFile" name="couponImgFile" onchange="loadCouponImg(this)">
				</div>
				<br><br>
				<button class="modalBtn" id="createCouponBtn">생성하기</button>
			</form>
		</div>
		
	</div>



	<script>
	
		$(function() {
			$(".createBtn").click(function() {
				console.log("e");
				$('.ui.modal').modal('show');
			});
			$(".close").click(function() {
				$('.ui.modal').modal('hide');
			});
			$("#createCouponBtn").click(function() {
				$(this).submit();
			});
			
			$("#fileArea").hide();
			$(".couponImgArea").click(function() {
				$("#couponImgFile").click();
			});
			
			
			$(".discountType").change(function() {
				var state = $(".discountType option:selected").val();
				if(state == '퍼센트 할인') {
					$("#discount").text('할인율');
					$("#discountInput").attr('name', 'discountRate');
					console.log($("#discountInput").attr('name'));
				}else if(state == '금액 할인') {
					$("#discount").text('할인액');
					$("#discountInput").attr('name', 'discountAmount');
					console.log($("#discountInput").attr('name'));
				}
			});
			
		});
		
		function loadCouponImg(value) {
			if(value.files) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#couponImg").attr("src", e.target.result); 
				}
				reader.readAsDataURL(value.files[0]);
			}
		} 
		
	</script>
</body>
</html>
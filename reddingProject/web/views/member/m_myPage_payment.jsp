<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.Member, com.kh.redding.board.model.vo.*, java.util.Date"%>

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
	rel="stylesheet"><!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_myPage.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_myPage_payment.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/semantic/semantic.min.css"> 

<link href="${pageContext.request.contextPath}/css/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/css/dist/js/datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/css/dist/js/i18n/datepicker.en.js"></script>


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/semantic/modal.min.css">
<script src="<%=request.getContextPath()%>/js/modal.min.js"></script>
<script src="<%=request.getContextPath()%>/js/semantic.min.js"></script>


<style>

.container {
	width:100%;
	color:salmon;
	font-family:'Noto Sans KR', sans-serif;
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
.div1Table2Btn1 {
	width:100%;
	height:100%;
	text-align:center;
	font-family:'Noto Sans KR', sans-serif;
	font-size:17px;
	background:white;
	color:salmon;
	border-bottom:1px solid white;
	border-top:1px solid salmon;
	border-left:1px solid salmon;
	border-right:1px solid salmon;
}
	.pick{
		border:1px solid darkgray; 
		height:25px;
	}
	
	.ui.dimmer .ui.modal{
      margin-left:auto;
      margin-right:auto;
      margin-top:auto;
      margin-bottom:auto;
   }
   
  .modalfooter {

    position:absolute;

    bottom:0;
    }
    
    .modalTable th,td{
    	text-align:center !important;
    }
    .modalTable tr{
    	height:60px;
    }
    .modalTable tr:nth-child(1){
    	color:white;
    }
    .payBtnArea{
    	text-align:center;
    	margin-left:auto; 
    	margin-right:auto;
    }
    .ui.button{
    	border:1px solid salmon;
    	background:white;
    	color:salmon;
    }
    .ui.button:hover{
    	background:salmon;
    	color:white;
    }
    .ui.button:active{
    	background:salmon !important;
    	color:white;
    }
    
</style>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<%@include file="/views/member/m_header.jsp"%>
	</div><br>
	
	<div class="div1">
		<table class="div1Table">
			<tr>
				<td style="background:salmon"><img src="<%=request.getContextPath()%>/images/mplogo.png" height="70px"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<table class="div1Table2">
			<tr>
				<td><button class="div1Table2Btn">HOME</button></td>
				<%-- <td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_checkList.jsp'">CHECK LIST</button></td> --%>
				<td><button class="div1Table2Btn1" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_payment.jsp'">결제 내역</button></td>
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_coupon.jsp'">쿠폰함</button></td>
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_myWriting.jsp'">내 글 관리</button></td>
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_personalInformation.jsp'">개인정보 수정</button></td>
			</tr>
		</table>
	</div>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">
			
			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav" id="leftNav">
			
			</div>

			<div class="col-sm-10 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<input type="hidden" value="<%= loginUser.getMno() %>" id="mno" >
				
				<input type="hidden" value="<%= loginUser.getMemberName() %>" id="memberName">
				
				<div class="contents">
				
					<div class="subTitle">
						<%=loginUser.getNickName()%>님의 결제 내역
					</div>
					<br><br>
					

					<div class="paymentCompleted" style="background:white">
						<div class="paymentLabel1">예약대기</div><br><br><br>
						<label id ="resWait" class="paymentLabel2">0</label>
						<label class="paymentLabel3">개</label>
					</div>
					&nbsp;&nbsp;&nbsp;
					<div class="bookingCompleted">

						<div class="paymentLabel1">결제대기</div><br><br><br>
						<label id ="payWait" class="paymentLabel2">0</label>
						<label class="
                          3">개</label>
					</div>
					&nbsp;&nbsp;&nbsp;
					<div class="ongoing">

						<div class="paymentLabel1">결제완료</div><br><br><br>
						<label id ="payFinal" class="paymentLabel2">0</label>
						<label class="paymentLabel3">개</label>
					</div>
					<br><br><br><br> 
					<form action="">
					<fieldset style="border:1px solid lightgray !important; height:74px; margin-top:auto; margin-bottom:auto; padding:24px">
						<div>
						<div class="selectArea" style=" width:15%; display:inline-block; padding: 0 12px 0 0;margin: 0 5px 0 2px;">
							<select class="searchSelect pick" style="width:100%">
										<option value="40">예약대기</option>
										<option value="50">결제대기</option>
										<option value="60">결제완료</option>
										<option value="70">결제취소</option>										
								</select>
						</div>

								<span style="margin:0">
									<button type="button" class="cancellation dateSelect" value="1">오늘</button>
									<button type="button" class="cancellation dateSelect" value="7">1주일</button>
									<button type="button" class="cancellation dateSelect" value="30">1개월</button>
									<button type="button" class="cancellation dateSelect" value="90">3개월</button>
									<button type="button" class="cancellation dateSelect" value="180">6개월</button>
								</span>
								&nbsp;&nbsp;&nbsp;&nbsp;
								
								<input type='text' class='datepicker-here firstDate pick' data-language='en' data-date-format ='yyyy-mm-dd' style="width:13%"/>
								<!-- <input type = "text"  id ="datepicker" style="width:7%"> -->

								&nbsp;&nbsp;&nbsp;&nbsp;~
								&nbsp;&nbsp;&nbsp;&nbsp;

								<input type='text' class='datepicker-here lastDate pick' data-language='en' data-date-format ='yyyy-mm-dd' style="width:13%"/>							
								
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="searchBtn cancellation">조회</button>
								
						</div>
					</fieldset>
					</form>					
					<br>					
				
					<table class="paymentList">
						<thead>
							<tr>
								<td>No</td>
								<td>업체명</td>
								<td>상품명</td>
								<td class="statusPayTd">결제일</td>
								<td>결제금액</td>
								<td>상태</td>
								<td></td>
							</tr>
						</thead>
						<tbody class="infoTable">
							
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7" class="pageBtnArea"><br>
									<button class="paging"><<</button>
									<button class="paging"><</button>
									<button class="paging">1</button>
									<button class="paging">></button>
									<button class="paging">>></button>							
								</td>
							</tr>
						</tfoot>
					</table>
					<br><br>
					
				</div>
					
				
			</div>
			
			<!-- 오른쪽 빈공간 -->
			<!-- <div class="col-sm-2 sidenav"></div> -->
			
		</div>

	</div>
	<br>
	<div class="ui modal" style=" height:auto;">

		<div class="header" style="background:salmon; color:white; height:80px">
			<label class="modalHeader">결제 확인</label>
		</div>
		<div class="modalContents">
			<br>
			<table class="modalTable" style="width:80%; margin-left:auto; margin-right:auto;">
				<thead>
				<tr style="background:salmon;">
					<th width="10%"></th>
					<th>업체명</th>
					<th>상품명</th>
					<th>예약상태</th>
					<th>예약날짜</th>
					<th>가격</th>
					<th>예약자</th>
				</tr>
				</thead>
				<tbody class="paymodalContent">
				<tr style="color:black">
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
				</tr>
				</tbody>				
			</table>
						
		</div>
		<div class="footer modalfooter" style="width:100%; background:white;">
			<div class="payBtnArea">
			<p class="eventContent" style="color:salmon; font-size:30px">패키지로 결제시 최대 5% 할인</p>
			<br>
			<button class="ui button Paymentmove">결제하기</button>
			<button class="ui button cancleBtn">취소하기</button>
			</div>
		</div>
			
	</div>
	
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	
<script src="${pageContext.request.contextPath}/js/member/memberReservation.js"></script>
<script>
</script>
</body>
</html>

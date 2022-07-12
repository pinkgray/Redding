<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	href="${pageContext.request.contextPath}/css/company/c_main.css">

<!-- 지도 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/raphael_min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/raphael_path_s.korea.js"></script>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/layout.css">
<!-- 차트js -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dist/css/Chart.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/a_stats.css">
<script src="${pageContext.request.contextPath}/css/dist/js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/css/dist/js/utils.js"></script>
<script>
var sca = '01';
</script>
<title>REDDING♥</title>
<style>
	#canvas {float:left; position:relative; width: 320px; height:400px; margin: 0}
	#south {width: 320px; height:400px; position: absolute; top: 0px; left: 0;}

	#canvas h2{ padding:0; margin:0; font-size:12px; }

	#seoul, #gygg, #incheon, #gangwon, #chungbuk, #chungnam, #daejeon, #sejong, #jeonbuk, #jeonnam, #gwangju, #gyeongbuk, #gyeongnam, #daegu, #busan, #ulsan, #jeju { display: none; position: absolute; height:16px; background-color:#000; color:#fff; padding:2px 5px; text-align:center;}

	#seoul{ left:80px; top:75px; background:white; width:0; height:0;}
	#gygg{ left:80px; top:45px; background:white; width:0; height:0;}
	#incheon{ left:60px; top:75px; background:white; width:0; height:0;}
	#gangwon{ left:150px; top:45px; background:white; width:0; height:0;}
	#chungbuk{ left:120px; top:145px; background:white; width:0; height:0;}
	#chungnam{ left:60px; top:165px; background:white; width:0; height:0;}
	#daejeon{ left:80px; top:165px; background:white; width:0; height:0;}
	#sejong{ left:70px; top:145px; background:white; width:0; height:0;}
	#jeonbuk{ left:60px; top:205px; background:white; width:0; height:0;}
	#jeonnam{ left:60px; top:260px; background:white; width:0; height:0;}
	#gwangju{ left:	60px; top:260px; background:white; width:0; height:0;}
	#gyeongbuk{ left:150px; top:165px; background:white; width:0; height:0;}
	#gyeongnam{ left:130px; top:240px; background:white; width:0; height:0;}
	#daegu{ left:170px; top:210px; background:white; width:0; height:0;}
	#busan{ left:190px; top:250px; background:white; width:0; height:0;}
	#ulsan{ left:200px; top:225px; background:white; width:0; height:0;}
	#jeju{ left:80px; top:340px; background:white; width:0; height:0;}
	
	h2{
		color:black;
		font-size:15px !important;
		font-weight:bold;
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
						<!-- <div class="sidenavArea">
							<ul class="navList">
								<li onclick="location.href='a_Sstats.jsp'">회원 통계</li>
								<li onclick="location.href='a_Mstats.jsp'" style="color:lightgray;">업체 통계</li>
								<li onclick="location.href='a_Pstats.jsp'">매출 통계</li>
							</ul>
						</div> -->
					</div>
				</div>
				
				
				<!-- 여기는 스마트폰 -->
				<div class="visible-xs sideListnav2">
					<div class="col-sm-2 sidenav1">
						<!-- <div class="sidenavArea2">
						<ul class="navList2">
							<li onclick="location.href='a_Sstats.jsp'">회원 통계</li>
							<li onclick="location.href='a_Mstats.jsp'" style="color:white">업체 통계</li>
							<li onclick="location.href='a_Pstats.jsp'">매출 통계</li>
						</ul>
					</div> -->
					</div>
					
				
				</div>
				
			
			
			<div class="col-sm-10 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="StatArea" style="width:100%; height:auto; float:left">
					<h2 style="text-align:center; font-size:30px !important">업체 지역별 조회</h2>
					<br><br>					
					<table style="width:100%; border-bottom:1px solid gray">
						<tr>
							<td>
								<div style="width:100%;height:400px; float:left">
						<div id="canvas" style="width:100%">
							<div id="south"></div>
							<div id="seoul">
								<h2>서울</h2>
							</div>
							<div id="gygg">
								<h2>경기</h2>
							</div>
							<div id="incheon">
								<h2>인천</h2>
							</div>
							<div id="gangwon">
								<h2>강원</h2>
							</div>
							<div id="chungbuk">
								<h2>충청북도</h2>
							</div>
							<div id="chungnam">
								<h2>충청남도</h2>
							</div>
							<div id="daejeon">
								<h2>대전</h2>
							</div>
							<div id="sejong">
								<h2>세종</h2>
							</div>
							<div id="gwangju">
								<h2>광주</h2>
							</div>
							<div id="jeonbuk">
								<h2>전라북도</h2>
							</div>
							<div id="jeonnam">
								<h2>전라남도</h2>
							</div>
							<div id="gyeongbuk">
								<h2>경상북도</h2>
							</div>
							<div id="gyeongnam">
								<h2>경상남도</h2>
							</div>
							<div id="daegu">
								<h2>대구</h2>
							</div>
							<div id="busan">
								<h2>부산</h2>
							</div>
							<div id="ulsan">
								<h2>울산</h2>
							</div>
							<div id="jeju">
								<h2>제주</h2>
							</div>
							
						</div>							
					</div>
							</td>
							<td>
								<div class="chart-container" style="position: relative; height:auto; width:60%; margin-left:400px; margin-top:0; margin-bottom:130px">
								<canvas id="chart-area"></canvas>
								</div>
							</td>					
						</tr>
					</table>
					<br><br>
					<h2 style="text-align:center; font-size:30px !important">업체 상세 조회</h2>
					
					<br>
					<div style="text-align:center">
					<select class="searchOption" style="height:25px">
						<option value="10">전체</option>
						<option value="20">스튜디오</option>
						<option value="30">드레스</option>
						<option value="40">메이크업</option>
					</select> &nbsp;&nbsp;
					<input type ="date"> ~ <input type="date">&nbsp;&nbsp;&nbsp;&nbsp;<button class="searchBtn">조회</button>
					</div>
					<div class="chart-container" style="position: relative; height:400px; width:100%;">
					<canvas id="canvas"></canvas>				
					</div>
					<br><br>
					<br><br>					
				</div>
				
				
		</div>
				
		</div>
		</div>
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	


</body>
</html>
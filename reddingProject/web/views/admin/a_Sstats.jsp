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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/a_stats.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/layout.css">
<!-- 차트js -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dist/css/Chart.min.css">
<script src="${pageContext.request.contextPath}/css/dist/js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/css/dist/js/utils.js"></script>
<title>REDDING♥</title>
<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
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
								<li onclick="location.href='a_Sstats.jsp'" style="color:lightgray;">회원 통계</li>
								<li onclick="location.href='a_Mstats.jsp'">업체 통계</li>
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
							<li onclick="location.href='a_Sstats.jsp'" style="color:white">회원 통계</li>
							<li onclick="location.href='a_Mstats.jsp'">업체 통계</li>
							<li onclick="location.href='a_Pstats.jsp'">매출 통계</li>
						</ul>
					</div> -->
					</div>
					
				</div>
				
			
			
			<div class="col-sm-10 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="StatArea" style="width:100%; height:auto;">				
				<h2 style="text-align:center; font-weight:bold">회원 통계</h2>
				<br><br>
				<table style="border-bottom:1px solid gray">
					<tr>
						<td width="100%">
						<div class="chart-container" style="position: relative; width:100%; 
						margin-top:0;">
							<canvas id="canvas" style=></canvas>
						</div>
						</td>
						<td width="100%">
						<div class="chart-container" style="position: relative; width:100%; 
						margin-top:0; margin-top:auto; margin-bottom:auto">
							<canvas id="chart-area"></canvas>
						</div>								
						</td>										
					</tr>
					<tr>
						<td colspan="2">
							<br><br>
						</td>
					</tr>
													
				</table>
				<br><br>
				<br><br><br>
				<h2 style="text-align:center; font-weight:bold">회원 상세 조회</h2>				
				<div style="text-align:center">
				<select class ="searchSelect" style="height:26px">
				<option value="30">남성회원조회</option>
				<option value="40">여성회원조회</option>
				<option value="50">전체회원조회</option>
				</select>&nbsp;&nbsp;				
				<input type="date" class="firstDate"> ~ <input type="date" class="lastDate"> <button class="searchDate" >조회</button>
				</div>
				
				<br>
				<div class="chart-container" style="position: relative; height:auto; width:100%; border-bottom:1px solid gray">
					<canvas id="canvas" class="hels"></canvas>	
					<br>			
				</div>
				<br><br><br>
				</div>
				
				
		</div>
				
		</div>
		</div>
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
		
	
	<script>
	var checkFlag = true;
	//실행 로직
	window.onload = function(){
		
		
		//성별 통계 리턴
		getGenderCount();
		
		getLineChart(MonthSetChart());
		
		
		$("#canvas").css({"height":"300px"});
		$(".hels").css({"height":"300px"});
		
		var getDate = new Date();
		
		if((getDate.getMonth()+1) < 9){
			var month = '0' + (getDate.getMonth()+1);
		}else{
			var month = (getDate.getMonth()+1);
		}
		
		if((getDate.getDate()) < 9){
			var date = '0' + (getDate.getDate());
		}else{
			var date = (getDate.getDate());
		}
		
		
		$(".firstDate").val(getDate.getFullYear() + "-" + month + "-" + date);
		$(".lastDate").val(getDate.getFullYear() + "-" + month + "-" + date);
				
	}
	
	$(".searchDate").click(function(){
		var arr= $(this).siblings('input');
		var startDate = arr[0].value.split(" ")[0].split("-");
		var endDate = arr[1].value.split(" ")[0].split("-");
		var value = $(".searchSelect").val();
				
		getDetailCount(startDate.join(""),endDate.join(""),value);
		
	});
	
	
	//파이차트 셋팅
	function setConfig(data){
		var config = {
				type: 'pie',
				data: {
					datasets: [{
						data: [
							data[1].gNum,
							data[0].gNum,
						],
						backgroundColor: [
							window.chartColors.red,
							window.chartColors.blue

						],
					}],
					labels: [
						'여성회원',
						'남성회원'
					]
				},
				 options: {
					responsive: true

				},
				
			};
		 return config;
		}
	
	
	//파이 차트 출력
	function viewPie(config){
		var ctx = document.getElementById('chart-area').getContext('2d');
		window.myPie = new Chart(ctx, config);
	}
	
	
	//젠더 카운터 리턴 및 성비 출력
	 function getGenderCount(){
	
	
	 	$.ajax({
			url:'<%=request.getContextPath()%>/getGenderCount.ad',
			type:'get',
			data:{value:10},
			success: function(data){			
				viewPie(setConfig(data));				
				getDateCount();
			},
			error: function(data){
				console.log("에러");
			}
			
		});
			
	} 
	
	
	//일별 가입수 리턴 바 차트 출력
	function getDateCount(){
		
		$.ajax({
			url:'<%=request.getContextPath()%>/getGenderCount.ad',
			type:'get',
			data:{value:20},			
			success: function(data){
				console.log(data);
				var views = getChart(data);
				viewBar(views);
			},
			error: function(data){
				console.log("에러");
			}
			
		});
	}
	
	//디테일 가입수 리턴 라인 차트 출력
	function getDetailCount(startDate,endDate,value){
		
		$.ajax({
			url:'<%=request.getContextPath()%>/getGenderCount.ad',
			data:{startDate:startDate, endDate:endDate, value:value},
			type:"get",
			success:function(data){
				console.log(data);
				myLine.data.datasets[0].data = new Array();
				myLine.data.labels = new Array();
				 for(var i = 0; i<data.length; i++){
					myLine.data.labels[i] = data[i].gNum.split(" ")[0];
					myLine.data.datasets[0].data[i] = data[i].tNum;
				} 

				myLine.update();
			},
			error:function(data){
				
			}
			
		})
		
	}
	
	
	//바 차트 셋팅
	function getChart(data){
		
		var getDate = new Date();
		
		if((getDate.getMonth()+1) < 9){
			var month = '0' + (getDate.getMonth()+1);
		}else{
			var month = (getDate.getMonth()+1);
		}
		
		if((getDate.getDate()) < 9){
			var date = '0' + (getDate.getDate());
		}else{
			var date = (getDate.getDate());
		}
		
		
		var dateArr = new Array();
		
		
		var femaleArr = new Array();
		var maleArr = new Array();				
		
		for(var i = 0; i< 7; i++){
			dateArr[i] = month + "월" + (date-i) + "일";	
			}
		
		//남녀 구분해서 배열에 담아줌
		   for(var i=0; i<data.length; i++){
			if(data[i].gender == 'M'){
				maleArr.push(data[i]);
			}else{
				femaleArr.push(data[i]);
			}
			
		}
			

		var maleCount = setDateCount(maleArr);
		var femaleCount = setDateCount(femaleArr);
				
		var color = Chart.helpers.color;
		var barChartData = {	
			labels: [dateArr[0],dateArr[1],dateArr[2],dateArr[3],dateArr[4],dateArr[5],dateArr[6]],
			datasets: [{
				label: '여성회원',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					femaleCount[0],
					femaleCount[1],
					femaleCount[2],
					femaleCount[3],
					femaleCount[4],
					femaleCount[5],
					femaleCount[6],
					femaleCount[7],
				
				]   
			}, {
				label: '남성회원',
				backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
				borderColor: window.chartColors.blue,
				borderWidth: 1,
				data: [
					maleCount[0],
					maleCount[1],
					maleCount[2],
					maleCount[3],
					maleCount[4],
					maleCount[5],
					maleCount[6],
					maleCount[7]
					
				]
			}]

		};
		return barChartData;
	}
	
	
	
	//바 차트 출력
	function viewBar(barChartData){
	var ctx = document.getElementById('canvas').getContext('2d');
		window.myBar = new Chart(ctx, {
			type: 'bar',
			data: barChartData,
			options: {
				responsive: true,
				legend: {
					position: 'top',
				},
				title: {
					display: true,
					text: '일별 가입수'
				}
			}
		});
		
	}
	
	
	//주별 로직
	function setDateCount(maleArr){
		var getDate = new Date();
		
		if((getDate.getMonth()+1) < 9){
			var month = '0' + (getDate.getMonth()+1);
		}else{
			var month = (getDate.getMonth()+1);
		}
		
		if((getDate.getDate()) < 9){
			var date = '0' + (getDate.getDate());
		}else{
			var date = (getDate.getDate());
		}

					
			var num = maleArr.length;
			
			 if(maleArr.length != 7){			
				for(var i = 0; i < (7-num); i++){
					maleArr.push(0);
				}
				
			} 
			
				var maleCount = new Array();
				var femaleCount = new Array();
				
				 for(var i =0; i<7; i++){
					maleCount.push(0);
				} 
				
							
				for(var i=0; i<7; i++){
					if(maleArr[i] != 0){
						for(var j=0; j<7; j++){
							if(maleArr[i].gNum.split(" ")[0] == getDate.getFullYear() + "-" + month + "-" + (date-j)){
							maleCount[j] = maleArr[i].tNum;
						}
					}				
				   }				
				}  
				
				console.log(maleCount);
				return maleCount;
				
				
	}
	
	
	//라인차트 출력
	function getLineChart(config){
		var ctx = document.getElementsByTagName("canvas")[2].getContext('2d');
		window.myLine = new Chart(ctx, config);
	}

	//라인 차트 세팅
	function MonthSetChart(/* data */){

		
		var config = {
			
			type: 'line',
			data: {
				labels: [],
				datasets: [{
					label: '조회수',
					backgroundColor: window.chartColors.red,
					borderColor: window.chartColors.red,
					data: [
					],
					fill: false,
				}]
			},
			options: {
				responsive: true,
				title: {
					display: true,
					text: '상세 조회'
				},
				tooltips: {
					mode: 'index',
					intersect: false,
				},
				hover: {
					mode: 'nearest',
					intersect: true
				},
				scales: {
					xAxes: [{
						display: true,
						scaleLabel: {
							display: true
						}
					}],
					yAxes: [{
						display: true,
						scaleLabel: {
							display: true
						}
					}]
				}
			}
		};
		return config;
}	
	
	



	
	
	
	</script>

</body>
</html>
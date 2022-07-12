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
								<li onclick="location.href='a_Mstats.jsp'">업체 통계</li>
								<li onclick="location.href='a_Pstats.jsp'"  style="color:lightgray;">매출 통계</li>
							</ul>
						</div> -->
					</div>
				</div>
				
				
				<!-- 여기는 스마트폰 -->
				<div class="visible-xs sideListnav2">
					<div class="col-sm-2 sidenav1">
						<!-- <div class="sidenavArea2">
						<ul class="navList2">
							<li onclick="location.href='a_Sstats.jsp'" >회원 통계</li>
							<li onclick="location.href='a_Mstats.jsp'">업체 통계</li>
							<li onclick="location.href='a_Pstats.jsp'" style="color:white">매출 통계</li>
						</ul>
					</div> -->
					</div>
					
					
				</div>
				
			
			
			<div class="col-sm-10 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<h2 style="text-align:center; font-weight:bold">매출 상세 조회</h2>
				<div style="width:100%; text-align:center">
				<br><br>
				<div>
					<input type="radio" name="comTypeRadio" class="serachRadio" checked value="전체">전체 
					<input type="radio" name="comTypeRadio" class="serachRadio" value="스튜디오">스튜디오
					<input type="radio" name="comTypeRadio" class="serachRadio" value="드레스">드레스 
					<input type="radio" name="comTypeRadio" class="serachRadio" value="메이크업">메이크업
				</div>
				<br>
					<select style="height:25px" class="searchSelect">
						<option>일별</option>
						<option>주별</option>
						<option>Top10</option>
					</select>&nbsp;&nbsp;
						<input type="date" class="firstDate"> <label class="labelContent">~</label> <input type="date" class="lastDate"> &nbsp;
						<select style="display:none; height:25px" class="topNcontent"></select>
						 <button class="searchBtn">조회</button>		 	
				</div>
				<div>
				<br><br>
					<div class="chart-container" style="position: relative; height:500px; width:90%;">
					<canvas id="canvas"></canvas>
					</div>								
				</div>
			</div>
				
		</div>
		</div>
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	
	<script>
		window.onload = function(){
			
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
			
			viewBar(getBarChart(new Array(), new Array()));
			
		};
		
	$(".searchBtn").click(function(){
		//console.log($(".serachRadio"));
		for(var i=0; i<$(".serachRadio").length; i++){
			if($(".serachRadio")[i].checked == true){
				var value = $(".serachRadio")[i].value;
			}
		}
		console.log();
		
		if($(".topNcontent").css("display") == 'none'){
			var arr= $(this).siblings('input');
			var startDate = arr[0].value.split(" ")[0].split("-");
			var endDate = arr[1].value.split(" ")[0].split("-");
		}else{
			startDate = $(".topNcontent").val();
			endDate = 0;
		}
		var radioValue = value;
		var selectValue = $(".searchSelect").val();
		
		
		//console.log(startDate);
		//console.log(endDate);
		if(endDate != 0){
		getCategoryStats(radioValue,selectValue,startDate.join(""),endDate.join(""));			
		}else{
			getCategoryStats(radioValue,selectValue,startDate,endDate);
		}
		
	});
		
	
		
	function getCategoryStats(radioValue,selectValue,startDate,endDate){
		$.ajax({
			url:"../../salsStats.ad",
			type:"post",
			data:{radioValue:radioValue,selectValue:selectValue,startDate:startDate,endDate:endDate},
			success:function(data){
				console.log(data);
				

					myBar.data.labels = new Array();
					var labelArr = new Array();
					myBar.data.datasets = new Array();
					
													
					for(var i=0; i<data.length; i++){
						//dataArr[i] = data[i].date;
						labelArr[i] = Number(data[i].price.trim().split(",").join(""));
						
						myBar.data.labels.push(data[i].date);   					
						}				
						
						myBar.data.datasets.push({
						  label: '매출액',
						  backgroundColor:color(window.chartColors.red).alpha(0.5).rgbString(),
						  borderColor: window.chartColors.red,
						  borderWidth: 1,
						  data: labelArr
						});
						
					myBar.update();
				
				
				//console.log(data[0].price.trim());
				
				
				
			},
			error:function(data){
				console.log("에라");
			}
			
		});
		
	}
	
	function getBarChart(dataArr, labelArr){
	color = Chart.helpers.color;
	var barChartData = {	
		labels: dataArr,
		datasets: [{
			label: '매출액',
			backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
			borderColor: window.chartColors.red,
			borderWidth: 1,
			data:labelArr,  
		}]
	
	};
	return barChartData;
  }

  
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
					text: '매출액'
				}
			}
		});
		
	}
	$(".searchSelect").change(function(){
		if($(this).val() == 'Top10'){
			$(".topNcontent").css("display","inline");
			$(".firstDate").css("display","none");
			$(".lastDate").css("display","none");
			$(".labelContent").css("display","none");
			
			$.ajax({
				url:"../../getCalculateDate.ad",
				type:"get",
				success:function(data){
					console.log(data);
					var $topNcontent = $(".topNcontent");
					$topNcontent.empty();
					
					for(var i=0; i<data.length; i++){
					$topNcontent.append($("<option>").text(data[i]));
					}
					
				},
				error:function(data){
					console.log(data);
				}
			});
		}else{
			$(".firstDate").css("display","inline");
			$(".labelContent").css("display","inline");
			$(".lastDate").css("display","inline");
			$(".topNcontent").css("display","none");
		}
	});
	
	</script>
	
</body>
</html>
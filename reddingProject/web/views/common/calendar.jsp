<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.Member"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
 %>    
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='../../packages/core/main.css' rel='stylesheet' />
<link href='../../packages/daygrid/main.css' rel='stylesheet' />
<script src='../../packages/core/main.js'></script>
<script src='../../packages/interaction/main.js'></script>
<script src='../../packages/daygrid/main.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/calendar.css">


</head>
<body>
	<br><br>
	<div id="calendarEvent" style="width:100%; margin-left:auto; margin-right:auto;">
	<table style="width:100%; margin-left:auto; margin-right:auto">
		<tr>
  			<td width="60%" height="470px">
  				<div id='calendar'></div>
  			</td>
  			
  			<td class="visible-md visible-lg visible-sm" width="0%" style="padding:5%">
				<h2 align="center">예약 승인</h2>
				<br>
				<table style="width:100%">
					<tr>
						<td>
						<label>상품명</label><input class="form-control productName" id="productName" type="text" style="width:100%; height:30px" readonly>
							<br>
						</td>
					</tr>
					<tr>
						<td>
							<label>예약날짜</label>
							<br>
							<input class="form-control productDate" id="productDate" type="datetime-local" style="width:100%; height:30px; float:left; margin-right :20px" readonly>
							<br><br><br>
						</td>
					</tr>	
					<tr>
						<td>
							<label>예약자</label>
							<br>
							<input class="form-control userinfo" id="userinfo" type="text" style="width:100%; height:30px; float:left; margin-right :20px" readonly>
							<br><br><br>
						</td>
					</tr>
				
						
					<tr>
						<td>
						<label>예약승인</label>
						<label id="revStatus" class="revStatus" style="display:none; width:100%; color:red;"><br><br>고객의 요청에 취소된 예약입니다.</label>
						<br>						
							<div class="ui toggle checkbox">
  							<input type="checkbox" name="public" id="changeStatus" class="changeStatus">
  							<label></label>
						</div>
						<br><br><br>
						</td>
					</tr>
					<tr>
						<td>
							<div style="text-align:center">
							<button class="ui button changeRservation">예약승인</button>
							</div>
						</td>
					</tr>
					</table>
					
					
					<tr>
						<td class="visible-xs" width="0%" style="padding:5%">
							<h2 align="center">예약 승인</h2>
				<br>
				<table style="width:100%">
					<tr>
						<td>
						<label>상품명</label><input class="form-control productName" id="productName" type="text" style="width:100%; height:30px" readonly>
							<br>
						</td>
					</tr>
					<tr>
						<td>
							<label>예약날짜</label>
							<br>
							<input class="form-control productDate" id="productDate" type="datetime-local" style="width:100%; height:30px; float:left; margin-right :20px" readonly>
							<br><br><br>
						</td>
					</tr>	
					<tr>
						<td>
							<label>예약자</label>
							<br>
							<input class="form-control userinfo" id="userinfo" type="text" style="width:100%; height:30px; float:left; margin-right :20px" readonly>
							<br><br><br>
						</td>
					</tr>
				
						
					<tr>
						<td>
						<label>예약승인</label>
						<label id="revStatus" class="revStatus" style="display:none; width:100%; color:red;"><br><br>고객의 요청에 취소된 예약입니다.</label>
						<label class="ress" style="display:none; width:100%; color:blue;"><br><br>결제가 완료된 상품입니다.</label>
						<br>
							<div class="ui toggle checkbox">
  							<input type="checkbox" name="public" id="changeStatusXs" class="changeStatus">
  							<label></label>
						</div>
						<br><br><br>
						</td>
					</tr>
					<tr>
						<td>
							<div style="text-align:center">
							<button class="ui button changeRservation">예약승인</button>
							</div>
						</td>
					</tr>
					</table>	
						</td>
						
					
					</tr>
					
					
					
				</table>
				
				
		<input id="colorCheck" class="colorCheck" type="hidden" value="">
		<input id="resNoCheck" class="resNoCheck" type="hidden" value="">
		<br>
		</div>
	<script>
	var resNo = new Array();
	
	  
	
	  
 	document.addEventListener('DOMContentLoaded', function() {	
 
 	var calendarEl = document.getElementById('calendar');

    calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      defaultDate: '2019-05-14',
      editable: false,
      eventLimit: true, // allow "more" link when too many events
   
       /* events: [
  
    	  {
          title: "hellow",
          start: '2019-05-14T10:00:00',
          end: '2019-05-14T12:00:00',
          color:"salmon"
        },
        {
            title: 'Mee',
            start: '2019-10-14T10:00:00',
            end: '2019-10-14T12:00:00',
            color:"lightgray"
          }     
          
      ],  */
      
      dateClick:function(event) {
    	  /*  changeDate = event.dateStr;
    	  
    	  var sysdate = new Date();
    	  var checkdate = new Date(changeDate);
    	  
    	  changeDateForm = changeDate + "T01:00";
    	  console.log(changeDateForm);
    	  if(sysdate > checkdate){
    		  window.alert("현재 일자보다 더 큰 일자를 선택하세요");
    	  }
    	  
    	  if($("#productName").val() == ""){
    		  window.alert("예약을 수정할 이벤트를 먼저 클릭하세요");
    	  }else{
    		  $("#reservationTime").val(changeDateForm);
    	  }  */
    	  
    	   
      },
    //캘린더 이벤트 클릭 시 동작할 함수 
    eventClick:function(info){
    	console.log(info.event);
    	var beforeDate = info.event.start;
    	
    	if(info.event.backgroundColor === "salmon"){
    		$(".checkbox").css("visibility","visible");
    		$(".revStatus").css("display","none");
    		$(".changeStatus").attr("disabled",true);
    		$(".changeStatus").attr("checked",true);
    	}else if(info.event.backgroundColor === "lightgray"){
    		$(".checkbox").css("visibility","visible");
    		$(".revStatus").css("display","none");
    		$(".changeStatus").attr("disabled",false);
    		$(".changeStatus").attr("checked",false);
    	}else if(info.event.backgroundColor === "red"){
    		$(".checkbox").css("visibility","hidden");
    		$(".revStatus").css("display","inline");
    		$(".changeStatus").attr("checked",false);
    	}else{
    		$(".checkbox").css("visibility","hidden");
    		$(".ress").css("display","inline");
    		$(".changeStatus").attr("checked",false);
    	}
    	
    	//날짜 계산
    	if(beforeDate.getMonth()<9){
    		dateForm = beforeDate.getFullYear()+ '-0' + (beforeDate.getMonth()+1) + '-';
    	}else{
    		dateForm = beforeDate.getFullYear()+ '-' + (beforeDate.getMonth()+1) + '-';
    	}
    	
    	if(beforeDate.getDate()<10){
    		dateForm += "0"+ beforeDate.getDate();
    	}else{
    		dateForm += beforeDate.getDate();
    	}
    	
    	if(beforeDate.getHours() < 9){
    		dateForm += "T0" + beforeDate.getHours() + ":00";
    	}else{
    		dateForm += "T" + beforeDate.getHours()  + ":00";    		
    	}
		
    	$(".productName").val(info.event.title);
    	$(".productDate").val(dateForm);
    	$(".userinfo").val(info.event.allow);
		$(".colorCheck").val(info.event.backgroundColor);
		$(".resNoCheck").val(info.event.id);
    }
   

    });
	
    calendar.render();
    
  });
 	/* 페이지가 로드되면서 서블릿에 예약정보를 ajax로 서블릿에 요청하여 JSON타입으로 ArrayList를 리턴받아 캘린더에 이벤트 추가 */
 	$(function(){	  
 		getEvent();
		   /* 예약 상태 변경을 서블릿에 요청*/
		   $(".changeRservation").click(function(){
			if($(".productName").val() == ""){
			   window.alert("예약을 먼저 선택하세요");
			} else if($(".colorCheck").val() == 'lightgray' && $(".changeStatus").prop('checked') == true){
					var num = $(".resNoCheck").val();
					
					$.ajax({
						url:"<%=request.getContextPath() %>/updateRes.re",
						data:{num:num},
						type:"post",
						success:function(data){
							window.alert(data + "개의 예약대기 상태가 예약상태로 변경되었습니다.");
					 		 for(var i=0; i<resNo.length; i++){
									calendar.getEventById(resNo[i]).remove(); 		
								}
					 		 getEvent();
					 		 $(".changeStatus").prop("checked",false);
						},
						error:function(data){
						}
						
					});

			   }else if($(".colorCheck").val() == 'lightgray' && $(".changeStatus").prop('checked') == false){
				   console.log($(".changeStatus").prop('checked'));
				   window.alert("예약 상태를 변경하세요");
			   }else{
				   window.alert("예약 승인 상태는 대기 상태만 변경할 수 있습니다.");
			   }
		   });
		   
		   $(".changeStatus").click(function(){
			  
			  console.log($(this).prop("checked"));
		   });
		   
		   $("#changeStatusXs").click(function(){
			   if( $("#changeStatusXs").prop("checked")== true){
				 $("#changeStatus").attr("checked",true);
			 }else{
				 $("#changeStatus").attr("checked",false);
			 }
			   
		  });
			   
		   
	  });
 	
 	  function getEvent(){
			
 
 		 $.ajax({
				url: "<%=request.getContextPath() %>/calendar.po",  /*서블릿 요청*/
				type:"post",
				data:{cno:<%= loginUser.getMno() %>},
				success:function(data){
					  	  for(var key in data){
					  		  var userName = data[key].userName;
					  		  var userPhone = data[key].userPhone;
					  		  var rapplyDate = data[key].rapplyDate;
					  		  var status = data[key].status;
					  		  var startDate = data[key].startDate;
					  		  var endDate = data[key].endDate;
					  		  var productName = data[key].productName;
					  		  var completedDate = data[key].completedDate;
							  resNo[key] = data[key].resNo;
							  if(status == 20){
								  //이벤트 객체 생성
								  var event = {
											title:productName,	
											start: rapplyDate + "T" + startDate,
											end: rapplyDate + "T" + endDate,
											color:"salmon",
											allow: userName + "(" + userPhone + ")",
											id: resNo[key]
										};
								  
							  }else if(status == 10){
								  var event = {
											title:productName,	
											start: rapplyDate + "T" + startDate,
											end: rapplyDate + "T" + endDate,
											color:"lightgray",
											allow: userName + "(" + userPhone + ")",
											id: resNo[key]
											
										};
							  }else if(status == 20){
								  var event = {
											title:productName,	
											start:rapplyDate + "T" + startDate,
											end: rapplyDate + "T" + endDate, 
											color:"red",
											allow: userName + "(" + userPhone + ")",
											id: resNo[key]
										};
							  }else{
								  var event = {
											title:productName,	
											start:rapplyDate + "T" + startDate,
											end: rapplyDate + "T" + endDate, 
											color:"blue",
											allow: userName + "(" + userPhone + ")",
											id: resNo[key]
										};
							  }
							  
							  //캘린더에 캘린더 이벤트 객체로 이벤트 객체를 변경하여 삽입
							  calendar.addEvent(event);

					  }					  	  
					  	  
				},				
				error:function(data){
					//console.log("error : " + data);
				} 
			 });
 		  
 	  }

</script>
</body>
</html>

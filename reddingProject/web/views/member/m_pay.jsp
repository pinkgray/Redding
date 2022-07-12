<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	HashMap<String, Object> hmap = null;
	int tprice = 0;
	int discount = 0;
	int totalPrice = 0;
	String fullName = null;
%>		

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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet"><!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_pay.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<!-- 모달 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/semantic/modal.min.css">
<script src="<%=request.getContextPath()%>/js/modal.min.js"></script>
<script src="<%=request.getContextPath()%>/js/semantic.min.js"></script>

</head>
<body>
	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<%@ include file="/views/member/m_header.jsp"%>
	</div>
	<br>

	<!-- 멤버 나브 -->
	<div>
		<jsp:include page="/views/member/m_nav.jsp"></jsp:include>
	</div>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">

			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<section>
               <div>
                  <br>
                  <h2 align="center" style="color:salmon">OREDR</h2>
               </div>

               <div class="payArea">
                  <br>
                  <table class="payTable" align="center" width="600px">
                     <tr style="background: MistyRose;">
                        <th width="300">No</th>
                        <th width="300">항목</th>
                        <th width="300">상품명</th>
                        <th width="300">판매가</th>
                        <th width="300">할인금액</th>
                        <th width="300">할인적용금액</th>
                        <th width="300">판매자</th>
                     </tr>
                     <% for(int i=0; i<list.size(); i++){
                    	 hmap = list.get(i);
                    	 tprice += Integer.parseInt(hmap.get("price").toString());                  	 
                    	 fullName = hmap.get("pName").toString() + " 외 " + (list.size()-1) + "건";
                     %>
                     <% if(list.size()== 1){ totalPrice = (tprice - tprice/100); discount = tprice/100;  %>                   	 
                     <% }else if(list.size() == 2){ totalPrice = (tprice - (tprice/100)*3);  discount = (tprice/100)*3;   %>
                     <% }else{ totalPrice = (tprice - (tprice/100)*5);  discount = (tprice/100)*5; } %>
                     
                     <tr height="80">
                        <td><%= i+1 %></td>
                        <td><img style=" max-width:100%" src="<%= request.getContextPath() %>/company_upload/<%=hmap.get("changeName").toString()%>"></td>
                        <td><%= hmap.get("pName") %>
                        	<br>
                        	(<%= hmap.get("useDate").toString().split(" ")[0] %>)<br> <%= hmap.get("useStart")  %> ~ <%= hmap.get("useEnd") %>
                        </td>
                        <td class="<%=hmap.get("upno")%>"><%= hmap.get("price")%>원</td>
                        <td class="<%=hmap.get("upno")%>">0</td>
                        <td class="<%=hmap.get("upno")%>"><%= hmap.get("price") %>원</td>
                        <td><%= hmap.get("cName") %>
                        	<br>
                        	<%= hmap.get("cPhone") %>  <input class="upno" type="hidden" value="<%=hmap.get("upno")%>"> 
                        </td>
                        
                   <%  }%>
                  </table>
                  <br>
                  
                  <div style="width:100%; border-bottom:1px solid black; height:50px; padding:3px;">
                  	<label class="priceLabel" style="float:right">총 결제 금액 : <%=totalPrice%>원&nbsp;&nbsp;  할인가 : <%=discount %>원 </label>
                  </div>
 
                  <br> <br>

                  <div class="payUserArea">
                     <h4 style="font-weight:900">주문자 정보</h4>
                     <span> <label>이름 : <%= loginUser.getMemberName() %></label></span>
                     <br>
                     <label>휴대전화 : <%= loginUser.getPhone() %></label>
                  </div>
                  <br>


                  <div class="payTotalArea">
                     <h4>결제 금액</h4>
                  </div>

                  <table width="600px">
                     <tr height="30px">
                     
                        <th width="300">총 주문 금액</th>
                        <th width="300">할인가</th>
                        <th width="300">총 결제 금액</th>
                     </tr>
                     <tr height="80">
                     
                        <td class="priceTd"><%= tprice %>원</td>
                        <td class="priceTd"><%= discount  %>원</td>
                        <td class="priceTd"><%= totalPrice %>원</td>
                     </tr>
                  </table>
                  <br>
                  <div class="selectcouponArea">
                     <label>쿠폰적용</label>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <select style="width: 40%; height:26px" class="couponSelect">
                        <option>--선택 해주세요--</option>
                     </select> &nbsp;&nbsp;
                     <button type="button" class="btn btn-info btn-lg couponBtn" data-toggle="modal" data-target="#myModal" 
                     style="width:15%; height:25px; background:salmon; padding:0; border:1px solid salmon">적용가능조회</button>
                  </div>

                  <br>
                  <div class="paypalArea">
                     <h4>결제 수단</h4>

                  </div>
                  <table>
                     <tr>
                        <th width="700"><label>결제수단</label></th>
                        <th width="400"><label>금액</label></th>
                        <th rowspan="3" width="300px">
                           <button class="ui button" style="width: 100%; height: 150px" onclick="requestPay();">결제하기</button>
                        </th>

                     </tr>
                     <tr>
                        <td rowspan="3">
                           <input type=radio name="paysel"id="paysel1" checked><label for="paysel1">카드결제</label><br>
                           <input type=radio name="paysel" id="paysel2"><label for="paysel2">계좌이체</label><br>
                        </td>
                        <td rowspan="3">1</td>
                     </tr>
                  </table>
					<input class="cCode" type="hidden" >



               </div>
               
            </section>


			</div>

			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

		</div>

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- 모달영역 -->
	<!-- Trigger the modal with a button -->


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background:salmon">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color:white; text-align:center">적용가능 상품</h4>
      </div>
      <div class="modal-body">
        <table style="width:100%">
        	<thead>
        	<tr>
        		<th style="width:15%"></th>
        		<th>상품명</th>
        		<th>판매가</th>
        		<th>할인가</th>
        		<th>할인적용금액</th>
        		<th>타입</th>      		
        	</tr>
        	</thead>
        	<tbody class="couponBody">
        	
        	</tbody>
        </table>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default searchCondition" data-dismiss="modal" style="background:salmon; border:1px solid salmon;">적용</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" style="background:salmon; color:white; border:1px solid salmon;">닫기</button>
      </div>
    </div>

  </div>
</div>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>

	<script>
	couponData = new Array();
	 $(function(){
	      var IMP = window.IMP; // 생략가능
	      IMP.init('imp59683824'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	      
	      
	      //쿠폰리턴
	      getCoupon();
	      $(".ui.button").css({"background":"salmon","color":"white"}); 
	      
	   });
	   
	   function requestPay(){
	      IMP.request_pay({
	          pg : 'inicis', // version 1.1.0부터 지원.
	          pay_method :'card',
	          merchant_uid : 'merchant_' + new Date().getTime(),
	          name : '<%= fullName %>',
	          amount : 100,
	          buyer_email : '<%= loginUser.getEmail() %>',
	          buyer_name : '<%= loginUser.getMemberName() %>',
	          buyer_tel : '<%= loginUser.getPhone() %>',
	          m_redirect_url : '../../index.jsp'
	      }, function(rsp) {
	          if ( rsp.success ) {
	              var msg = '결제가 완료되었습니다.';
	              
	              msg += '결제 금액 : ' + rsp.paid_amount;
	              msg += '카드 승인번호 : ' + rsp.apply_num;
	              msg += '고유ID : ' + rsp.imp_uid;
	              
	              var money = [];
			      var upno = [];
			      for(var i =0; i<$(".upno").length; i++){
			    	  var upnoTd = $(".upno")[i].value;
			    	  
			    	  if( $(".upno").length == 1){	    		  
			    		  money[i] = $("."+upnoTd)[0].innerHTML.replace('원',"")*0.99 - $("."+upnoTd)[1].innerHTML.replace('원',"");			    		  
			    	  }else if($(".upno")[i].length == 2){
			    		  money[i] = $("."+upnoTd)[0].innerHTML.replace('원',"")*0.97 - $("."+upnoTd)[1].innerHTML.replace('원',"");
			    	  }else{
			    		  money[i] = $("."+upnoTd)[0].innerHTML.replace('원',"")*0.95 - $("."+upnoTd)[1].innerHTML.replace('원',"");
			    	  }
			    	  upno[i] = $(".upno")[i].value;
			      }
			      
			      var uid = rsp.imp_uid;
	              var apply =  rsp.apply_num;
	              var couponCode = $(".couponSelect").val();
	   		   
	                            
	              $.ajax({
	            	 url:'<%=request.getContextPath()%>/insertPay.me',
	            	 type:'post',
	            	 data:{mno:<%=loginUser.getMno()%>,money:money.join(","),upno:upno.join(","),rspUid:uid,rspAppley:apply,couponCode:couponCode},
	            	 success:function(data){
	            		 console.log(data);
	            		 if(data > 0){
	            			 location.href = 'views/member/m_myPage_payment.jsp';
	            		 }else{
	            			 location.href = 'views/common/errorPage.jsp?msg="결제오류"';
	            		 }
						
	            	 },
	            	 error:function(data){
	            		 
	            	 }	            	 
	              });
	              
	              
	          } else {
	              var msg = '결제에 실패하였습니다.';
	              msg += '에러내용 : ' + rsp.error_msg;
	          }
	          alert(msg);
	      });   
	      
	   }
	   
	   function getCoupon(){
		   $.ajax({
		    	url:"<%=request.getContextPath()%>/getCouponList.me",
		    	type:"get",
		    	data:{mno:<%=loginUser.getMno() %>},
		    	success:function(data){
		    		console.log(data);
		    		var $couponSelect = $(".couponSelect");
		    		$couponSelect.empty();
		    		couponData = data;
		    		for(var i=0; i<data.length; i++){
		    			if(data[i].cDiscount == '퍼센트 할인'){
		    				$couponSelect.append($("<option>").text('[' + data[i].cCategory + ']'+ 
		    						data[i].cName+ ' (' + data[i].cRate+'% 할인' +') '  + 
		    						data[i].cStart.split(" ")[0]+ " ~ " + data[i].cEnd.split(" ")[0] ).val(data[i].cCode));
		    			}else{
		    				$couponSelect.append($("<option>").text('[' + data[i].cCategory + ']'+ 
		    						data[i].cName+ ' (' + data[i].cAmount+'원 할인' +') ' +
		    						data[i].cStart.split(" ")[0] + " ~ " + data[i].cEnd.split(" ")[0] ).val(data[i].cCode));
		    			}
		    			
		    		}
		    		
		    	},
		    	error:function(data){
		    		console.log(data);
		    	}
		     });
		   
		  
	   }
	  
	  $(".couponBtn").click(function(){
		  //console.log(couponData);
		  //console.log($(".couponSelect").val());
		  $(".couponBody").empty();
		  for(var i=0; i<couponData.length; i++){
			  if(couponData[i].cCode == $(".couponSelect").val()){
				var coupon = couponData[i];
				  
			  }
		  }
		  <% for(int i=0; i<list.size(); i++){ 
		  	hmap = list.get(i);
		  %>

		  if(coupon.cCategory == '<%=hmap.get("comType")%>'){
				  var $couponBody = $(".couponBody");
				  
				 var  $tr = $("<tr>");
				 var $inputTd = $("<input type='radio' name='coupon' class='discount'>")
				 .css("margin-left","35%")
				 .val(<%=hmap.get("upno")%>);
				 
				 var $pNameTd = $("<td>").text('<%= hmap.get("pName") %>');
				 var $priceTd = $("<td>").text('<%= hmap.get("price")%>');
		  
				 if(coupon.cDiscount == '퍼센트 할인'){
					  $discountTd = $("<td>").text((<%= hmap.get("price")%>/100*coupon.cRate));
					  $resultTd = $("<td>").text((<%= hmap.get("price")%> - (<%= hmap.get("price")%>/100*coupon.cRate)));
				  }else{
					  $discountTd = $("<td>").text(coupon.cAmount);
					  $resultTd = $("<td>").text((<%= hmap.get("price")%> - (coupon.cAmount)));
				  }
				  $typeTd = $("<td>").text('<%=hmap.get("comType")%>');
				 
				  
				  $tr.append($inputTd);
				  $tr.append($pNameTd);
				  $tr.append($priceTd);
				  $tr.append($discountTd);
				  $tr.append($resultTd);
				  $tr.append($typeTd);
				  $couponBody.append($tr);
			  }
		  
		<% } %>
			  
		  
		  
	  });
	   $(".searchCondition").click(function(){		   
		   var couponValue = $('input[name=coupon]:checked').val();
		   var notCouponValue = $('input[name=coupon]:not(:checked)');
		   $(".cCode").val(couponValue);
		  
		   var notCouponArr = new Array();
		   for(var i=0; i<notCouponValue.length; i++){
			   notCouponArr[i] = notCouponValue[i].value;
		   }
		   for(var i=0; i< <%= list.size() %>; i++){
		   
		   if(couponValue == $("."+couponValue).prop("class")){
			   //console.log( $('input[name=coupon]:checked').siblings()[2].innerHTML);
			    $("."+couponValue)[1].innerHTML = $('input[name=coupon]:checked').siblings()[2].innerHTML + '원';
			    $("."+couponValue)[2].innerHTML =  $('input[name=coupon]:checked').siblings()[3].innerHTML + '원';
			    $(".priceLabel").text('총 결제 금액 :' + (<%=totalPrice%>-$('input[name=coupon]:checked').siblings()[2].innerHTML) + '원    ' 
			    + '할인가 : ' + (<%=discount %> + Number($('input[name=coupon]:checked').siblings()[2].innerHTML)) + '원');
			    
			    $(".priceTd")[2].innerHTML = (<%=totalPrice%>-$('input[name=coupon]:checked').siblings()[2].innerHTML) + '원';
			    $(".priceTd")[1].innerHTML = (<%=discount %> + Number($('input[name=coupon]:checked').siblings()[2].innerHTML)) + '원';
		   }
			for(var i=0; i<notCouponArr.length; i++){
				if(notCouponArr[i] == $("."+notCouponArr[i]).prop("class")){
					$("."+notCouponArr[i])[1].innerHTML = 0;
					$("."+notCouponArr[i])[2].innerHTML = $("."+notCouponArr[i])[0].innerHTML;	
				}
				  
			}
						    
		   
			   
		   }
		   
	   });
		   
	   
 
	</script>

</body>
</html>
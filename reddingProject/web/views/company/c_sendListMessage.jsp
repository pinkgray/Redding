<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   href="${pageContext.request.contextPath}/css/company/c_sendListMessage.css"> 
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
      <%@include file="/views/company/c_nav.jsp"%>
   </div>

   <div class="container-fluid text-center">
      <div class="row content">
      
         <div class="col-sm-2 sidenav1 visible-md visible-lg visible-sm mesBtns">
            <button id="sendMessageBtn" onclick="location.href='<%=request.getContextPath()%>/views/company/c_sendMessage.jsp'">쪽지 보내기</button><br><br>
            <button id="receiveListMessageBtn" onclick="location.href='<%=request.getContextPath()%>/views/company/c_messageManager.jsp'">전체 쪽지</button><br><br>
            <button id="receiveListMessageBtn" onclick="location.href='<%=request.getContextPath()%>/views/company/c_receiveListMessage.jsp'">받은 쪽지</button><br><br>
            <button id="sendListMessageBtn" onclick="location.href='<%=request.getContextPath()%>/views/company/c_sendListMessage.jsp'">보낸 쪽지</button><br><br>
         </div>
         
         <div class="col-sm-8 text-left">
         <%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
         
            <div class="contentsArea" id="MMcontentArea">
            
               <div id="receiveMessageArea">
                  <!-- 받은 쪾지 관리 -->
                  <div id="RMHeader">
                     <h3>보낸 쪽지 목록</h3>
                     <div id="RMBtnsArea" style="float:right;">
                        <div id="RMDeleteBtn">삭제</div>
                     </div>
                  </div>
                  <table id="RMTable">
                     <thead>
                        <tr>
                           <th width="30"></th>
                           <th width="50">No.</th>
                           <th>내용</th>
                           <th width="140">보낸날짜</th>
                           <th width="120">상태</th>                     
                        </tr>
                     </thead>
                     <tbody class="rmTbody" id="rmTbody">
                     
                     
                     </tbody>
                     <tfoot class="TfootPage" id="rmTF">
                        <tr>
		                     <td colspan="6" class="pageBtnArea"><br>
		                        <button class="paging"> << </button>
		                        <button class="paging"> < </button>
		                        <button class="paging"> 1 </button>
		                        <button class="paging"> > </button>
		                        <button class="paging"> >> </button>                     
		                     </td>
	                  	</tr>
                     </tfoot>
                  </table>
               </div>
               
            </div>
         
         </div>
         
         
         <div class="col-sm-2 sidenav2"></div>
      </div>
   </div>

   <!-- 커먼 풋터 -->
   <div class="footerArea">
      <jsp:include page="/views/common/footer.jsp"></jsp:include>
   </div>
   <script>
      $(function(){
         var ckCount = 0;
         var nockCount=0;
         var totalCount = 0;
         var wt = 10;
         $.ajax({
            url:"<%=request.getContextPath()%>/listCountComWtype.mes",
            type:"post",
            data:{wt:wt},
            success:function(data){
               /* console.log('성공'); */
               ckCount = data.CK_COUNT;
               nockCount = data.NOCK_COUNT;
               totalCount = data.TOTAL_COUNT;
               totalView(1, totalCount);
               /* console.log("totalCount : " + totalCount); */
            },
            error:function(data){
               console.log('실패');
            }
            
         });
         
         function totalView(currentPage,value){
            /* console.log('totalView까지 옴');
            console.log("currentPage : " + currentPage);
            console.log('========'); */
            $.ajax({
               url:"<%=request.getContextPath()%>/comReceiveList.mes",
               type:"post",
               data:{currentPage:currentPage,value:value,wt:wt},
               success:function(data){
                  /* console.log('통신 성공'); */
                  /* console.log(data); */
                  makeRmTable(data, value);
               },
               error:function(data){
                  console.log('리스트 서블릿과 통신 실패');
               }
            });
         };
         function makeRmTable(data, value){
            $(".rmTbody").empty();
            /* console.log("data.compMesList.length : " + data.compMesList.length); */
            for(var i=0 ; i<data.compMesList.length ; i++){
               var list = data.compMesList[i];
               /* console.log("list : " + list); */
               var pi = data.pi;
               
               var $rmListTr = $("<tr>");
               
               //체크박스
               var $ckTd = $("<td>");
               var $ckIn = $("<input type='checkbox' class='ckBtns' name='ckBtns' style='cursor:pointer;'>");
               $ckTd.append($ckIn);
               
               //받은메세지startRow
               var $startRowTd = $("<td>").text(pi.startRow);
               
               //받은메세시코드
               var $codeIn = $("<input type='hidden'>");
               $codeIn.val(list.messageCode);
               $startRowTd.append($codeIn);
               
               //받은내용
               var $contentTd = $("<td>").text(list.mesContent.substr(0,30)+"....");
               
               //관리자가 발신한 날짜 업체는 받은날짜
               var $disDateTd = $("<td>").text(list.mesDisDate);
               
               //받은 쪽지 레벨
               var $levelIn =$("<inpyt type='hidden'>");
               $levelIn.val(list.mesLevel);
               $disDateTd.append($levelIn);
               
               //받은 메세지 발신, 수신 구분
               var $wtypeIn = $("<input type='hidden'>").text(list.mesWType);
               $disDateTd.append($wtypeIn);
               
               //원글 참조 쪽지번호 
               var $refIn = $("<input type='hidden'>");
               $refIn.val(list.mesRefCode);
               $disDateTd.append($refIn);
               
               //받은 쪽지 확인날짜(클릭시 읽음으로 바뀜)
               var $ckDateTd = $("<td>");
               var $ckDateDiv = null;
               if(list.mesCkDate != null){
                  $ckDateDiv = $("<div class='readTd' style='border-radius: 5px;background:white;border:1px solid salmon;color:salmon;'>").text("읽음");
               }else{
                  $ckDateDiv = $("<div class='noreadTd' style='border-radius: 5px;background:salmon;border:1px solid salmon;color:white;'>").text("읽지않음")
               }
               $ckDateTd.append($ckDateDiv);
               
               //업체 번호
	            var $cnoIn = $("<input type='hidden'>")
	            $cnoIn.val(list.cno);
	               $ckTd.append($cnoIn);
	               
	               $rmListTr.append($ckTd);
	               $rmListTr.append($startRowTd);
	               $rmListTr.append($contentTd);
	               $rmListTr.append($disDateTd);
	               $rmListTr.append($ckDateTd);
	               
	               $(".rmTbody").append($rmListTr);
	               pi.startRow++;
	               /* console.log("asdlkfj;lsjd"); */
	               $(".ckBtns").parent().siblings().mouseenter(function(){
	            	   $(this).parent().css("background","salmon");
	               }).mouseout(function(){
	            	   $(this).parent().css("background","white");
	               }).click(function(){
	            	   var code = $(this).parent().children().eq(1).children().eq(0).val();
	                   /* console.log(code); */
	                   //상세보기로 가기
	                   
	                   var wtp = $(this).parent().children().eq(3).children().eq(1);
	                   /* console.log("wtp.val()  :" +wtp.text()); */
	                   
	                   if(wtp.text()==20){
	 	                  location.href="<%=request.getContextPath()%>/replyToAdmin.mes?code="+code;
	                 	  
	                   }else{
	                 	  location.href="<%=request.getContextPath()%>/comMesOne.mes?code="+code;
	                   }
	               });
	            }
	            
	            page(data, value);
            
         };
         $(document).on('change', '#ckBtns', function(){
        	 code = $(this).parent().parent().children().eq(1).children().eq(0);
      	     code2 = code.val();
        	 length =  checked.length;
        	 if ($(this).is(":checked") == true){
        		 /* console.log("length :" + length); */
        		 checked[length]=code2;
        		 /* console.log("checked["+length+"] : " + checked[length]); */
        	 }else{
        		 for(var i=0 ; i<length; i++){
        			 if(code2==checked[i]){
        				 checked.splice(i,1);
        			 }
        		 }
        	 }
        	 /* console.log("checked : " + checked); */
        	 /* console.log("-----------------------------"); */
        	 
         });
         
         
		$(document).on('click', '#RMDeleteBtn', function(){
			if(checked == ""){
				alert('체크된 메세지가 없습니다.');
			}else{
				location.href="<%=request.getContextPath()%>/deleteComMes?checked="+checked;
			}
		});
       //페이징
         function page(data, value){
         	 /* console.log('value : ' + value); */
         		/* console.log("Sdf : "+data.pi.currentPage); */
 	           var $page = $(".pageBtnArea");
 	           
 	           var pi = data.pi;
 	           var currentPage = pi.currentPage;
 	           var limit = pi.limit;
 	           var maxPage = pi.maxPage;
 	           var startPage = pi.startPage;
 	           var endPage = pi.endPage;
 	           /* console.log("currentPage : " + currentPage); */
 	           /* console.log("limit : " + limit);
 	           console.log("maxPage : " + maxPage);
 	           console.log("endPage : " + endPage);
 	           console.log("startPage : " + startPage); */
 	           
 	           
 	           $page.empty();
 	           
 	           $page.append($("<button>").attr("class","paging").text("<<").css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}).click(function(){
 	              totalView(1,value);
 	          }));
 	           
 	           
 	            if(currentPage <= 1) { 
 	                 $page.append($("<button>").attr("class","paging").text("<").attr("disabled",true).css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}));
 	            }else{ 
 	               $page.append($("<button>").attr("class","paging").text("<").css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}).click(function(){
 	                     totalView(currentPage - 1,value);
 	                     
 	               }));
 	
 	            } 
 	            for(var p= startPage; p <= endPage; p++){
 	            	if(p == currentPage){
 						$page.append($("<button>").attr("class","paging").text( p ).attr("disabled",true).css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid salmon"}));
 					}else{ 
 						$page.append($("<button>").attr("class","paging").css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}).text( p ).click(function(){
 							totalView($(this).text(),value);
 						}));
 					}
 	            
 	            } 
 	            if(currentPage >= maxPage){ 
 				 	$page.append($("<button>").attr("class","paging").text(" > ").attr("disabled",true).css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}));					
 				}else {
 				 	$page.append($("<button>").attr("class","paging").text(" > ").css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}).click(function(){
 				 		totalView(currentPage + 1,value);
 				 	}));
 				} 
 	            $page.append($("<button>").attr("class","paging").text(" >> ").css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}).click(function(){
 					   totalView(maxPage,value);
 				}));
         }
      });
   </script>
</body>
</html>
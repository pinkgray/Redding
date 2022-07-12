<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*, com.kh.redding.message.model.vo.*"%>
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
   href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css" 
   href="${pageContext.request.contextPath}/css/admin/a_message.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<style>
</style>
<title>REDDING♥</title>
</head>
<body>
   <%-- <div>
      <%@include file="/views/admin/a_nav.jsp"%>
   </div> --%>
   <%@ include file="/views/admin/a_sideNav.jsp" %>
   <div class="container-fluid text-center">
      <div class="row content">

      <div class="visible-md visible-lg visible-sm">
         <div class="col-sm-2 sidenav1">
            <%-- <div class="sidenavArea">
               <ul class="navList">
               		 <li onclick="location.href='<%=request.getContextPath()%>/selectList.co'">업체 목록</li>
                     <li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_Message.jsp'">받은 쪽지 관리</li>
                     <li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_SendMessage.jsp'">보낸 쪽지 관리</li>
               </ul>
            </div> --%>
         </div>
      </div>
      
      <div class="visible-xs sideListnav2">
               <div class="col-sm-2 sidenav1">
                  <%-- <div class="sidenavArea2">
                  <ul class="navList2">
                     <li onclick="location.href='<%=request.getContextPath()%>/selectList.co'">업체 목록</li>
                     <li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_Message.jsp'">받은 쪽지 관리</li>
                     <li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_SendMessage.jsp'">보낸 쪽지 관리</li>
                  </ul>
               </div> --%>
               </div>
              
            </div>
         <div class="col-sm-10 text-left">
            <%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
            <div class="messageArea">
            
               <div class="message">
                  <br>
                  
                  <div class="sendMessage">
                     <h3 id="text2">받은 쪽지 목록</h3>
                     <br>
                     <div class="ui category search">
                           <div class="ui icon input">
                              <input class="prompt" type="text" id="searchCnameArea" class="searchCnameArea"> 
                              <i class="search icon"></i>
                           </div>
                           <div id="RMBtnsArea" style="float:right;">
		                        <div id="searchBtns" class="searchBtns" style="margin-left: 10%;">검색</div>
		                   </div>
                        </div>
                     <div class="memberBaseInfo">
                        <br> <br>
                        <table id="sendMesTB">
                           <thead class="sendTH">
                              <tr style="background: lightgray;">
                                 <td></td>
                                 <td>No.</td>
                                 <td>발신인</td>
                                 <td>내용</td>
                                 <td>발신날짜</td>
                                 <td>상태</td>
                              </tr>
                           </thead>
                           <tbody class="sendTBody">
                                 <tr>
                                    <td><input type='checkbox' class="ckBtns"style='cursor:pointer;'></td>
                                    <td><input type="hidden"></td>
                                    <td></td>
                                    <td></td>
                                    <td><input type="hidden"><input type="hidden"><input type="hidden"><input type="hidden"></td>
                                    <td><div class="readTd"></div></td>
                                 </tr>
      
                           </tbody>
                           
                           <tfoot class="sendTF">
                              <tr>
                                 <td colspan="6" class="pageBtnArea"><br>
                                    <button class="paging"><<</button>
                                    <button class="paging"><</button>
                                    <button class="paging">1</button>
                                    <button class="paging">></button>
                                    <button class="paging">>></button>                     
                                 </td>
                              </tr>
                           </tfoot>
                        </table>
                     </div>
                  </div>

               </div>
            </div>


            <div class="col-sm-2 sidenav2"></div>
         </div>
      </div>
      </div>

      <!-- 커먼 풋터 -->
      <div class="footerArea">
         <jsp:include page="/views/common/footer.jsp"></jsp:include>
      </div>
      <script>
         $(function(){
            var ckCount = 0;
            var nockCount = 0;
            var totalCount = 0;
            var wt = 10;
            var code1;
            var code2;
            var cname;
            var condition;
            /* console.log("condition : " + condition); */
            $.ajax({
                url:"<%=request.getContextPath()%>/listCount.mes",
                data:{wt:wt},
               	type:"post",
               	success:function(data){
                  //처음에 전체 리스트를 보여주는 함수를 호출해준다.
                  /* console.log(data); */
                  ckCount = data.CK_COUNT;
                  nockCount = data.NOCK_COUNT;
                  totalCount = data.TOTAL_COUNT;
                  /* console.log("ckCount : " + ckCount);
                  console.log("nockCount : " + nockCount);
                  console.log(totalCount); */
                  
                  totalView(1, totalCount, condition);
   
               },
               error:function(){
                  alert("통신불가");
               }
            });
            
            //전체 리스트 가져오는 함수
            function totalView(currentPage,value,condition){
               /* console.log('함수 호출');
               console.log("value : " + value); */
               /* console.log("condition : " + condition);
               console.log("totalCount : " + totalCount);
               console.log("currentPage : " + currentPage); */
               /* console.log("cname : " + cname); */
               if(condition==20){
	               $.ajax({
		                  url:"<%=request.getContextPath()%>/searchList.mes",
		                  type:"post",
		                  data:{currentPage:currentPage, value:value, cname:cname},
		                  success:function(data){
		                     listTB(data, value);
		                  },
		                  error:function(){
		                     alert('nnnnnnnn');
		                  }
		            });
               }else{
	               $.ajax({
	                  url:"<%=request.getContextPath()%>/receiveList.mes",
	                  type:"post",
	                  data:{currentPage:currentPage, value:value},
	                  success:function(data){
	                     listTB(data, value);
	                  },
	                  error:function(){
	                     alert('nnnnnnnn');
	                  }
	               });
               }
            };
            

            //테이블 만들어 주는 함수
            function listTB(data, value){
               $(".sendTBody").empty();
               /* console.log(data.sendList.length); */
               /* console.log(data); */
               
               for(var i=0 ; i<data.receiveList.length ; i++){
                  var list = data.receiveList[i];
                  var pi = data.pi;
                  /* console.log(list);
                  console.log(list.messageCode);
                  console.log("--------------"); */
                  var $listTr = $("<tr>");
                  
                  var $ckTd = $("<td>");
                  var $ckIn = $("<input type='hidden' class='ckBtns' name='ckBtns' style='cursor:pointer;'>");
                  
                  $ckTd.append($ckIn);
                  
                  var $numTd = $("<td>").text(pi.startRow);
                  var $codeIn = $("<input type='hidden'>");
                  
                  $codeIn.val(list.messageCode);
                  
                  $numTd.append($codeIn);
                  
                  /* console.log(cnames.memberName); */
                  var $nameTd = $("<td>").text(list.mname);
                  
                  
                  var $contentTd = $("<td>").text(list.mesContent.substr(0,30)+"...");
                  var $disDateTd = $("<td>").text(list.mesDisDate);
                  var $levelIn = $("<input type='hidden'>");
                  $levelIn.val(list.mesLevel);
                  $disDateTd.append($levelIn);
                  
                  var $ckDateTd = $("<td>");
                  
                  var $ckDateDiv = null;

                  if(list.mesCkDate != null){
                     $ckDateDiv = $("<div class='readTd' style='border-radius: 5px;background:white;border:1px solid salmon;color:salmon;'>").text(list.mesCkDate);
                  }else{
                     $ckDateDiv = $("<div class='noreadTd' style='border-radius: 5px;background:salmon;border:1px solid salmon;color:white;'>").text("읽지않음");
                  }
                  $ckDateTd.append($ckDateDiv);
                  var $wtypeIn = $("<input type='hidden'>");
                  $wtypeIn.val(list.mesWType);                  
                  $disDateTd.append($wtypeIn);
                  
                  var $refIn = $("<input type='hidden'>");
                  $refIn.val(list.mesRefCode);
                  $disDateTd.append($refIn);
                  
                  var $cnoIn = $("<input type='hidden'>");
                  $cnoIn.val(list.cno);
                  $ckTd.append($cnoIn);
                  
                  $listTr.append($ckTd);
                  $listTr.append($numTd);
                  $listTr.append($nameTd);
                  $listTr.append($contentTd);
                  $listTr.append($disDateTd);
                  $listTr.append($ckDateTd);
                  
                  
                  $(".sendTBody").append($listTr);
                  
                  pi.startRow++;
                  
                  $(".ckBtns").parent().siblings().mouseenter(function(){
                	  $(this).parent().css("background","mistyrose");
                  }).mouseout(function(){
                	  $(this).parent().css("background","white");
                  }).click(function(){
                	  
                	  code1 = $(this).parent().children().eq(1).children().eq(0);
                	  code2 = code1.val();
                	  /* console.log(code2); */
                      location.href="<%=request.getContextPath()%>/replyToCno.mes?code="+code2;
                  });
               }
               
               $(".sendRBody").append($("<br>"));
               page(data, value);
            };
            $(document).on('click', '#searchBtns', function(){
            	cname = $("#searchCnameArea").val();
            	if(cname == ""){
            		alert('검색하실 이름을 입력해주세요.');
            	}else{
	            	/* console.log(cname); */
	            	condition = 20;
	            	totalView(1,totalCount,20);
            		
            	}
            	
            });
            //페이징
            function page(data, value){
               var $page = $(".pageBtnArea");
               
               var pi = data.pi;
               var currentPage = pi.currentPage;
               var limit = pi.limit;
               var maxPage = pi.maxPage;
               var startPage = pi.startPage;
               var endPage = pi.endPage;
               
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
	                  $page.append($("<button>").attr("class","paging").text(p).attr("disabled",true).css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}));
	               }else{ 
	                  $page.append($("<button>").attr("class","paging").css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}).text(p).click(function(){
	                     totalView($(this).text(),value);
	                  }));
	               }
	            
	            } 
	            if(currentPage >= maxPage){ 
	                $page.append($("<button>").attr("class","paging").text(">").attr("disabled",true).css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}));               
	            }else {
	                $page.append($("<button>").attr("class","paging").text(">").css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}).click(function(){
	                   totalView(currentPage + 1,value);
	                }));
	            } 
	            $page.append($("<button>").attr("class","paging").text(">>").css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}).click(function(){
	               totalView(maxPage,value);
	            }));
            }
         });
      </script>
</body>
</html>
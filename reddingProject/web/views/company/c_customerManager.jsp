<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/company/c_main.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/company/c_customerManager.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
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
   <div id="CMAreaTop">
      <jsp:include page="/views/company/c_nav.jsp"></jsp:include>
   </div>

   <div class="container-fluid text-center">
      <div class="row content">
      
         
         
         
         <div class="col-sm-2 sidenav1 visible-md visible-lg visible-sm">
            <div class="visible-md visible-lg visible-sm">
               <ul>
                  <li class="CMList" id="CMQTableBtn"><h4>고객 문의 관리</h4></li>
                  <li class="CMList" id="customerManagerReservationBtn"><h4>예약 현황</h4></li>
                  <li class="CMList" id="CMBHeaderBtn"><h4>예약자 정보 조회</h4></li>
               </ul>
            </div>
            <div class="visible-xs">
            </div>
         </div>
         
         <div class="col-sm-8 text-left">
         <%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
         
            <div class="contentsArea" id="CMContentArea">
            
            
               <div id="customerManagerQNAArea">
                  <!-- 고객문의 관리 -->
                  
                  <h3>고객 문의 목록</h3>
                  <table id="CMQTable">
                     <!-- 문의 조회 전체 결과 테이블 -->
                     <tr>
                        <th width="5%">No.</th>
                        <th width="30%">제목</th>
                        <th width="10%">작성자</th>
                        <th width="10%">날짜</th>
                        <th width="10%">답변하기</th>                     
                     </tr>
                     <!-- 다음 행부터는 자바스크립트로 ajax 처리 -->
                     <tr class="detail">
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td></td>
                     </tr>
                     <tr style="display:none;">
                     	<td>내용</td>
                     	<td colspan="3">
                     		<p id="detailQna">우는 품고 끓는 거선의 있는 것은 바로 인류의 청춘이 운다. 뜨거운지라, 이상 하여도 곳으로 관현악이며, 가치를 그러므로 사막이다. 꾸며 풀이 얼마나 보는 보내는 청춘 것이다. 청춘 심장의 우리 관현악이며, 따뜻한 커다란 위하여 고동을 있는 때문이다. 천자만홍이 청춘이 품에 것은 있는가? 풍부하게 든 굳세게 것이다. 아니한 때에, 피어나기 있는 위하여 있다. 품었기 따뜻한 구할 구하기 구하지 이것이야말로 반짝이는 그들은 온갖 황금시대다. 가장 가슴에 싶이 속잎나고, 것이다. 굳세게 아름답고 청춘의 곳이 몸이 웅대한 봄바람이다. 가치를 꽃이 장식하는 우리는 밥을 굳세게 못할 같은 사막이다.

무엇이 굳세게 이상의 피에 관현악이며, 아니다. 가진 장식하는 청춘의 인생에 방지하는 것이다. 뭇 피부가 우리 봄날의 이상 청춘이 용감하고 피다. 품으며, 이것이야말로 하였으며, 것이다. 것은 모래뿐일 그것을 놀이 가는 보는 위하여 것이다. 바이며, 인생의 것은 가진 우리의 피부가 교향악이다. 평화스러운 사는가 것이 자신과 이성은 얼마나 있음으로써 끝에 노년에게서 위하여서. 피어나기 피가 열락의 이것이다. 것이 거친 그와 봄바람이다.

천지는 노래하며 고행을 가는 피다. 뜨거운지라, 가슴이 않는 예가 칼이다. 공자는 따뜻한 새 간에 가치를 들어 피가 가장 설산에서 보라. 내는 같이, 싹이 아름다우냐? 얼음과 가지에 꽃이 그들의 인생을 광야에서 그리하였는가? 몸이 너의 때까지 이것을 뼈 그들의 천하를 약동하다. 산야에 심장은 거친 무엇을 끓는 구하지 것이다. 커다란 같이, 보는 못할 아름답고 보이는 영원히 너의 때문이다. 천고에 자신과 우리의 우리의 풀이 이것이다. 타오르고 고동을 그러므로 구하지 약동하다. 놀이 그것을 그들은 앞이 이상의 이상이 길지 부패뿐이다.</p>
                     	</td>
                     	<td><div class="replyQNABtn" id="replyQNABtn">답변하기</div></td>
                     </tr>
                     <tr class="detail">
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td></td>
                     </tr>
                     <tr style="display:none;">
                     	<td>내용</td>
                     	<td colspan="3">
                     		<p id="detailQna">우는 품고 끓는 거선의 있는 것은 바로 인류의 청춘이 운다. 뜨거운지라, 이상 하여도 곳으로 관현악이며, 가치를 그러므로 사막이다. 꾸며 풀이 얼마나 보는 보내는 청춘 것이다. 청춘 심장의 우리 관현악이며, 따뜻한 커다란 위하여 고동을 있는 때문이다. 천자만홍이 청춘이 품에 것은 있는가? 풍부하게 든 굳세게 것이다. 아니한 때에, 피어나기 있는 위하여 있다. 품었기 따뜻한 구할 구하기 구하지 이것이야말로 반짝이는 그들은 온갖 황금시대다. 가장 가슴에 싶이 속잎나고, 것이다. 굳세게 아름답고 청춘의 곳이 몸이 웅대한 봄바람이다. 가치를 꽃이 장식하는 우리는 밥을 굳세게 못할 같은 사막이다.

무엇이 굳세게 이상의 피에 관현악이며, 아니다. 가진 장식하는 청춘의 인생에 방지하는 것이다. 뭇 피부가 우리 봄날의 이상 청춘이 용감하고 피다. 품으며, 이것이야말로 하였으며, 것이다. 것은 모래뿐일 그것을 놀이 가는 보는 위하여 것이다. 바이며, 인생의 것은 가진 우리의 피부가 교향악이다. 평화스러운 사는가 것이 자신과 이성은 얼마나 있음으로써 끝에 노년에게서 위하여서. 피어나기 피가 열락의 이것이다. 것이 거친 그와 봄바람이다.

천지는 노래하며 고행을 가는 피다. 뜨거운지라, 가슴이 않는 예가 칼이다. 공자는 따뜻한 새 간에 가치를 들어 피가 가장 설산에서 보라. 내는 같이, 싹이 아름다우냐? 얼음과 가지에 꽃이 그들의 인생을 광야에서 그리하였는가? 몸이 너의 때까지 이것을 뼈 그들의 천하를 약동하다. 산야에 심장은 거친 무엇을 끓는 구하지 것이다. 커다란 같이, 보는 못할 아름답고 보이는 영원히 너의 때문이다. 천고에 자신과 우리의 우리의 풀이 이것이다. 타오르고 고동을 그러므로 구하지 약동하다. 놀이 그것을 그들은 앞이 이상의 이상이 길지 부패뿐이다.</p>
                     	</td>
                     	<td><div class="replyQNABtn" id="replyQNABtn">답변하기</div></td>
                     	
                     </tr>
                  </table>
                  
                  <div id="myModal" class="modal">
 
				      <!-- Modal content -->
				      <div class="modal-content">
				        	<span class="close">&times;</span> 
				        	<form action="" method="post">
				        		<div id="receiveArea">
							        <h3>받은 문의</h3>
							        <!-- 고객의 문의에 대한 답변 -->
							        <div class="modalContent">
							        	<label>발신인 </label> <input type="text" class="receiveQna" name="receiveId" id="receiveId" value="해당쪽지의 수신인을 getAttribute(admin)로 가져오시오"readonly>
							        	<label>수신날짜 </label> <input type="text" class="receiveQna" name="receiveDay" id="receiveDay" value="받은 쪽지 날짜"readonly><br>
							        	<label>제목</label> <input type="text" class="receiveQna" name="receiveTitle" id="receiveTitle" value="해당 문의의 제목" readonly>
							        	<textarea class="receiveQna" name="receiveContent" id="receiveContent"readonly>
							        		관리자의 쪽지 내용을 ajax로 서블릿에서 가져온다
							     
							        	</textarea>
							        </div>
				        		</div>
				        		<div id="sendArea">
				        			<h3>답장 보내기</h3>
				        				<label>제목</label><input type="text" class="sendQna" name="sendTitle" id="sendTitle" placeholder="제목을 입력해주세요" value="">
							        	<textarea class="sendQna" name="sendContent" id="sendContent">
							        		
							        		쪽지 내용에 대한 답변 작성
							     
							        	</textarea>
				        		</div>
						        <div id="sendBtn" align="center">보내기</div>
				        		
				        	</form>                                                              
				      </div>
				 
				  </div>
              
                                 
                  
                  <div id="CMQPagingArea">
                     <!-- 페이징버튼 -->
                  </div>
               </div>
               
               <div id="customerManagerReservation">
                  <!-- 예약 현황 -->
                  <h3>예약 현황</h3>
                  <div id="CMRStatus">
                     <!-- 캘린더 include해서 예약 현황들 보여주기 -->
                  </div>
               </div>
               <div id="upBtn">▲</div>
                  
               
               <div id="customerManagerBooker">
                  <!-- 예약자 정보 조회 -->   
                  <div id="CMBHeader">
                     <h3>예약자 정보 조회</h3>
                     <form id="bookerNickNameArea">
                        <input type="search" name="bookerNickName" placeholder="조회할 회원의 닉네임을 입력해주세요" size="30" id="CMBHeaderInputArea">
                        <div id="bookerNickNameBtn">찾기</div>
                     </form>
                  </div>
                  <div id="CMBSelectListArea">
                     <table id="CMBTable">
                        <tr>
                           <th width="5%">No.</th>
                           <th width="30%">상품</th>
                           <th width="15">예약자(성별)</th>
                           <th width="20%">연락처</th>
                           <th width="10%">예약날짜</th>
                           <th width="10%">예약시간</th>
                           <th width="10%"><div id="reserveStatus">진행상황</div></th>
                        </tr>
                        <!-- 자바스크립트로 전체리스트조회 결과 테이블 보여주고 input에서 search한 결과를 ajax로 변경해서 보여준다 -->
                        <tr class="cmbRow">
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                     </tr>
                     <!-- <tr style="display:none;">
                     	<td>내용</td>
                     	<td colspan="5">
                     		<p id="detailQna">우는 품고 끓는 거선의 있는 것은 바로 인류의 청춘이 운다. 뜨거운지라, 이상 하여도 곳으로 관현악이며, 가치를 그러므로 사막이다. 꾸며 풀이 얼마나 보는 보내는 청춘 것이다. 청춘 심장의 우리 관현악이며, 따뜻한 커다란 위하여 고동을 있는 때문이다. 천자만홍이 청춘이 품에 것은 있는가? 풍부하게 든 굳세게 것이다. 아니한 때에, 피어나기 있는 위하여 있다. 품었기 따뜻한 구할 구하기 구하지 이것이야말로 반짝이는 그들은 온갖 황금시대다. 가장 가슴에 싶이 속잎나고, 것이다. 굳세게 아름답고 청춘의 곳이 몸이 웅대한 봄바람이다. 가치를 꽃이 장식하는 우리는 밥을 굳세게 못할 같은 사막이다.

무엇이 굳세게 이상의 피에 관현악이며, 아니다. 가진 장식하는 청춘의 인생에 방지하는 것이다. 뭇 피부가 우리 봄날의 이상 청춘이 용감하고 피다. 품으며, 이것이야말로 하였으며, 것이다. 것은 모래뿐일 그것을 놀이 가는 보는 위하여 것이다. 바이며, 인생의 것은 가진 우리의 피부가 교향악이다. 평화스러운 사는가 것이 자신과 이성은 얼마나 있음으로써 끝에 노년에게서 위하여서. 피어나기 피가 열락의 이것이다. 것이 거친 그와 봄바람이다.

천지는 노래하며 고행을 가는 피다. 뜨거운지라, 가슴이 않는 예가 칼이다. 공자는 따뜻한 새 간에 가치를 들어 피가 가장 설산에서 보라. 내는 같이, 싹이 아름다우냐? 얼음과 가지에 꽃이 그들의 인생을 광야에서 그리하였는가? 몸이 너의 때까지 이것을 뼈 그들의 천하를 약동하다. 산야에 심장은 거친 무엇을 끓는 구하지 것이다. 커다란 같이, 보는 못할 아름답고 보이는 영원히 너의 때문이다. 천고에 자신과 우리의 우리의 풀이 이것이다. 타오르고 고동을 그러므로 구하지 약동하다. 놀이 그것을 그들은 앞이 이상의 이상이 길지 부패뿐이다.</p>
                     	</td>
                     </tr> -->
                     <tr class="cmbRow">
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                     </tr>
                     <!-- <tr style="display:none;">
                     	<td>내용</td>
                     	<td colspan="5">
                     		<p id="detailQna">우는 품고 끓는 거선의 있는 것은 바로 인류의 청춘이 운다. 뜨거운지라, 이상 하여도 곳으로 관현악이며, 가치를 그러므로 사막이다. 꾸며 풀이 얼마나 보는 보내는 청춘 것이다. 청춘 심장의 우리 관현악이며, 따뜻한 커다란 위하여 고동을 있는 때문이다. 천자만홍이 청춘이 품에 것은 있는가? 풍부하게 든 굳세게 것이다. 아니한 때에, 피어나기 있는 위하여 있다. 품었기 따뜻한 구할 구하기 구하지 이것이야말로 반짝이는 그들은 온갖 황금시대다. 가장 가슴에 싶이 속잎나고, 것이다. 굳세게 아름답고 청춘의 곳이 몸이 웅대한 봄바람이다. 가치를 꽃이 장식하는 우리는 밥을 굳세게 못할 같은 사막이다.

무엇이 굳세게 이상의 피에 관현악이며, 아니다. 가진 장식하는 청춘의 인생에 방지하는 것이다. 뭇 피부가 우리 봄날의 이상 청춘이 용감하고 피다. 품으며, 이것이야말로 하였으며, 것이다. 것은 모래뿐일 그것을 놀이 가는 보는 위하여 것이다. 바이며, 인생의 것은 가진 우리의 피부가 교향악이다. 평화스러운 사는가 것이 자신과 이성은 얼마나 있음으로써 끝에 노년에게서 위하여서. 피어나기 피가 열락의 이것이다. 것이 거친 그와 봄바람이다.

천지는 노래하며 고행을 가는 피다. 뜨거운지라, 가슴이 않는 예가 칼이다. 공자는 따뜻한 새 간에 가치를 들어 피가 가장 설산에서 보라. 내는 같이, 싹이 아름다우냐? 얼음과 가지에 꽃이 그들의 인생을 광야에서 그리하였는가? 몸이 너의 때까지 이것을 뼈 그들의 천하를 약동하다. 산야에 심장은 거친 무엇을 끓는 구하지 것이다. 커다란 같이, 보는 못할 아름답고 보이는 영원히 너의 때문이다. 천고에 자신과 우리의 우리의 풀이 이것이다. 타오르고 고동을 그러므로 구하지 약동하다. 놀이 그것을 그들은 앞이 이상의 이상이 길지 부패뿐이다.</p>
                     	</td>
                     </tr> -->
                     </table>
                  </div>
                  <div id="CMBPagingArea">
                  </div>
               </div>
               <div id="topBtn">▲</div>
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
         // Get the modal
         var modal = document.getElementById('myModal');
         
         
         // Get the <span> element that closes the modal
         var span = document.getElementsByClassName("close")[0];                                          
         
         // When the user clicks on the button, open the modal 
         $(".replyQNABtn").click(function() {
             modal.style.display = "block";
         });
         
         // When the user clicks on <span> (x), close the modal
         span.onclick = function() {
             modal.style.display = "none";
         }
         
         // When the user clicks anywhere outside of the modal, close it
         window.onclick = function(event) {
             if (event.target == modal) {
                 modal.style.display = "none";
             }
         }
         $("#sendReplyBtn").click(function(){
            alert("쪽지를 보냈습니다.");
            //제목이랑 내용, 작성자, 날짜를 서블릿으로 넘겨줘서 DB에 저장
            modal.style.display = "none";
            
         });
         
         $("#bookerNickNameBtn").click(function(){
            $("#bookerNickNameArea").attr("src", "");
            //회원 조회 서블릿으로 보내주기
         });
         
         $("#CMQTableBtn").click(function(){
            location.href="#CMAreaTop";
            
         });
         $("#customerManagerReservationBtn").click(function(){
            location.href="#customerManagerReservation";
         });
         $("#CMBHeaderBtn").click(function(){
            location.href="#customerManagerBooker";
         });
         $("#upBtn").click(function(){
            location.href="#CMAreaTop";
         });
         $("#topBtn").click(function(){
            location.href="#CMAreaTop";
         });
         $(".detail").click(function(){        	 
        	 var myTr = $(this).next();
        	 if(myTr.is(":visible")){
        		 myTr.slideUp();
        	 }else{
        		 myTr.slideDown();
        		 $(this).css({"border-bottom":"none"});
        		 myTr.css({"border-top":"none"});
        	 }
         }).mouseenter(function(){
        	 $(this).css({"background":"MistyRose"});
         }).mouseout(function(){
        	 $(this).css({"background":"white"});
         });
         $(".cmbRow").mouseenter(function(){
        	 $(this).css({"background":"MistyRose"});
         }).mouseout(function(){
        	 $(this).css({"background":"white"});
         });
         $("#sendBtn").click(function(){
        	 alert('답장을 보내셨습니다.');
        	 location.href="<%=request.getContextPath()%>/views/company/c_customerManager.jsp";
         });
      });

   </script>
</body>
</html>
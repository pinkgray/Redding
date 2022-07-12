<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.Member"%>
<%
   Member loginUser = (Member) session.getAttribute("loginUser");
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
   href="${pageContext.request.contextPath}/css/company/c_productInsert.css"> 
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
   <div>
      <jsp:include page="/views/company/c_nav.jsp"></jsp:include>
   </div>

   <div class="container-fluid text-center">
      <div class="row content">
      
         <div class="col-sm-2 sidenav1 visible-md visible-lg visible-sm">
            <div id="productUploadBtn">상품 등록</div><br><br>
            <div id="proResBtn">예약 현황</div>
         </div>
         
         
         <div class="col-sm-8 text-left">
         <%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
         
            <div class="contentsArea" id="productInsertArea">
               <form action="<%=request.getContextPath() %>/insert.pr" method="post" id = "insertPro">
                     
                  <div id="PIHeader">
                     <h3>상품등록 페이지</h3>
                  </div>
                  <div id="PISection">
                       <table id="PITable">
                          <tr>
                             <th width="15%">&nbsp;</th>
                             <th width="15%" >&nbsp;</th>
                             <th width="5%">&nbsp;</th>
                             <th width="15%">&nbsp;</th>
                             <th width="15%">&nbsp;</th>
                             <th width="10%">&nbsp;</th>
                             <th width="20%">&nbsp;</th>
                          </tr>
                          <tr>
                             <td>
                                <label>판매 여부</label>
                                <input type="hidden" value="<%=loginUser.getMno()%>" id="cNo" name="cNo">
                             </td>                    
                             <td>
                                <input type="radio" name="proStatus" id="proStatusYes" value="판매">
                                <label for="proStatusYes">판매함</label>
                                <input type="radio" name="proStatus" id="proStatusNo" value="판매안함">
                                <label for="proStatusNo">판매안함</label>
                             </td>         
                          </tr>
                          <tr>
                             <td>
                                <label>구분</label>
                             </td>
                             <td>
                                <select id="PICategorySelect" name="picSelect">
                                   <option value="리허설">리허설</option>
                                   <option value="리허설+본식">리허설 + 본식</option>
                                   <option value="본식">본식</option>
                                </select>
                             </td>
                             <td id="space">
                                <label>-</label>
                             </td>
                             <td id="space">
                                <label>담당자</label>
                             </td>
                             <td id="manager">
                                <select id="PIManagerSelect" name="pmiSelect">
                                   <option value="" selected>--선택--</option>
                                   <option value="원장">원장</option>
                                   <option value="부원장">부원장</option>
                                   <option value="팀장">팀장</option>
                                   <option value="스탭">스탭</option>
                                   <option value="기타">기타</option>
                                </select>
                             </td>
                             <td id="space">
                                <label>수량</label>
                             </td>
                             <td id="amount">
                                <select id="productAmount" name="productAmount">
                                   <option value="" selected>--선택--</option>
                                   <option value="1">1</option>
                                   <option value="2">2</option>
                                   <option value="3">3</option>
                                   <option value="4">4</option>
                                   <option value="기타">기타</option>
                                </select>
                             </td>
                          </tr>
                          <tr>
                             <td>
                              <label>가격</label>
                             </td>
                             <td colspan="6">
                                <input type="number" name="piPrice" id="piPrice" step="5000" min="0">
                             </td>
                          </tr>
                          <!-- <tr>
                             <td>
                                <label>휴무일</label>
                             </td>
                             <td colspan="6">
                                <div id="PIRestDayCheck">
                                   <input class="restDayCheck" type="checkbox" name="restDay" id="monday" value="">
                                   <label for="monday">월</label>
                                   <input type="checkbox" name="restDay" id="thuesday" value="">
                                   <label for="thuesday">화</label>
                                   <input type="checkbox" name="restDay" id="wednesday" value="">
                                   <label for="wednesday">수</label>
                                   <input type="checkbox" name="restDay" id="thursday" value="">
                                   <label for="thursday">목</label>
                                   <input type="checkbox" name="restDay" id="friday" value="">
                                   <label for="friday">금</label>
                                   <input type="checkbox" name="restDay" id="saturday" value="">
                                   <label for="saturday">토</label>
                                   <input type="checkbox" name="restDay" id="sunday" value="">
                                   <label for="sunday">일</label>
                                </div>
                             </td>
                          </tr> -->
                          <tr>
                             <td>
                                <label>판매 시작 날짜</label>
                             </td>
                             <td>
                                <input type="date" name="proStartDay" id="proStartDay">
                             </td>
                             <td id="space">
                                <label>-</label>
                             </td>
                             <td>
                                <label>판매 종료 날짜</label>
                             </td>
                             <td>
                                <input type="date" name="proEndDay" id="proEndDay">
                             </td>
                          </tr>
                          <!-- <tr>
                             <td>
                                <label>예약 시작 시간</label>
                             </td>
                             <td>
                                <input type="time" name="startTime" id="startTime">
                             </td>
                             <td id="space">
                                <label> - </label>
                             </td>
                             <td id="space">
                                <label>예약 종료시간</label>
                             </td>
                             <td>
                                <input type="time" name="endTime" id="endTime">
                             </td>
                             <td colspan="2"></td>
                          </tr> -->
                          <tr>
                             <td>
                                <label>상품 설명</label>
                             </td>
                             <td colspan="6">
                                <textarea cols="70" rows="23" name="info" id="info" placeholder="상품설명을 입력하세요"></textarea>
                             </td>
                          </tr>
                          
                       </table>
                  
                  </div>
                     <div id="PIfooter">
                        <div id="PIBtns">
                           <div id="PIInsertBtn">등록하기</div>
                           <div id="PIResetBtn">취소하기</div>
                        </div>
                     </div>
               </form>
              
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
         /* select 태그에서 기타를 선택시 input태그 생성 */
         $("#PIManagerSelect").change(function() {
            var $td = $("#manager");
            var $input = $("<input type='text' name='etc' id='etc'>");
            
            $("#PIManagerSelect option:selected").each(function() {
               var selectedManager = $("#PIManagerSelect option:selected").val();
               //console.log(selectedManager);
               if(selectedManager=="기타"){
                  $td.append($input);
               }
            });
         });
         $("#productAmount").change(function(){
            var $td = $("#amount");
            var $input = $("<input type='number' name='proAmount' id='proAmount'>");
            $("#productAmount").each(function(){
               var result = $("#productAmount").val();
               if(result=="기타"){
                  $td.append($input);
               }
                  //console.log(typeof(result));
            });
            
         });
         
         
        
         $("#PIInsertBtn").click(function(){
            /* var a = $("#PICategorySelect").val();
            var b = $("#PIManagerSelect").val(); */
            //console.log(a);
            //console.log(b);
            
            $("#insertPro").submit();
            
           
            /* 서블릿을 통해 전체상품의 수량을 증가 시켜준다. */
            /* 
            var startTime = document.getElementById("startTime").value;
               console.log(startTime);
               console.log("startTime : " + typeof(startTime));
            var endTime = document.getElementById("endTime").value;
               console.log(startTime);
               console.log("startTime : " + typeof(startTime)); */
              /* submit, reset */
         });
         $("#PIResetBtn").click(function(){
            location.href="<%=request.getContextPath()%>/selectProList.pr";
         });
         $("#proResBtn").click(function(){
        	 location.href="<%=request.getContextPath()%>/views/company/c_productReservation.jsp";
         });
         $("#productUploadBtn").click(function(){
             //상품등록하기 버튼을 눌렀을 때 작동할 함수
             //c_ProductUpload.jsp로 페이지 이동해주기
             location.href="<%=request.getContextPath()%>/views/company/c_ProductInsert.jsp";
          }); 
      });

   </script>
</body>
</html>
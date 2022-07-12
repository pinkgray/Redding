<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.redding.member.model.vo.Member, com.kh.redding.product.model.vo.*"%>
<%
   Member loginUser = (Member) session.getAttribute("loginUser");
   UseProduct upro = (UseProduct) request.getAttribute("upro");
   /* UseProduct upro2 = (UseProduct) request.getAttribute("upro2"); */

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
   href="${pageContext.request.contextPath}/css/company/c_useProductDetail.css"> 
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
               <form action="<%=request.getContextPath() %>/uproUpdate.pr" method="post" id ="updateUpro">
                     
                  <div id="PIHeader">
                     <h3>제품상세 페이지</h3>
                  </div>
                  <div id="PISection">
                       <table id="PITable">
                          <tr>
                             <th width="10%">예약가능날짜</th>
                             <th width="10%">예약시작시간</th>
                             <th width="10%">예약종료시간</th>
                             <th width="20%">수량</th>
                             <th width="20%">판매상태</th>
                          </tr>
                          <tr>
                             <td>
                                <input type="text" name="useDate" id="useDate" value="<%=upro.getUseDate()%>" readonly>
                                <input type="hidden" name="upno" id="upno" value="<%=upro.getUpNo()%>">
                             </td>
                             <td>
                                <input type="text" name="uproStartTime" id="uproStartTime" value="<%=upro.getUseStartTime()%>" readonly>
                             </td>
                             <td>
                                <input type="text" name="uproEndTime" id="uproEndTime" value="<%=upro.getUseEndTime()%>" readonly>
                             </td>
                             <td>
                                <input type="number" name="uproNum" id="uproNum" value="<%=upro.getuNum()%>">
                                
                             </td>
                             <td>
                                <input type="radio" name="uproStatus" id="uproStatusYes" value="Y">
                                <label for="uproStatusYes">판매함</label>
                                <input type="radio" name="uproStatus" id="uproStatusNo" value="N">
                                <label for="uproStatusNo">판매안함</label>
                             </td>
                          </tr>
                      </table>
                  
                  </div>
                     <div id="PIfooter">
                        <div id="PIBtns">
                           <div id="PIInsertBtn">수정하기</div>
                           <div id="PIResetBtn">이전으로</div>
                        </div>
                     </div>
               </form>
               <div id="selectArea">
               
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
           var uStatus = '<%=upro.getUstatus()%>';
           
         $("input[name=uproStatus]").each(function(){
            var uproStatus = $(this).val();
           
            if(uproStatus==uStatus){
               $(this).attr("checked",true);
            }
         });
         
         $("#PIInsertBtn").click(function(){
            $("#updateUpro").submit();
            
           
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            <%-- var upno = '<%=upro.getUpNo()%>';
            var unum = $("#uproNum").val();
            var ustatus = $("input[name=uproStatus]:checked").val();
            
            //console.log(ustatus);
            $.ajax({
               url:"uproUpdate.pr",
               type:"post",
               data:{upno:upno,unum:unum,ustatus:ustatus},
               success:function(data){
                  
                  
                  $("#uproNum").val(data[key].unum);
                  
                  $("input[name=uproStatus]:checked").val(data[key].ustatus);
                  
               }
                  
            });
           alert("수정이 완료되었습니다.");
           location.href="<%=request.getContextPath()%>/proDetail.pr?pno="+<%=upro.getpNo()%>; --%>
         });
         
         $("#PIResetBtn").click(function(){
            location.href="<%=request.getContextPath()%>/proDetail.pr?pno="+<%=upro.getpNo()%>;
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.redding.message.model.vo.*"%>
<%
	Message mes = (Message)request.getAttribute("mes");
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
   href="${pageContext.request.contextPath}/css/company/c_detailMessage.css"> 
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
      <%@include file="/views/company/c_nav.jsp"%>
   </div>

   <div class="container-fluid text-center">
      <div class="row content">
      
         <div class="col-sm-2 sidenav1 visible-md visible-lg visible-sm">
            <button id="sendMessageBtn" onclick="location.href='<%=request.getContextPath()%>/views/company/c_sendMessage.jsp'">쪽지 보내기</button><br><br>
            <button id="receiveListMessageBtn" onclick="location.href='<%=request.getContextPath()%>/views/company/c_messageManager.jsp'">전체 쪽지</button><br><br>
            <button id="receiveListMessageBtn" onclick="location.href='<%=request.getContextPath()%>/views/company/c_receiveListMessage.jsp'">받은 쪽지</button><br><br>
            <button id="sendListMessageBtn" onclick="location.href='<%=request.getContextPath()%>/views/company/c_sendListMessage.jsp'">보낸 쪽지</button><br><br>
            
         </div>
         
         
         <div class="col-sm-8 text-left">
         <%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
         
            <div class="contentsArea" id="sendMessageArea">
               <div id="SMHeader">
                  <h3>보낸 쪽지 확인</h3>
               </div>
               <div id="SMSection">
                  <form method="post" id="sendMessage">
                        <div id="messageContentArea">
                           <textarea name="messageContent" id="messageContent" style="resize:none;" placeholder="쪽지 내용을 입력해주세요." readonly><%=mes.getMesContent()%></textarea>
                           <input type="hidden" name="cno" value="<%=loginUser.getMno()%>">
                        </div>
                        <div id="btnsArea">
                              <span id="reset">이전으로</span>
                        </div>
                           
                  </form>
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
         $("#reset").click(function(){
            location.href="<%=request.getContextPath()%>/views/company/c_messageManager.jsp";
         });
         
      });

   </script>
</body>
</html>
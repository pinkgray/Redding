<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.redding.product.model.vo.*"%>
<%   
         
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REDDING♥</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">	
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
   rel="stylesheet">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/common/footer.css">
  <%--  <link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/common/c_productReservation.css"> --%>
   
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/company/c_main.css"> 

<style>
   .row.content {
   height: auto;
   
   }

   .sidenav1 {
      padding-top: 20px;
      height: 100%;
   }
   
   #productUploadBtn, #proResBtn{
    width: 140px;
    height: 35px;
    font-size: 22px;
    background: salmon;
    color: white;
    border: 2px double salmon;
    text-align: center;
    border-radius: 5px;
    cursor: pointer;
    margin-right: auto;
    margin-left: auto;
}
#productUploadBtn:hover, #proResBtn:hover{
	 background: white;
   color: salmon;
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
   <!-- 상품관리페이지 -->
   <div>
      <jsp:include page="/views/company/c_nav.jsp"></jsp:include>
   </div>

   <div class="container-fluid text-center">
      <div class="row content">
      
         <<!-- div class="col-sm-2 sidenav1 visible-md visible-lg visible-sm">
            <div id="productUploadBtn">상품 등록</div><br><br>
            <div id="proResBtn">예약 현황</div>
         </div> -->
         <div class="col-sm-2 sidenav1 visible-md visible-lg visible-sm">
				<div id="productUploadBtn">상품 등록</div>
				<br><br>
				<div id="proResBtn">예약 현황</div>
			</div>
         
         
         
         <div class="col-sm-10 text-left">
         <%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
            <div class="contentsArea" id="productListContentsArea" style="width:100%">
               <!-- 상품목록 밑의 전체~ 상품등록하기 버튼까지 -->
 				 <h2>예약 현황</h2>
             		 <jsp:include page="../common/calendar.jsp"></jsp:include>
					 <%-- <%@ include file="../common/calendar.jsp" %> --%>


                    </div>
                    <br><br>
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
    	  $("#productUploadBtn").click(function(){
              //상품등록하기 버튼을 눌렀을 때 작동할 함수
              //c_ProductUpload.jsp로 페이지 이동해주기
              location.href="<%=request.getContextPath()%>/views/company/c_ProductInsert.jsp";
           });   
		
      });
   </script>
</body>
</html>
   
   
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.*, com.kh.redding.company.model.vo.*, com.kh.redding.attachment.model.vo.*, com.kh.redding.product.model.vo.*, java.util.*"%>
<%
	int cno = Integer.parseInt(request.getParameter("cno"));
	/*ArrayList<HashMap<String, Object>> blist = (ArrayList<HashMap<String, Object>>) request.getAttribute("blist");
	HashMap<String, Object> list = blist.get(blist.size()-1);
	ArrayList<Product> prolist = (ArrayList<Product>)list.get("Product");
	ArrayList<Attachment> attachlist = (ArrayList<Attachment>)list.get("Attachment");
	Company com = (Company)list.get("Company");
	Member mem = (Member)list.get("Member");
	String companyAddress = "";
	Product pro = null;
	int cno = (int) session.getAttribute("cno");
	M_ComQnaListPageInfo cqlpi = (M_ComQnaListPageInfo) request.getAttribute("cqlpi");
	int currentPage = cqlpi.getCurrentPage();
	int maxPage = cqlpi.getMaxPage();
	int startPage = cqlpi.getStartPage();
	int endPage = cqlpi.getEndPage(); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REDDING♥</title>
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
   href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/common/footer.css">

<style>
.container {
   color: salmon;
   width: 100%;
   argin-left: auto;
   margin-right: auto;
   text-align: center;
   font-family: 'Noto Sans KR', sans-serif;
}

.row.content {
   height: 450px;
}

.sidenav {
   height: 100%;
}

.productlist {
   margin-left: auto;
   margin-right: auto;
   text-align: center;
   font-size: 30px;
   border: 1px solid salmon;
}

table {
   border-collapse: collapse;
   width: 100%;
}

/* td {
   border: 1px solid salmon;
} */

.result {
   text-align: center;
   color: salmon;
}

/* On small screens, set height to 'auto' for sidenav and grid */
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
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
   <!-- 멤버 헤더 (미니메뉴, 로고) -->
   <div class="headerArea">
   </div>
   	  <%@ include file="/views/member/m_header.jsp" %>
   <br>

   <!-- 멤버 나브 -->
   <div>
      <jsp:include page="/views/member/m_nav.jsp"></jsp:include>
   </div>

   <!-- 섹션 -->
   <div class="container-fluid text-center">
      <div class="row content">

         <!-- 왼쪽 빈공간 -->
         <div class="col-sm-1 sidenav"></div>

         <div class="col-sm-10 text-left">
            <%---------------------------------------------------------------------------------------------------------------%>
            <br>
            <form action="<%=request.getContextPath() %>/comQnaWrite.qw" method="post">
            <h1>문의 작성</h1><br>
            	<input type="text" class="form-control" name="title" placeholder="제목을 입력해 주세요"><br>
            	<input type="hidden" name="cno" value="<%=cno%>">
            	<textArea name="contents" class="form-control" rows="20" placeholder="내용을 입력해 주세요"></textArea><br>
            	<button type="submit" class="btn btn-outline-danger">작성하기</button>	
            </form>
            
            <%---------------------------------------------------------------------------------------------------------------%>
         </div>

         <!-- 오른쪽 빈공간 -->
         <div class="col-sm-1 sidenav"></div>

      </div>
	</div>
   </div>
   <br>

   <!-- 커먼 풋터 -->
   <div class="footerArea">
      <jsp:include page="/views/common/footer.jsp"></jsp:include>
   </div>

</body>
</html>
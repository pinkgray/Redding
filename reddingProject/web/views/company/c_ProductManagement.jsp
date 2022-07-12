<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.redding.product.model.vo.*"%>
<%   
	/* HashMap<String, Object> hmap = (HashMap<String, Object>)request.getAttribute("hmap");
	ArrayList<Product> proList = (ArrayList<Product>)hmap.get("proList");
	PageInfo pi = (PageInfo) hmap.get("pi"); */
   ArrayList<Product> proList = (ArrayList<Product>) request.getAttribute("proList"); 
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   
   ProductCounts pcount = (ProductCounts) request.getAttribute("pcount");
   
      int currentPage = pi.getCurrentPage();
      int maxPage = pi.getMaxPage();
      int startPage = pi.getStartPage();
      int endPage = pi.getEndPage();
      int startRow = pi.getStartRow();
      int endRow = pi.getEndRow();
        int productTotalCount = pcount.getProductTotalCount();
        int SaleProductCount = pcount.getSaleProductCount();
        int NoSaleProductCount = pcount.getNoSaleProductCount();
         
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
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/company/c_main.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/company/c_ProductManagement.css">   
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
   <!-- 상품관리페이지 -->
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
            <div class="contentsArea" id="productListContentsArea">
               <!-- 상품목록 밑의 전체~ 상품등록하기 버튼까지 -->
               <div id="PMTotalArea">
	                  <div id="productListTitle">
	                        <h2>상품목록</h2>
	                     <div id="productListAll">
	                           <div id="productCountAllTb">
	                           <table id="productCountAll">
	                              <tr>
	                                 <td>
	                                    <label>전체 : </label>
	                                    <input type="text" name="productTotalCount" value="<%=productTotalCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
	                                    <label>|</label>&nbsp;&nbsp;&nbsp;
	                                 </td>
	                                 <td>
	                                    <label>판매함 : </label>
	                                    <input type="text" name="SaleProductCount" value="<%=SaleProductCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
	                                    <label>|</label>&nbsp;&nbsp;&nbsp;
	                                 </td>
	                                 <td>
	                                    <label>판매 안함 : </label>
	                                    <input type="text" name="NoSaleProductCount" value="<%=NoSaleProductCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
	                                    <label>|</label>&nbsp;&nbsp;&nbsp;
	                                 </td><%-- 
	                                 <td>
	                                    <label>공개함 : </label>
	                                    <input type="text" name="OpenProductCount" value="<%=OpenProductCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
	                                    <label>|</label>&nbsp;&nbsp;&nbsp;
	                                 </td>
	                                 <td>
	                                    <label>공개 안함 : </label>
	                                    <input type="text" name="CloseProductCount" value="<%=CloseProductCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
	                                    &nbsp;&nbsp;&nbsp;
	                                 </td> --%>
	                              </tr>
	                           </table>
	                        </div>
	                     </div>
	                  </div>
               
               <!-- 검색분류테이블 -->
		               <div id="productSearchTBArea">
		                     <form id="productSearch" method="post" action="searchPro.pr">
		                       <table id="productSearchTB">
		                          <tr>
		                             <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>                        
		                             <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		                          </tr>
		                          <tr>
		                             <td>
		                                <label>상품명 검색</label>
		                             </td>
		                             <td><!-- 
		                                <label></label>
		                             </td>
		                             <td>
		                                <select>                              
		                                   <option>상품명</option>
		                                   <option>기간</option>
		                                </select> -->
		                                <input type="search" name="productSearchForName" id="productSearchForName" placeholder="상품명을 입력해주세요 ex>리허설-본식">
		                             </td>
		                          </tr>
		                          <tr>
		                             <td>
		                                <label>상품 구분</label>
		                             </td>
		                             <td>
		                                <input type="radio" name="productSearchAbountSale" id="productSearchAllAboutSale" value="sale">
		                                <label for="productSearchAllAboutSale">전체 상품</label>
		                                <input type="radio" name="productSearchAbountSale" id="productSearchSale" value="판매">
		                                <label for="productSearchSale">판매 상품</label>
		                                <input type="radio" name="productSearchAbountSale" id="productSearchNoSale" value="판매안함">
		                                <label for="productSearchNoSale">판매하지 않는 상품</label>
		                             </td>
		                          </tr><!-- 
		                          <tr>
		                             <td>
		                                <label>상품 등록일</label>
		                             </td>
		                             <td>
		                                <input type="radio" name="productSearchAboutTerm" id="productSearchToday" value="today">
		                                <label for="productSearchToday">오늘</label>
		                                <input type="radio" name="productSearchAboutTerm" id="productSearchOneWeek" value="week">
		                                <label for="productSearchOneWeek">일주일이내</label>
		                                <input type="radio" name="productSearchAboutTerm" id="productSearchOneMonth" value="month">
		                                <label for="productSearchOneMonth">1개월이내</label>
		                                <input type="radio" name="productSearchAboutTerm" id="productSearchDays" value="days">
		                                <label for="productSearchDays">기간선택</label>
		                                <br>
		                                <input type="date" name="startDate" class="Day">
		                                <label> ~ </label>
		                                <input type="date" name="endDate"class="Day">
		                             </td>
		                          </tr> -->
		                          <tr>
		                             <td colspan="2">
		                             <br>
		                                <div id="searchBtn">검색하기</div>
		                             </td>
		                          </tr>
		                       </table>
		                     </form>
		               </div>
		               <br><br>
               
               <!-- 조회결과물 보여주는 목록 -->
               <!-- 페이징 처리 해야 함 -->
               		<div>
               			<table align="center" id="productSearchResulTB">
		                     <tr>
		                        <th width="3%"></th>
		                        <th width="5%">No.</th>
		                        <th width="15%">상품명</th>
		                        <th width="10%">가격(원)</th>
		                        <th width="15%">상품등록일</th>
		                        <th width="15%">상품수정일</th>
		                        <th width="10%">판매 여부</th>
		                        <th width="10%"></th>
		                     </tr>
		                     
		                     <% for(Product pro : proList){ %>
		                        <tr>
		                        <!-- ajax로 행 처리하기 처리할때 아래와 같이 체크박스와 버튼 도 같이 나와야 한다. -->
		                           <td><input type="checkbox" name="proCheck" id="proCheck"></td>
		                           <td>
		                                <input type="number" name="startRows" id="startRows" value="<%=startRow %>" readonly>
		                              <input type="hidden" name="proNum" id="proNum" value="<%=pro.getpNo() %>">
		                           </td>
		                           <td><%=pro.getpName() %></td>
		                           <td><%=pro.getPrice() %></td>
		                           <td><%=pro.getpEnrollDate() %></td>
		                           <%if(pro.getpModifyDate() == null){ %>
		                                 <td>-</td>
		                           <%}else{ %>
		                              <td><%=pro.getpModifyDate() %></td>
		                                 
		                           <%} %>
		                           <td><%=pro.getProStatus() %></td>
		                           <td>
		                                 <div id="productDetailBtn" class="productDetail">상세보기</div>
		                           </td>
		                        </tr>
		                        <%                        
		                           startRow = startRow+1;
		                           %>
		                     <% } %>
		                     <tr>
		                        <td colspan="8">
		                           <div id="sellStatusBtns">
		                           <br>
		                              <div id="productSellYesBtn">판매하기</div>
		                              <div id="productSellNoBtn">판매취소</div>
		                           </div>
		                        </td>
		                     </tr>
		                  </table>
		                  <div class="paginArea" align = "center">
				               <button onclick="location.href='<%=request.getContextPath()%>/selectProList.pr?currentPage=1'"> << </button>
				               <%if(currentPage<=1){ %>         
				                  <button disabled> < </button>
				               <%} else{%>
				                  <button onclick="location.href='<%=request.getContextPath() %>/selectProList.pr?currentPage=<%=currentPage - 1 %>'"> < </button>
				               <%} %>
				               
				               
				               <%for(int p=startPage ; p<=endPage ; p++){ 
				                  if(p == currentPage){%>
				                     <button disabled> <%=p %> </button>
				                  <%}else{ %>
				                     <button onclick="location.href='<%=request.getContextPath()%>/selectProList.pr?currentPage=<%=p%>'"> <%=p %> </button>
				                  <%} %>
				               
				               <%} %>
				               
				               
				               <%if(currentPage >= maxPage){ %>
				                  <button disabled> > </button>
				               <%}else{ %>
				                  <button onclick="location.href='<%=request.getContextPath()%>/selectProList.pr?currentPage=<%=currentPage + 1%>'"> > </button>
				               <%} %>         
				               
				               <button onclick="location.href='<%=request.getContextPath()%>/selectProList.pr?currentPage=<%=maxPage%>'"> >> </button>
			         
			         
			            	</div>
			           </div>
            </div>
         
         </div>
         <br><br> <br><br> <br><br> <br><br> <br><br> <br><br> <br>
         
         <div class="col-sm-2 sidenav2"></div>
      </div>
   </div>
   
   <!-- 커먼 풋터 -->
   <div class="footerArea">
      <jsp:include page="/views/common/footer.jsp"></jsp:include>
   </div>
   <script>
      $(function(){
         $("input[name=productSearchAboutTerm]").click(function(){
            $(".Day").attr("type","hidden");
            //console.log($(this).val());
         });
         $("#productSearchDays").click(function(){
            /* console.log($(this).val()); */
            $(".Day").attr("type","date");
         });
         
         
         $("#productDeleteBtn").click(function(){
            var result = window.confirm("정말 삭제 하시겠습니까?");
            if(result == true){
               alert("해당 상품이 삭제 되었습니다");
            }else{
               alert("삭제를 취소하셨습니다.");
            }
         });
         $("#searchBtn").click(function(){
        	 var proName = $("input[name=productSearchForName]").val();
             /* console.log(proName); */
             var prostatus = $("input[name=productSearchAbountSale]:checked").val();
             /* console.log(prostatus); */
             
             if(proName==""){
            	 alert('상품명을 입력해주세요.');
             }else{
            	 if(prostatus){
            		 location.href="<%=request.getContextPath()%>/searchPro.pr?proName="+proName+"&prostatus="+prostatus;
            	 }else{
            		 alert('상품구분을 입력해주세요.');
            		 
            	 }
             }
         });
         
         
         $("#productSellYesBtn").click(function(){
             var pnoString = [];
             var status = "판매";
             $("input[name=proCheck]").each(function(){
                var pno = $(this).parent().parent().children().eq(1).children().eq(1).val();
                if($(this).is(":checked")){
                   pnoString += pno +",";
                   //console.log(pnoString);
                   location.href="<%=request.getContextPath()%>/proListStatus.pr?pnoString="+pnoString+"&status="+status;
                
                }    
             });
          });
         $("#productSellNoBtn").click(function(){
             var pnoString = [];
             var status = "판매안함";
             $("input[name=proCheck]").each(function(){
                var pno = $(this).parent().parent().children().eq(1).children().eq(1).val();
                if($(this).is(":checked")){
                   pnoString += pno +",";
                   //console.log(pnoString);
                   location.href="<%=request.getContextPath()%>/proListStatus.pr?pnoString="+pnoString+"&status="+status;
                
                }    
             });
          });
         
         $(".productDetail").click(function(){
             //결과 조회 목록에서 버튼 클릭시 페이지 이동
             //상세보기 페이지 갓다가 -> 수정페이지 혹은 삭제페이지로 이동하자
             var pNo = $(this).parent().parent().children().eq(1).children().eq(1).val();
             //console.log("pno: " + pNo);
             /* pNo = Number(pNo);
             console.log("typeof(pno) : " + typeof(pNo)); */
             
             
             location.href="<%=request.getContextPath()%>/proDetail.pr?pno="+pNo;
          });
         
         $("#proResBtn").click(function(){
        	 location.href="<%=request.getContextPath()%>/views/company/c_productReservation.jsp";
         });
         $("#productUploadBtn").click(function(){
             //상품등록하기 버튼을 눌렀을 때 작동할 함수
             //c_ProductUpload.jsp로 페이지 이동해주기
             location.href="<%=request.getContextPath()%>/views/company/c_ProductInsert.jsp";
          });   
         <%-- $("#searchBtn").click(function(){
             
             
             var proName = $("input[name=productSearchForName]").val();
             console.log(proName);
             var prostatus = $("input[name=productSearchAbountSale]:checked").val();
             console.log(prostatus);
             
             $.ajax({
                url:"searchPro.pr",
                data:{proName:proName, prostatus:prostatus},
                type:"post",
                dataType:"json",
                success:function(data){
             	   
 					/* alert("성공");
 					alert(data); */
 					$tableBody = $("#productSearchResulTB tbody");
 					$tableBody.html('');
 					
 					/* ---------------------------------------------------------- */
 					var ctn = 1;
                   
 					var $tr1 = $("<tr>");
 					var $ckTh = $("<th width='3%'>");
 					var $startTh = $("<th width='3%'>").text("No.");
 					/* var $noTh = $("<th width='5%'>").text("pno."); */
 					var $nameTh = $("<th width='15%'>").text("상품명");
 					var $priceTh = $("<th width='10%'>").text("가격(원)");
 					var $penrollTh = $("<th width='15%'>").text("상품등록일");
 					var $pmodifyTh = $("<th width='15%'>").text("상품수정일");
 					var $pstatusTh = $("<th width='10%'>").text("판매여부");
 					var $btnTh = $("<th width='10%'>");
 					
 					/* for(var i=0 ; i<data.length ; i++){
 						
 						console.log(data.pNo);
 					}
 					 */
 					$tr1.append($ckTh);
 					$tr1.append($startTh);
 					$tr1.append($nameTh);
 					$tr1.append($priceTh);
 					$tr1.append($penrollTh);
 					$tr1.append($pmodifyTh);
 					$tr1.append($pstatusTh);
 					$tr1.append($btnTh);
 					
 					$tableBody.append($tr1);
 					
 					/* var pno=0; */
 					
 					$.each(data,function(index, value){
 					   
 						var $tr = $("<tr>");
 						      
 						var $ckTd = $("<td>");
 						var $ckIn = $("<input type='checkbox' name='proCheck' id='proCheck'>");
 						
 						var $startTd = $("<td>");
 						var $startIn = $("<input type='number' name='startRows' id='startRows' readonly>");
 						$startIn.val(ctn); 
 						
 						
 						var $noIn = $("<input type='hidden' name='proNum' id='proNum'>").val(value.pNo);
 						console.log($noIn.val());
 						console.log("===================")
 						
 						var $nameTd = $("<td>").text(value.pName);
 						
 						var $priceTd = $("<td>").text(value.price);
 						
 						/* console.log(typeof(value.pEnrollDate)); */
 						
 						var $penrollDateTd = $("<td>").text(value.pEnrollDate);
 						
 						var $pmodifyDateTd = $("<td>").text(value.pModifyDate);
 						
 						var $proStatusTd = $("<td>").text(value.proStatus);
 						
 						var $btnTd = $("<td>");
 						var $btnIn = $("<div id='productDetailBtn' class='productDetail'>상세보기</div>");
 						
 						$btnTd.append($btnIn);
 						$startTd.append($noIn);
 						$startTd.append($startIn);
 						$ckTd.append($ckIn);
 						      
 						     
 						$tr.append($ckTd);
 						$tr.append($startTd);
 						$tr.append($nameTd);
 						$tr.append($priceTd);
 						$tr.append($penrollDateTd);
 						$tr.append($pmodifyDateTd);
 						$tr.append($proStatusTd);
 						$tr.append($btnTd);
 						
 						$tableBody.append($tr);
 						
 						$(".productDetail").click(function(){
 							
 							var pno = $(this).parent().parent().children().eq(1).children().eq(0).val();
 							console.log(pno);
 							/* pno = $(this).parent().parent().children().eq(1).children().eq(0).val();
 							console.log(pno); */
 							location.href="<%=request.getContextPath()%>/proDetail.pr?pno="+pno;
 						});
 						ctn = ctn + 1;
 						
 						var $lastTr = $("<tr>");
 						var $lastTd = $("<td colspan='8'>");
 						var $yesDiv = $("<div class='productSellYesBtn'>판매하기");
 						var $noDiv = $("<div class='productSellNoBtn'>판매취소");
 						
 						$yesDiv.append($noDiv);
 						$lastTd.append($yesDiv);
 						$lastTr.append($lastTd);
 						$tableBody.append($lastTr);
 						
 					});
                },
                error:function(data){
                   alert("실패");
                }
             });
             
          }); --%>
		
      });
   </script>
</body>
</html>
   
   
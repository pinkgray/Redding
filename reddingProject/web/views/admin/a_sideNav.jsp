<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.redding.member.model.vo.*"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REDDING♥</title>


<style>
	
	
	
	.main-content{
		height:0;
	}

@import url('https://fonts.googleapis.com/css?family=Open+Sans:400,700');
html {

 /*  background-color: #ff3333; */
}

body {
  font: 14px/1.5 Arial, Helvetica, sans-serif;
  padding: 0;
  margin: 0;
}

.menu {
  text-align: center;
  padding-top: 25px;
  margin-bottom: 200px;
}

.menu .arrow {
  opacity: 0.4;
}

.arrow.up,
.arrow.down {
  display: none;
  margin: 20px 0;
}

.menu h1 {
  margin-top: 0;
  font: normal 32px/1.5 'Open Sans', sans-serif;
  color: #3F71AE;
  padding-bottom: 16px;
}

.menu h2 {
  color: #F05283;
}

.menu h2 a {
  color: inherit;
  text-decoration: none;
  display: inline-block;
  border: 1px solid #F05283;
  padding: 10px 15px;
  border-radius: 3px;
  font: bold 14px/1 'Open Sans', sans-serif;
  text-transform: uppercase;
}

.menu h2 a:hover {
  background-color: #F05283;
  transition: 0.2s;
  color: #fff;
}

.menu ul {
  max-width: 600px;
  margin: 60px auto 0;
}

.menu ul a {
  text-decoration: none;
  color: #FFF;
  text-align: left;
  background-color: #B9C1CA;
  padding: 10px 16px;
  border-radius: 2px;
  opacity: 0.8;
  font-size: 16px;
  display: inline-block;
  margin: 4px;
  line-height: 1;
  outline: none;
  transition: 0.2s ease;
}

.menu ul li a.active {
  background-color: #66B650;
  pointer-events: none;
}

.menu ul li a:hover {
  opacity: 1;
}

.menu ul {
  list-style: none;
  padding: 0;
}

.menu ul li {
  display: inline-block;
}

@media (max-height:800px) {}

@media (max-width: 900px) {
  .menu {
    padding-top: 40px;
    margin-bottom: 80px;
  }
  .arrow.left,
  .arrow.right {
    display: none;
  }
  .arrow.up,
  .arrow.down {
    display: inline-block;
  }
}
/* -- Demo ads -- */

@media (max-width: 1200px) {
  #bsaHolder {
    display: none;
  }
}
/* -- Link to Tutorialzine -- */

.tz-link {
  text-decoration: none;
  color: #fff !important;
  font: bold 36px Arial, Helvetica, sans-serif !important;
}

.tz-link span {
  color: #da431c;
}

/* The main content */
.main-content {
  font-family: Arial, Helvetica, sans-serif;
  max-width: 600px;
  padding-top: 40px;
  margin: 0 0 40px 260px;
}
/* The left-collapsing sidebar */

.sidebar-left-collapse {
  font-family: Arial, Helvetica, sans-serif;
  position: fixed;
  top: 0;
  left: 0;
  background-color:salmon;  /* #292c2f */
  width: 180px;
  height: 100%;
  padding: 20px 0;
}

.sidebar-left-collapse > a {
  display: block;
  text-decoration: none;
  font-family: Cookie, cursive;
  width: 122px;
  height: 122px;
  margin: 0 auto;
  text-align: center;
  color: #ffffff;
  font-size: 44px;
  font-weight: normal;
  line-height: 2.6;
  border-radius: 50%;
  background-color: #181a1b;
}

.sidebar-left-collapse .sidebar-links {
  margin: 30px auto;
}

.sidebar-links div > a {
  display: block;
  text-decoration: none;
  margin: 0 auto 5px auto;
  padding: 10px 0 10px 5px;
  background-color: white;   /* #35393e */
  text-align: left;
  color: salmon;                    /* #b3bcc5 */
  font-size: 12px;
  font-weight: bold;
  line-height: 2;
  border-left-width: 2px;
  border-left-style: solid;
}

.sidebar-links div.selected > a {
  background-color: #ffffff;
  color: #565d63;
  line-height: 2.3;
  margin: 0;
}

.sidebar-links div > a i.fa {
  position: relative;
  font-size: 20px;
  top: 3px;
  width: 40px;
  text-align: center;
}

.sidebar-links div ul.sub-links {
  max-height: 0;
  overflow: hidden;
  list-style: none;
  padding: 0 0 0 30px;
  color: #b3bcc5;
  font-size: 12px;
  font-weight: bold;
  line-height: 24px;
  margin: 0;
  transition: 0.4s;
}

.sidebar-links div.selected ul.sub-links {
  max-height: 150px;
  padding: 12px 0 12px 30px;
}

.sidebar-links div .sub-links a {
  text-decoration: none;
  color: #b3bcc5;
  display: block;
  text-align: left;
}
/* Link Colors */

.sidebar-links div.link-blue > a {
  border-color: #487db2;
}

.sidebar-links div.link-blue > a i.fa {
  color: #487db2;
}

.sidebar-links div.link-red > a {
  border-color: #da4545;
}

.sidebar-links div.link-red > a i.fa {
  color: #da4545;
}

.sidebar-links div.link-yellow > a {
  border-color: #d0d237;
}

.sidebar-links div.link-yellow > a i.fa {
  color: #d0d237;
}

.sidebar-links div.link-green > a {
  border-color: #86be2e;
}

.sidebar-links div.link-green > a i.fa {
  color: #86be2e;
}
/* Making the sidebar responsive */

@media (max-width: 900px) {
  .main-content {
    max-width: none;
    padding: 70px 20px;
    margin: 0 0 40px;
  }
  .sidebar-left-collapse {
    width: auto;
    height: auto;
    position: static;
    padding: 20px 0 0;
  }
  .sidebar-left-collapse .sidebar-links {
    text-align: center;
    margin: 20px auto 0;
  }
  .sidebar-links div {
    display: inline-block;
    width: 100px;
  }
  .sidebar-links div > a {
    text-align: center;
    margin: 0;
    padding: 10px 0;
    border-left: none;
    border-top-width: 2px;
    border-top-style: solid;
  }
  .sidebar-links div > a i.fa {
    display: block;
    margin: 0 auto 5px;
  }
  .sidebar-links div ul.sub-links {
    display: none;
  }
  .sidebar-links div.selected .sub-links {
    display: block;
    position: absolute;
    text-align: center;
    width: auto;
    left: 0;
    right: 0;
  }
  .sidebar-links div.selected .sub-links li {
    display: inline-block;
  }
  .sidebar-links div.selected .sub-links a {
    display: inline-block;
    margin-right: 20px;
    font-size: 13px;
    color: #748290;
  }
}
/* Smartphone version */

@media (max-width: 450px) {
  .main-content {
    padding: 90px 20px;
  }
  .sidebar-left-collapse {
    padding: 20px 0;
  }
  .sidebar-left-collapse .sidebar-links {
    text-align: center;
    margin: 20px auto 0;
    position: relative;
  }
  .sidebar-links div {
    display: block;
    width: 240px;
    margin: 0 auto 5px;
  }
  .sidebar-links div > a {
    text-align: left;
    padding: 10px 25px;
    vertical-align: middle;
    border-top: none;
    border-left-width: 2px;
    border-left-style: solid;
  }
  .sidebar-links div > a i.fa {
    display: inline-block;
    font-size: 20px;
    width: 20px;
    margin: 0 20px 0 0;
  }
  .sidebar-links div.selected .sub-links {
    bottom: -90px;
  }
}
/*	Removing margins and paddings from the body, so that
    the sidebar takes the full height of the page */

body {
  margin: 0;
  padding: 0;
}

.footer{

    position:unset;

    bottom:0;

    width:100%;

    height:140px;   

	}
body{
      font-family: 'Noto Sans KR', sans-serif;
   }
   .sidebar-links div .sub-links a{
   	color:white !important;
   }
   
   .selected > a{
   	color:salmon !important;
   }
   
   
</style>
</head>
<body>


<aside class="sidebar-left-collapse">
  <a href="#" class="company-logo" onclick="location.href='<%=request.getContextPath()%>'">
   <img src = "<%=request.getContextPath()%>/images/logo.png" style="max-width:100%; background:salmon"> 
  </a>
  <div class="sidebar-links">
    <div class="link-blue selected">
      <a href="#">
        <i class="fa fa-picture-o"></i>통계관리
      </a>
      <ul class="sub-links">
        <li><a href="#" onclick="location.href='<%=request.getContextPath()%>/views/admin/a_Sstats.jsp'">회원통계</a></li>
        <li><a href="#" onclick="location.href='<%=request.getContextPath()%>/views/admin/a_Mstats.jsp'">업체통계</a></li>
        <li><a href="#" onclick="location.href='<%=request.getContextPath()%>/views/admin/a_Pstats.jsp'">매출통계</a></li>        
      </ul>
    </div>

    <div class="link-red">
      <a href="#">
        <i class="fa fa-heart-o"></i>정산관리
      </a>

      <ul class="sub-links">
        <li><a href="#" onclick="showCalc()">회원 정산</a></li>
        <li><a href="#" id="memRefund">회원 환불 정산</a></li>
        <li><a href="#" id="comCalc">업체 정산</a></li>
      </ul>
    </div>

    <div class="link-yellow">
      <a href="#">
        <i class="fa fa-keyboard-o"></i>업체관리
      </a>

      <ul class="sub-links">
        <li><a href="#" onclick="goTotalCompany()">업체 목록</a></li>
        <li><a href="#" onclick="location.href='<%=request.getContextPath()%>/views/admin/a_Message.jsp'">받은 쪽지 관리</a></li>
        <li><a href="#" onclick="location.href='<%=request.getContextPath()%>/views/admin/a_SendMessage.jsp'">보낸 쪽지 관리</a></li>
      </ul>
    </div>

    <div class="link-green">
      <a href="#">
        <i class="fa fa-map-marker"></i>회원관리
      </a>

      <ul class="sub-links">
        <li><a href="#" onclick="goTotalMember()">전체 회원</a></li>
        <li><a href="#"  onclick="location.href='<%=request.getContextPath() %>/AllQnA.no'">문의</a></li>
      </ul>
    </div>
    
    <div class="link-orange" >
      <a href="#" style="border-color:orange !important">
        <i class="fa fa-map-marker"></i>쿠폰관리
      </a>

      <ul class="sub-links">
        <li><a href="#" onclick="goCoupon()">쿠폰 생성</a></li>
      </ul>
    </div>
    
    <div class="link-black">
      <a href="#" style="border-color:pink !important">
        <i class="fa fa-map-marker"></i>고객센터
      </a>

      <ul class="sub-links">
        <li><a href="#" onclick= "location.href='<%=request.getContextPath() %>/selectnotice.no'">공지사항</a></li>
        <li><a href="#" onclick= "location.href='<%=request.getContextPath() %>/selectFAQ.no'">FAQ</a></li>
      </ul>
    </div>

  </div>

</aside>

<div class="main-content">
  <div class="menu">
  </div>
</div>











<script>

$(function () {
	var links = $('.sidebar-links > div');

  links.on('click', function () {
		links.removeClass('selected');
		$(this).addClass('selected');
	});
});

	$(".gg").click(function(){
		$(".sidebar-left-collapse").toggle();
	});
	
	function goTotalMember() {
		location.href="<%=request.getContextPath()%>/selectList.me";
	}
	function goTotalMember() {
		location.href="<%=request.getContextPath()%>/selectList.me";
	}
	function goTotalCompany() {
		location.href="<%=request.getContextPath()%>/selectList.co";
	}
	function goTotalMember() {
		location.href="<%=request.getContextPath()%>/selectList.me";
	}
	function goTotalMember() {
		location.href="<%=request.getContextPath()%>/selectList.me";
	}
	function goCoupon() {
		location.href="<%=request.getContextPath()%>/selectCouponList.ad";
	}
	function goTotalMember() {
		location.href="<%=request.getContextPath()%>/selectList.me";
	}
	function showCalc() {
		location.href="<%=request.getContextPath()%>/showCalc.ad";
	}
	
	function goNoticeMember(){
		location.href="<%=request.getContextPath()%>/.me";
	}
	
	//회원정산메뉴 클릭
	$("#memCalc").click(function(){
		 location.href="<%=request.getContextPath()%>/showCalc.ad"; 
		
	});
	
	//회원 환불 메뉴 클릭
	$("#memRefund").click(function(){
		location.href="<%=request.getContextPath()%>/showRefund.ad"; 
	});
	
	//업체 정산 메뉴 클릭
	$("#comCalc").click(function(){
		location.href="<%=request.getContextPath()%>/showComCalc.ad"; 
	});
	
</script>



</body>
</html>

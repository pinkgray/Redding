<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REDDING♥</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>

	<table class="memberNavTable">
		<tr>
			<td></td>
			<td><button class="navBtn" onclick="location.href='<%=request.getContextPath() %>/listcomtype.mb?comType=스튜디오'">STUDIO</button></td>
			<td><button class="navBtn" onclick="location.href='<%=request.getContextPath() %>/listcomtype.mb?comType=드레스'">DRESS</button></td>
			<td><button class="navBtn" onclick="location.href='<%=request.getContextPath() %>/listcomtype.mb?comType=메이크업'">MAKEUP&HAIR</button></td>
			<td><button class="navBtn" onclick="location.href='<%=request.getContextPath() %>/selectBoardList.bo'">COMMUNITY</button></td>
			<td><button class="navBtn" name="noticebtn" onclick="location.href='<%=request.getContextPath()%>/selectnotice.no'">공지사항</button></td>
			<td><button class="navBtn" name="noticebtn" onclick="location.href='<%=request.getContextPath() %>/selectFAQ.no'">FAQ</button></td>
			<td><button class="navBtn" name="noticebtn" onclick="location.href='<%=request.getContextPath() %>/views/notice/contact_main.jsp'">1대1 문의</button></td>
			<td></td>
		</tr>
	</table>
<%-- 	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
			
				<ul class="nav navbar-nav">
					<li><button class="navBtn" onclick="location.href='<%=request.getContextPath() %>/listcomtype.mb?comType=스튜디오'">&nbsp;&nbsp;&nbsp;STUDIO&nbsp;&nbsp;&nbsp;</button></li>
					<li><button class="navBtn" onclick="location.href='<%=request.getContextPath() %>/listcomtype.mb?comType=드레스'">&nbsp;&nbsp;&nbsp;DRESS&nbsp;&nbsp;&nbsp;</button></li>
					<li><button class="navBtn" onclick="location.href='<%=request.getContextPath() %>/listcomtype.mb?comType=메이크업'">&nbsp;&nbsp;&nbsp;MAKEUP&HAIR&nbsp;&nbsp;&nbsp;</button></li>
					<li><button class="navBtn" onclick="location.href='<%=request.getContextPath() %>/selectBoardList.bo'">&nbsp;&nbsp;&nbsp;COMMUNITY&nbsp;&nbsp;&nbsp;</button></li>
					<li><button class = "navBtn" id = "noticebtn">&nbsp;&nbsp;&nbsp;고객센터&nbsp;&nbsp;&nbsp;</button>
						<ul class="nav navbar-nav" id = "noticemenu">
							<li><button class = "navBtn" name = "noticebtn" onclick= "location.href='<%=request.getContextPath() %>/selectnotice.no'" >&nbsp;&nbsp;&nbsp;공지사항&nbsp;&nbsp;&nbsp;</button></li>
							<li><button class = "navBtn" name = "noticebtn"  onclick= "location.href='<%=request.getContextPath() %>/selectFAQ.no'">&nbsp;&nbsp;&nbsp;FAQ&nbsp;&nbsp;&nbsp;</button></li>
							<li><button class = "navBtn" name = "noticebtn"  onclick= "location.href='<%=request.getContextPath() %>/views/notice/contact_main.jsp'">&nbsp;&nbsp;&nbsp;1대1문의&nbsp;&nbsp;&nbsp;</button></li>
						</ul>
					</li>
				</ul>
				
			</div>
		</div>
	</nav> --%>
	<!-- <script>
		$(function(){
			$("#noticebtn").click(function(){
				var submenu = $("#noticemenu")
				if(submenu.is(":visible")){
					submenu.slideUp();
				}else{
					submenu.slideDown();
				}
			});
		});
	
	</script> -->
</body>
</html>


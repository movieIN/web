<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.MembershipVO"%>
<!DOCTYPE html>
<html>
<head>
	
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>MovieIn</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/jejugothic.css" />
<link href="reference/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="reference/css/shop-homepage.css" rel="stylesheet">
<style>

body {font-family: 'Jeju Gothic', sans-serif; }
#navbar {
width:150px;
}
#search-holder {
padding-left:10px;
padding-right:10px;
padding-top:5px;
padding-bottom:5px;
width:65px;
}
#search-btn {
background-color:gray;
}
#search {
padding:0px;
}
#setting {
width: 40%;
height: 80%;
padding-top: 50px;
padding-bottom: 50px;
}
.list-group-item-text{
margin-bottom: 0px;
}
.list-group-item-heading{
margin-bottom: 0px;
}
footer {
position: absolute;
bottom: 0;
left:0;
right:0;
}
</style>
<!-- <style>
		@media only screen and (max-width:992px){
			#recommend {
				display: none;
			}
		}
	</style> -->
<!-- Bootstrap core JavaScript -->
<script src="reference/vendor/jquery/jquery.min.js"></script>
<script src="reference/vendor/popper/popper.min.js"></script>
<script src="reference/vendor/bootstrap/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
$("#search-holder").focus(function(){ 
	$("#search-form").animate({ 
		"width": "200px" }, 300, function() {});
	}); 
$("#search-holder").blur(function(){ 
	$("#search-form").animate({ 
		"width": "60px" }, 300, function() {}); 
	}); 
$("#search-form").click(function(){ 
	$("#search-holder").focus();
}); 
})
</script>
</head>
<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">MovieIn</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
			<div class="col-lg-8">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">프로젝트
							둘러보기</a></li>
					<li class="nav-item"><a class="nav-link" href="#">프로젝트 올리기</a>
					</li>
					<!--  간격조정 어떻게 하는거야... -->
				</ul>
			</div>
			
			
			<div id="logOn-after" class="col-lg-2">
				<ul id="navbar" class="navbar-nav">
					<li id="logOn-login" class="nav-item active"><a
						class="nav-link" href="login.jsp">로그인 <span class="sr-only">(current)</span>
					</a></li>
					<li id="logOn-register" class="nav-item"><a class="nav-link"
						href="register.jsp">회원가입</a></li>
				</ul>
			
			
			
			 <%
						MembershipVO logOn = null;
						if (session.getAttribute("logOn") != null) {
							logOn = (MembershipVO) session.getAttribute("logOn");
					%>

						<div id="logOn-name" class="dropdown">
							<button style="background-color: gray" class="btn btn-primary dropdown-toggle" type="button"
								data-toggle="dropdown"><%=logOn.getName() + " 님"%>
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="./Member?action=investlist">나의 펀딩 현황</a></li>
								<li><a href="./Member?action=likelist">찜한 프로젝트</a></li>
								<li><a href="#">만든 프로젝트</a></li>
								<li class="dropdown-divider"></li> 
								<li><a href="mypage.jsp">정보 설정</a></li>
								<li><a href="./Member?action=logout">로그아웃</a></li>
							</ul>
						</div>
			
		
			<%
				}
			%>
			</div>
			<div id="search" class="col-lg-2">
        <form id="search-form" action="/register/project/search.jsp" method="get" class="navbar-form" role="search">
        <div class="input-group">
            <input id="search-holder" type="text" class="form-control" placeholder="Search" name="q">
            <div class="input-group-btn">
                <button id="search-btn" type="submit" class="btn btn-primary btn-sm">Search</button>
            </div>
        </div>
        </form>
    </div>
			</div>
		</div>
		
	</nav>
	<div id="setting" class="container">
	<P>My 정보 설정</P>
		<div class="card card-login mx-auto mt-5">
        	<div class="list-group">
        		<a href="mypage2.jsp" class="list-group-item">
        			기본 정보 설정
        		</a>
        		<a href="mypage3.jsp" class="list-group-item">
        			비밀번호 설정
        		</a>
        		<a href="mypage4.jsp" class="list-group-item">
        			회원탈퇴
        		</a>
        	</div>
		
	</div>
	</div>
		<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; 주식회사 2017</p>
		</div>
		<!-- /.container -->
	</footer>
	<%
		if (session.getAttribute("logOn") != null) {
	%>
	<script>
		$("#logOn-login").hide();
		$("#logOn-register").hide();
		/* $("#logOn-name").css("width", "100px");
		$("#logOn-after").css("width", "100px"); */
	</script>
	<%
		}
	%>
</body>
</html>
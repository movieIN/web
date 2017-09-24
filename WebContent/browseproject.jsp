<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="java.util.ArrayList" %>
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

/* Style the tab */
div.my-4 {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
div.my-4 button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
div.my-4 button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
div.my-4 button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}
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
form > div > label{
padding-left:5px;
padding-right:15px;

}
form > div > h4{
margin-bottom:15px;
font-size:1.1rem;
font-weight: bold;
}
hr{
margin-top: 10px; 
}
.form-group{
margin: 30px 5px 20px 5px;
padding:30px 10px 10px 30px;
border:1px solid gray;
border-radius:5px;
background-color:#f2f2f2;
}

.col-lg-6 .col-md-6{
margin-top:30px;
margin-bottom:0px;
}

div > div > h4 {
margin-bottom:15px;
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
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/register/index.jsp">MovieIn</a>
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
					<li class="nav-item"><a class="nav-link" href="/register/Project?action=insertProject">프로젝트 올리기</a>
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
								<li><a href="#">나의 펀딩 현황</a></li>
								<li><a href="#">찜한 프로젝트</a></li>
								<li><a href="#">만든 프로젝트</a></li>
								<li class="dropdown-divider"></li> 
								<li><a href="#">정보 설정</a></li>
								<li><a href="./Member?action=logout">로그아웃</a></li>
							</ul>
						</div>
			
		
			<%
				}
			%>
			</div>
			<div id="search" class="col-lg-2">
        <form id="search-form" class="navbar-form" role="search">
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

	<!-- Page Content -->
	<div class="container">
		<div class="row">
		<div class="col-lg-4">
			<form method="get" action="/register/Project">
				<input type="hidden" name="action" value="browseProject"/>
				<div class="form-group">
					<input type="radio" id="cnt desc" name="sorting" value="cnt desc" <%if (request.getParameter("sorting").equals("cnt desc")) {%>checked <% }%>/><label for="cnt desc">조회순</label>
					<input type="radio" id="enddate" name="sorting" value="enddate"<%if (request.getParameter("sorting").equals("enddate")) {%>checked <% }%>/><label for="enddate">마감임박순</label><br> 
					<input type="radio" id="writedate" name="sorting" value="writedate"<%if (request.getParameter("sorting").equals("writedate")) {%>checked <% }%>/><label for="writedate">최신순</label>
					<input type="radio" id="pna desc nulls last" name="sorting" value="pna desc nulls last"<%if (request.getParameter("sorting").equals("pna desc nulls last")) {%>checked <% }%>/><label for="pna desc nulls last">예상관객수순</label>
					<hr>
					
					<h4>투자 유형</h4>
					<input type="checkbox" name="inv_type" value="I" <%if (request.getAttribute("I") != null) {%> checked <%} %>><label for="I">투자형</label>
					<input type="checkbox" name="inv_type" value="R" <%if (request.getAttribute("R") != null) {%> checked <%} %>><label for="R">리워드형</label>
					<hr>
					
					<h4>장르</h4>
					<input type="checkbox" name="genre" value="드라마" <%if (request.getAttribute("드라마") != null) {%> checked <%} %>><label for="드라마">드라마</label>
					<input type="checkbox" name="genre" value="액션" <%if (request.getAttribute("액션") != null) {%> checked <%} %>><label for="액션">액션</label>
					<input type="checkbox" name="genre" value="애니메이션" <%if (request.getAttribute("애니메이션") != null) {%> checked <%} %>><label for="애니메이션">애니메이션</label>
					<br>
					<input type="checkbox" name="genre" value="코미디" <%if (request.getAttribute("코미디") != null) {%> checked <%} %>><label for="코미디">코미디</label>
					<input type="checkbox" name="genre" value="스릴러" <%if (request.getAttribute("스릴러") != null) {%> checked <%} %>><label for="스릴러">스릴러</label>
					<input type="checkbox" name="genre" value="어드벤처" <%if (request.getAttribute("어드벤처") != null) {%> checked <%} %>><label for="어드벤처">어드벤처</label>
					<br>
					<input type="checkbox" name="genre" value="멜로/로맨스" <%if (request.getAttribute("멜로/로맨스") != null) {%> checked <%} %>><label for="멜로/로맨스">멜로/로맨스</label>
					<input type="checkbox" name="genre" value="기타" <%if (request.getAttribute("기타") != null) {%> checked <%} %>><label for="기타">기타</label>
					<hr>
					
					<h4>프로젝트 유형</h4>
					<input type="checkbox" name="purpose" value="newMake" <%if (request.getAttribute("newMake") != null) {%> checked <%} %>><label for="newMake">제작</label>
					<input type="checkbox" name="purpose" value="import" <%if (request.getAttribute("import") != null) {%> checked <%} %>><label for="import">수입</label>
					<br>
					<input type="checkbox" name="purpose" value="reshow" <%if (request.getAttribute("reshow") != null) {%> checked <%} %>><label for="reshow">재상영</label>
					<input type="checkbox" name="purpose" value="marketing" <%if (request.getAttribute("marketing") != null) {%> checked <%} %>><label for="marketing">마케팅</label>
				<div class="form-row" style="margin-top:20px; margin-bottom:10px; padding-left:67%;">
				<input class="btn btn-primary" type="submit" value="결과보기">
				</div>
			</div>
			</form>
		</div>			
		
		<%ArrayList<FilterVO> filterList = (ArrayList<FilterVO>)request.getAttribute("filterList"); 
		%>
		<div class="col-lg-8">
		<!-- for문으로 프로젝트 카드 출력  -->
		<div class="row" style="margin-top:30px;">
			<%for (int i = 0; i < filterList.size(); ++i) {%>
			<div class="col-lg-6 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="<%="/register/img/" + filterList.get(i).getImgurl()%>" alt="안나옴?"></a>
					<div class="card-body">
						<h4 class="card-title">
						<a href="#"><%=filterList.get(i).getProj() %></a>
						</h4>
						<p class="card-text"></p>
					</div>
				</div>
			</div>
			<%} %>
			</div>
			
		</div>
		</div>
	</div>
	<!-- /.container -->

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
	<script>
	function openCity(evt, cityName) {
	    var i, tabcontent, tablinks;
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }
	    tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }
	    document.getElementById(cityName).style.display = "block";
	    evt.currentTarget.className += " active";
	}
	
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
	</script>


</body>

</html>





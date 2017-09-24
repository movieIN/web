<%@page import="model.FeedbackVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>MovieIn</title>
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/jejugothic.css" />
<!-- Bootstrap core CSS -->
<link href="/register/reference/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/register/reference/css/shop-homepage.css" rel="stylesheet">
<style>
html{
height:100%;
}
body {
margin:0px;
height:100%;
font-family: 'Jeju Gothic', sans-serif; 
}
.wrap {
min-height:100%;
position: relative;
}
footer{
bottom: 0;
left:0;
right:0;
}
p {
margin-top:20px;
margin-bottom:10px;
}
td{
border-bottom:1px solid gray;
padding:4px;
}
.pro-info{
	border: 1px solid #ccc;
	border-radius:5px;
    background-color: #f1f1f1;
    padding: 15px 20px;
    margin-top: 30px;
}
h6 {
	font-size:1.1rem;
	font-weight: bold;
	margin-bottom: 1.2rem
}
/* Style the tab */
div.my-4 {
    overflow: hidden;
    width: 800px;
    height: 50px;
}

/* Style the buttons inside the tab */
div.my-4 button {
    background-color: inherit;
    float: left;
    border: none;
    border-radius:5px;
    outline: none;
    cursor: pointer;
    padding: 14px 22px;
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
	width:100%;
    display: none;
    padding-left:30px;
    border-left: 1px solid #ccc;
    border-top: none;
    border-radius:5px;
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
.pro_img {
	margin-top:30px;
	max-width:100%;
	height:380px;
	border-radius:5px;
}
.project-page {
width: 90%;
margin: auto;
}


input[type="checkbox"] {
  display: none;
}

input[type="checkbox"] + label {
	position: absolute;
	z-index: 100;
	overflow: hidden;
	height: 4em;
	width: 4em;
	left: calc(50% - 3em);
	top: calc(50% - 3em);
	display: block;
	text-align: center;
	line-height: 95px;
	cursor: pointer;
	transition: all 300ms ease;
	border-radius: 70%;

}

input[type="checkbox"] + label:before {
	content: '';
	z-index: -1;
	position: absolute;
	background: rgb(220, 72, 127);
	width: 100%;
	height: 100%;
	border-radius: 50%;
	top: 0;
	left: 0;
	transform: scale(0);
	-webkit-ransform: scale(0);
}

input[type="checkbox"] + label:after {
	content: '';
	z-index: -1;
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	transform: scale(0);
	-webkit-transform: scale(0);
}

input[type="checkbox"]:checked + label svg {
	fill: rgb(220, 72, 127);
	transform: scale(1.2);
}
 

label svg {
	display: inline-flex;
	vertical-align: middle;
	width: 35px;
	fill: rgb(167, 167, 167);
}

@media all and (min-width:992px) and (max-width:1200px) {h6{font-size:1rem} h3{font-size:1.5rem}} 
</style>
<!-- <style>
		@media only screen and (max-width:992px){
			#recommend {
				display: none;
			}
		}
	</style> -->
<!-- Bootstrap core JavaScript -->
<script src="/register/reference/vendor/jquery/jquery.min.js"></script>
<script src="/register/reference/vendor/popper/popper.min.js"></script>
<script src="/register/reference/vendor/bootstrap/js/bootstrap.min.js"></script>
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
<div class="wrap">
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
						class="nav-link" href="/register/login.jsp">로그인 <span class="sr-only">(current)</span>
					</a></li>
					<li id="logOn-register" class="nav-item"><a class="nav-link"
						href="/register/register.jsp">회원가입</a></li>
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
								<li><a href="/register/Member?action=investlist">나의 펀딩 현황</a></li>
								<li><a href="/register/Member?action=likelist">찜한 프로젝트</a></li>
								<li><a href="#">만든 프로젝트</a></li>
								<li class="dropdown-divider"></li> 
								<li><a href="/register/mypage.jsp">정보 설정</a></li>
								<li><a href="/register/Member?action=logout">로그아웃</a></li>
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

	<!-- Page Content -->
	<div class="container">
			<%ProjectDAO dao = new ProjectDAO();
			ProjectVO project = (ProjectVO)request.getAttribute("project");
			int percent = 0;%>
		<div class="project-page">
			<div class="row">
			<div class="col-lg-9 col-md-9" style="flex:0 0 60%;margin-left:20px">
				<img class="pro_img" src="/register/img/<%=project.getImgurl() %>"  alt=""  >
			</div>
			<div id="recommend" class="col-lg-3 col-md-9" style="padding-bottom:20px;flex:0 0 40%;max-width:30%; margin-left:20px;">
				<div class="pro-info">
					<h3 style="font-weight:bold;margin-top:0.5rem;"><%=project.getProj()%></h3><br>
					<%percent = project.getM_collected() / (project.getM_target() / 100);%>
					
					<div class="progress">
  					<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" 
  					style="width:<%if (percent >= 100) {%>100% <% } else { %> <%=percent%><%}%>">
    				<p style="font-weight:bold"><%=percent%>% 달성</p>
  					</div>
					</div> 
					<% DecimalFormat myFormatter = new DecimalFormat("#,###");
					String m_target = myFormatter.format(project.getM_target());%>
					<p style="text-align:right; font-size:0.9rem; font-weight:bold; color:gray;">모집 목표 <%= m_target%>원</p> 
				<%String m_collected = myFormatter.format(project.getM_collected());%>
					<h6 style="margin-top:0.7rem"><%=m_collected %>원 모집완료</h6>
				<h6><%=dao.investorNumber(project.getSeq_PID()) %>명의 투자자</h6>
				<%if (dao.remainingDay(project.getSeq_PID()) > 0) {%>
				<h6><%=(int)dao.remainingDay(project.getSeq_PID()) %>일 남음</h6>
				<%} else {%><h6>모집 기간 종료</h6><%}%>
				<%if(project.getInv_type().equals("R")) {%>
						<h6><%="투자형" %> 모집</h6>
					<% } else {%>
						<h6><%="보상형" %> 모집</h6>
					<% }%>
				<%System.out.println("!!!!!" + logOn + dao.remainingDay(project.getSeq_PID())); %>
				<br>
				<div class="row">
				<div class="col-lg-10">
				<% if (dao.remainingDay(project.getSeq_PID()) > 0 ) { %> 
					<input style="width:95%" class="btn btn-primary" type="button" value="투자하기" onclick="location.href='<%if (logOn == null) { %> <%="/register/login.jsp"%> <%} 
					else {%> <%="/register/insertInvestment.jsp?seq_PID=" + project.getSeq_PID() %> <% }%>'" />	
				<% } else if (dao.remainingDay(project.getSeq_PID()) > 0 && logOn != null && dao.investCheck(project.getSeq_PID(), logOn.getId())) { %>
					<input style="width:95%" class="btn disabled" type="button" value="투자 완료" disabled>
				<%} else if (dao.remainingDay(project.getSeq_PID()) <= 0) {%>
					<input style="width:95%" class="btn disabled" type="button" value="투자종료" disabled>
				<%} %>
				</div>
				<div class="col-lg-2">
				<!-- 좋아요 -->
					<input type="checkbox" id="like" onclick="like()" <%if (logOn != null) {
						if (dao.likeProjectCheck(project.getSeq_PID(), logOn.getId())) {%>
						checked <%}
						}%>>
					}
					<label for="like">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
    				<path d="M12 21.35l-1.45-1.32c-5.15-4.67-8.55-7.75-8.55-11.53 0-3.08 2.42-5.5 5.5-5.5 1.74 0 3.41.81 4.5 2.09 1.09-1.28 2.76-2.09 4.5-2.09 3.08 0 5.5 2.42 5.5 5.5 0 3.78-3.4 6.86-8.55 11.54l-1.45 1.31z"/>
					</svg>
					</label>
				</div>
				</div>
				</div>
				<!-- 랭킹 : listAll("cnt desc"); : 조회수 많은 순, 
						listAll("pna desc nulls last"); : 예상관객수 많은순, 
						listAll("m_collected desc"); : 모아진 돈 많은 순  -->
				<!-- 나머지  : listAll("writedate"); : 신작순, 
						listAll("enddate"); : 마감 끝나가는 순 -->
				<!-- 이렇게 구성. 가운데 나오는 건 우리가 임의로 구성.  
				ArrayList<ProjectVO> listAll(String sorting)
				"cnt desc"(큰거에서 작은거), "enddate", "writedate", "m_collected desc", "pna desc nulls last"-->
				
								
				
			</div>
			</div>
			<script>
				function like() {
					<% if (logOn == null) {%>
						location.href="/register/login.jsp";
					<%} else {
						dao.likeProjectChange(project.getSeq_PID(), logOn.getId());
					}%>
				}
			</script>
			<div class="row">
			<div id="recommend" class="col-lg-12" style="padding-bottom:20px;flex:0 0 90%;max-width:90%;margin-left:20px;">
				<div class="my-4" style="margin-bottom:0!important;">
				  <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen"><h6>영화정보</h6></button>
				  <button class="tablinks" onclick="openCity(event, 'Paris')"><h6>기업정보</h6></button>
				  <button class="tablinks" onclick="openCity(event, 'Tokyo')"><h6>투자정보</h6></button>
				  <button class="tablinks" onclick="openCity(event, 'Newyork')"><h6>데이터분석</h6></button>
				</div>

				<!-- 랭킹 : listAll("cnt desc"); : 조회수 많은 순, 
						listAll("pna desc nulls last"); : 예상관객수 많은순, 
						listAll("m_collected desc"); : 모아진 돈 많은 순  -->
				<!-- 나머지  : listAll("writedate"); : 신작순, 
						listAll("enddate"); : 마감 끝나가는 순 -->
				<!-- 이렇게 구성. 가운데 나오는 건 우리가 임의로 구성.  
				ArrayList<ProjectVO> listAll(String sorting)
				"cnt desc"(큰거에서 작은거), "enddate", "writedate", "m_collected desc", "pna desc nulls last"-->
				
				<div id="London" class="tabcontent">
					<%MovieVO movie = dao.movieInfo(project.getSeq_PID()); %>
					<div style="padding-top:10px; padding-bottom:10px;">
					<table>
						<tr><td>작품명</td><td><%=movie.getTitle()%></td></tr>
						<tr><td>장르</td><td><%=movie.getGenre1() + ", " + movie.getGenre2() + ", " + movie.getGenre3() %></td></tr>
						<tr><td>감독</td><td><%=movie.getDirector() %></td></tr>
						<tr><td>출연</td><td><%=movie.getActor1() + ", " + movie.getActor2() + ", " + movie.getActor3() + ", " + movie.getActor4() %></td></tr>
						<tr><td>제작</td><td><%=movie.getProduction() %></td></tr>
						<tr><td>배급</td><td><%=movie.getDistributor() %></td></tr>
						<tr><td>개봉(예정)일</td><td><%=movie.getReleasedate() %></td></tr>
						<%if ("import".equals(project.getPurpose())) {%>
						<tr><td>원제</td><td></td></tr>
						<tr><td>수입회사</td><td></td></tr>
						<%} %>
						</table>
					</div>
				</div>
				
				<div id="Paris" class="tabcontent">
					<%CompanyVO company = dao.companyInfo(project.getSeq_PID()); %>
					<div style="padding-top:10px; padding-bottom:10px;">
						<table>
						<tr><td>법인명</td><td><%=company.getC_name() %></td></tr>
						<tr><td>소재지</td><td><%=company.getC_location() %></td></tr>
						<tr><td>설립일</td><td><%=company.getC_date() %></td></tr>
						<tr><td>대표자명</td><td><%=company.getC_eoname() %></td></tr>
						<tr><td>임.직원수</td><td><%=company.getC_emp() %></td></tr>
						<tr><td>범죄이력</td><td><%=company.getC_crime() %></td></tr>
						<tr><td>홈페이지</td><td><%=company.getC_site() %></td></tr>
						<tr><td>이메일</td><td><%=company.	getC_mail() %></td></tr>
						</table>
					</div>
				</div>
				
				<div id="Tokyo" class="tabcontent">
					<div style="padding-top:10px; padding-bottom:10px;">
						<%if ("R".equals(project.getInv_type())) {%>
						<%ArrayList<RewardVO> reward = dao.rewardInfo(project.getSeq_PID()); %>
							<table>
								<tr><td>투자금액</td><td>보상</td></tr>
								<%for (int i = 0; i < reward.size(); ++i) {%>
									<%if (i == 0) { %>
								<tr><td><%=myFormatter.format(reward.get(i).getStd_invest()/10000) %>만명 미만</td><td><%=reward.get(i).getReward() %></td></tr>
								
									<%} else {%>
								<tr><td><%=myFormatter.format(reward.get(i).getStd_invest()/10000) %>만</td><td><%=reward.get(i).getReward() %></td></tr>
								<%} 
								}%>
							</table>
						<%} else {%>
						<% ArrayList<InterestVO> interest = dao.interestInfo(project.getSeq_PID()); %>
							<table>
								<tr><td rowspan="2">관객수<br>(명)</td><td rowspan="2">예상 손익률<br>(%)</td><td colspan="3">투자원금 대비 정산금(원)</td></tr>
								<tr><td>10만원</td><td>50만원</td><td>200만원</td></tr>
								<%for (int i = 0; i < interest.size(); ++i) {%>
									<%if (i == 0) { %>
								<tr><td><%=myFormatter.format(interest.get(i).getAudience()/10000) %>만명 미만</td><td><%=myFormatter.format(interest.get(i).getInterest()) %></td><td><%=0 %></td><td><%=0 %></td><td><%=0 %></td></tr>
									<%} else {%>
								<tr><td><%=myFormatter.format(interest.get(i).getAudience()/10000) %>만</td><td><%=myFormatter.format(interest.get(i).getInterest()) %></td>
									<td><%=myFormatter.format(100000 / 100 * interest.get(i).getInterest()) %></td>
									<td><%=myFormatter.format(500000 / 100 * interest.get(i).getInterest()) %></td>
									<td><%=myFormatter.format(2000000 / 100 * interest.get(i).getInterest()) %></td>
								</tr>
								<%} 
								}%>
							</table>
						<%} %>
					</div>
				</div>
				
				<div id="Newyork" class="tabcontent">
					<div style="padding-top:10px; padding-bottom:10px;">
					<p style="display:inline;">예상관객수  <b>4,301,255명</b></p>
					<p>예상 관객수 누적그래프 </p>
					<img src="/register/img/kingsman3.png" alt="킹스맨 예상 누적 관객수" height="150%" width="90%">
					<p>영화 ‘킹스맨:시크릿 에이전트’ 관람객 후기 구름단어 분석</p>
					<img src="/register/img/kingsman1.png" alt="킹스맨 워드클라우드" height="65%" width="65%">
					<p style="font-size:0.7rem;margin-top:5px;margin-left:56%">made by 성령</p>
					<p>영화 킹스맨 시리즈의 감독 ‘매튜 본’에 대한 평가 구름단어 분석</p>
					<img src="/register/img/kingsman2.png" alt="킹스맨 워드클라우드" height="65%" width="65%">
					<p style="font-size:0.7rem;margin-top:5px;margin-left:56%">made by 성령</p>
					
					</div>
				</div>

			</div>
			</div>
		</div>
		<!-- end of row1 -->
		<!-- card 안에 어떤 내용들을 넣을지 상의 필요. -->
		
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

</div>
</body>

</html>





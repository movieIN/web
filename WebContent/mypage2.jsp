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
div > label {
margin-top:10px;
margin-bottom:3px;
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
/*  #setting {
height: 80%;
padding-top: 10px;
padding-bottom: 50px;
	padding-right: 20%;
	padding-left: 20%;
}  */
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
 @media ( min-width :768px) {
	#setting {
		width: 540px
	}
}

@media ( min-width :992px) {
	#setting {
		width: 600px
	}
}

@media ( min-width :1200px) {
	#setting {
		width: 600px
	}
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

$(document).ready(function() {
		$('#email_3').change(function() { //change이벤트 발생
			$('#email_3 option:selected').each(function() {
				if ($(this).val() == "self") {
					$('#email_2').val('');//초기화
					$('#email_2').attr('disabled', false);//활성화
				} else {
					$('#email_2').val($(this).text());
					$('#email_2').attr('disabled', true);
				}
			});
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
								data-toggle="dropdown"><%=logOn.getId() + " 님"%>
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
			<div id="search" class="col-lg-3">
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
	<div id="setting" class="container" style="padding-bottom: 100px;">
	<div class="card card-register mx-auto mt-5">
			<div class="card-header">기본 정보 수정</div>
			<div class="card-body">
				<form method="post" action="./Member?action=modify_basic"
					onsubmit="return check();">
					<!-- 제출시 중복체크 여부 확인 함수 호출 -->
					<div class="form-group">
							<label for="name">이름</label>
							<div class="form-row">
							<div class="col-md-12">
								 <input class="form-control"
									type="text" id="name" name="name" maxLength="20"
									value=<%=logOn.getName()%> disabled>
							</div>
							</div>
							<label for="pnum">휴대폰 번호</label>
							<div class="form-row">
							<div class="col-md-12">
								 <input class="form-control"
									type="text" id="pnum" name="pnum" maxLength="13"
									value=<%=logOn.getPnum()%>>
							</div>
							</div>
							<% String email = logOn.getEmail();
							   String[] emailAll = email.split("@");%>
							<label for="pnum">이메일</label>
							<div class="form-row">
							<div class="col-md-3">
								 <input class="form-control"
									 type="text" id="email_1" name="email_1"
									maxLength="20" value=<%=emailAll[0]%>></div>
									<div class="col-md-1" style="float:left">@</div>
									<div class="col-md-4"><input 
									type="text" id="email_2" name="email_2" disabled
									value=<%=emailAll[1]%>></div>
									<div class="col-md-4"><select id="email_3"
									name="email_3">
									<option value="gmail.com" >gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="self" selected>직접입력</option>
								</select>
								</div> 
							</div>
							</div>
							
							<input class="btn btn-primary pull-right" type="submit" value="수정">
							<button class="btn btn-primary" onclick="location.href='mypage.jsp';return false;">확인</button>
							
						</form>
						</div>
					</div>
	
		<!-- <div class="card card-login mx-auto mt-5">
        	<form method="post" action="./Member?action=login">
				<div class="form-group">
              <label for="id">아이디</label>
              <input class="form-control" type="text" id="id" name="id" maxLength="20" placeholder="아이디를 입력해주세요" required>
            </div>
				<div class="form-group">
              <label for="id">비밀번호</label>
              <input class="form-control" type="password" id="pw" name="pw" maxLength="15" placeholder="비밀번호를 입력해주세요" required>
            </div>
            </form>
	</div> -->
	</div>
		<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; 주식회사 2017</p>
		</div>
		<!-- /.container -->
	</footer>	
	<%
		String messageContent = null;
		if (session.getAttribute("messageContent") != null) {
			messageContent = (String) session.getAttribute("messageContent");
		}
		String messageType = null;
		if (session.getAttribute("messageType") != null) {
			messageType = (String) session.getAttribute("messageType");
		}
		if (messageContent != null) {
	%>
		<div class="modal fage" id="messageModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-info">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							<%=messageType%>
						</h4>
					</div>
					<div class="modal-body">
						<%=messageContent%>
					</div>
					<div class="modal-footer">
						<button onclick="location.href='mypage.jsp'" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#messageModal').modal("show");
	</script>
	<%
		session.removeAttribute("messageContent");
			session.removeAttribute("messageType");
		}
	%>
	
	
	
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/formCheck.js"></script>
<title>프로젝트 올리기 - 4</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/jejugothic.css" />
<link href="${pageContext.request.contextPath}/reference2/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="${pageContext.request.contextPath}/reference2/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/reference2/css/sb-admin.css" rel="stylesheet">
<style type="text/css">

body {font-family: 'Jeju Gothic', sans-serif; }
label {
margin-top: 15px;
margin-bottom: 2px;
margin-right:5px;
}
.card-header{
	font-weight: bold;
}
</style>
</head>
<body class="bg-dark">
	<div class="container" style="padding-bottom:30px;">
		<div class="card card-register mx-auto mt-5">
		<div class="card-header"><h3>영화 정보 입력</h3></div>
	<div class="card-body">
	<form action = "/register/Project?action=insertMovie&seq_PID=<%=request.getAttribute("seq_PID")%>" onSubmit="return formCheck(this)">
	<!-- 
	project.setImgurl(request.getParameter("imgurl")); -->
	<div class="form-group">
	<div class="form-row">
	<div class="col-md-12"> 
	<label style="margin-top:0px;">작품명 (필수) </label>
		<input class="form-control" type="text" name="title" maxlength="20" required>
	</div>
	</div>
	<div class="form-row">
	
	<div class="col-md-4">
	<label>장르 1</label> 
		<select name="genre1" required>
			<option value="sf">sf</option>
			<option value="사극">사극</option>
			<option value="액션">액션</option>
			<option value="드라마">드라마</option>
			<option value="범죄">범죄</option>
			<option value="코미디">코미디</option>
			<option value="스릴러">스릴러</option>
			<option value="어드벤처">어드벤처</option>
			<option value="판타지">판타지</option>
			<option value="전쟁">전쟁</option>
			<option value="서부극">서부극</option>
			<option value="멜로/로맨스">멜로/로맨스</option>
			<option value="가족">가족</option>
			<option value="애니메이션">애니메이션</option>
			<option value="공포">공포</option>
			<option value="다큐멘터리">다큐멘터리</option>
			<option value="미스터리">미스터리</option>
			<option value="뮤지컬">뮤지컬</option>
			<option value="공연">공연</option>
			<option value="기타">기타</option>
		</select>
	</div>
	 
	<div class="col-md-4">
	<label>장르 2</label>
		<select name="genre2" required>
			<option value="sf">sf</option>
			<option value="사극">사극</option>
			<option value="액션">액션</option>
			<option value="드라마">드라마</option>
			<option value="범죄">범죄</option>
			<option value="코미디">코미디</option>
			<option value="스릴러">스릴러</option>
			<option value="어드벤처">어드벤처</option>
			<option value="판타지">판타지</option>
			<option value="전쟁">전쟁</option>
			<option value="서부극">서부극</option>
			<option value="멜로/로맨스">멜로/로맨스</option>
			<option value="가족">가족</option>
			<option value="애니메이션">애니메이션</option>
			<option value="공포">공포</option>
			<option value="다큐멘터리">다큐멘터리</option>
			<option value="미스터리">미스터리</option>
			<option value="뮤지컬">뮤지컬</option>
			<option value="공연">공연</option>
			<option value="기타">기타</option>
		</select>
	</div>
	 
	<div class="col-md-4">
	<label>장르 3</label>
		<select name="genre3" required>
			<option value="sf">sf</option>
			<option value="사극">사극</option>
			<option value="액션">액션</option>
			<option value="드라마">드라마</option>
			<option value="범죄">범죄</option>
			<option value="코미디">코미디</option>
			<option value="스릴러">스릴러</option>
			<option value="어드벤처">어드벤처</option>
			<option value="판타지">판타지</option>
			<option value="전쟁">전쟁</option>
			<option value="서부극">서부극</option>
			<option value="멜로/로맨스">멜로/로맨스</option>
			<option value="가족">가족</option>
			<option value="애니메이션">애니메이션</option>
			<option value="공포">공포</option>
			<option value="다큐멘터리">다큐멘터리</option>
			<option value="미스터리">미스터리</option>
			<option value="뮤지컬">뮤지컬</option>
			<option value="공연">공연</option>
			<option value="기타">기타</option>
		</select>
	</div>
	</div>
	<label>감독(필수) </label> 
	<div class="form-row">
	<div class="col-md-12">
		<input class="form-control" type="text" name="director" maxlength="13" required>
	</div>
	</div>
	<label>출연 배우  </label> 
	<div class="form-row">
	<div class="col-md-12">	
		<input class="form-control" type="text" name="actor1" maxlength="13">
	</div>
	</div>
	<label>출연 배우  </label> 
	<div class="form-row">
	<div class="col-md-12">	
		<input class="form-control" type="text" name="actor2" maxlength="13">
	</div>
	</div>
	<label>출연 배우  </label> 
	<div class="form-row">
	<div class="col-md-12">	
		<input class="form-control" type="text" name="actor3" maxlength="13">
	</div>
	</div>
	<label>출연 배우 (그 외)</label> 
	<div class="form-row">
	<div class="col-md-12">	
		<input class="form-control" type="text" name="actor4" maxlength="66">
	</div>
	</div>
	<label>제작사</label> 
	<div class="form-row">
	<div class="col-md-12">	
		<input class="form-control" type="text" name="production" maxlength="13">
	</div>
	</div>
	<label>배급사</label> 
	<div class="form-row">
	<div class="col-md-12">	
		<input class="form-control" type="text" name="distributor" maxlength="13">
	</div>
	</div>
	<label>개봉(예정)일 </label> 
	<div class="form-row">
	<div class="col-md-12">	
		<input class="form-control" type="date" name="releasedate">
	</div>
	</div>
	<label>원제 </label> 
	<div class="form-row">
	<div class="col-md-12">	
		<input class="form-control" type="text" name="origin_title" maxlength="13">
	</div>
	</div>
	<label>수입회사 </label> 
	<div class="form-row">
	<div class="col-md-12">	
		<input class="form-control" type="date" name="importer" maxlength="13">
	</div>
	</div>
	<div style="margin-left:73.5%;margin-top:20px;">
	<input class="btn btn-primary" type="submit" value="저장"> <input class="btn btn-primary" type="reset" value="다시쓰기">
	</div>
	</div>
</form>
</div>
</div>
</div>
</body>
</html>
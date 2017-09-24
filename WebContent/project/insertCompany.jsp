<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/formCheck.js"></script>
<title>프로젝트 올리기 - 3</title>
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

.card-header{
	font-weight: bold;
}
h4{
margin-bottom:0px;
}
label {
margin-top:15px;
margin-bottom:2px;
}
</style>
</head>
<body class="bg-dark">
	<div class="container" style="padding-bottom:30px;">
		<div class="card card-register mx-auto mt-5">
		<div class="card-header"><h4>회사 정보 입력</h4></div class="card-body">
	<form action = "/register/Project?action=insertCompany&seq_PID=<%=request.getAttribute("seq_PID")%>" onSubmit="return formCheck(this)">
	<!-- 
	project.setImgurl(request.getParameter("imgurl")); -->
	<div class="form-group">
	<label style="margin-top:0px;">회사 이름 (필수)</label>
	<div class="form-row">
	<div class="col-md-12"> 
		<input class="form-control" type="text" name="c_name" maxlength="10" required>
	</div>
	</div>
	<label>회사 소재지 </label> 
	<div class="form-row">
	<div class="col-md-12">
		<input class="form-control" type="text" name="c_location"  maxlength="26" >
	</div>
	</div>
	<label>회사 설립일 </label> 
	<div class="form-row">
	<div class="col-md-12">
		<input class="form-control" type="date" name="c_date">
	</div>
	</div>
	<label>대표자() </label> 
	<div class="form-row">
	<div class="col-md-12">
		<input class="form-control" type="text" name="c_eoname" required>
	</div>
	</div>
	<label>임직원수(필수) </label> 
	<div class="form-row">
	<div class="col-md-12">
		<input class="form-control" type="number" name="c_emp" required>
	</div>
	</div>
	<label>범죄 이력 </label> 
	<div class="form-row">
	<div class="col-md-12">	
		<input class="form-control" type="text" name="c_crime" maxlength="6">
	</div>
	</div>
	<label>홈페이지</label> 
	<div class="form-row">
	<div class="col-md-12">
		<input class="form-control" type="text" name="c_site" maxlength="50">
	</div>
	</div>
	<label>이메일  </label> 
	<div class="form-row">
	<div class="col-md-12">
		<input class="form-control" type="text" name="c_mail" maxlength="40">
	</div>
	</div>
	<!-- 파일 업로드 부분에서는 좀 생각을 해야할 것 같음. -->
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
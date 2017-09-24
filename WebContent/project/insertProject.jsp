<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/formCheck.js"></script>
<title>프로젝트 올리기 - 1</title>
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
margin-top: 8px;
margin-bottom: 2px;
}
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
		<div class="card-header"><h4>프로젝트 정보 입력</h4></div>
	<div class="card-body">
	<form action = "/register/Project?action=insertProject" onSubmit="return formCheck(this)">
	<!-- 
	project.setImgurl(request.getParameter("imgurl")); -->
	<div class="form-group">
		<div class="form-row">
	<div class="col-md-12"> 
	<label style="margin-top:0px;">프로젝트 이름 (필수) </label>
		<input class="form-control" type="text" name="proj" maxlength="34" required>
	</div>
	</div>
	
	<label>목표 금액(필수) </label> 
	<div class="form-row">
	<div class="col-md-12">
		<input class="form-control" type="number" name="m_target" required>
	</div>
	</div>
	
	<label>마감일(필수) </label> 
	<div class="form-row">
	<div class="col-md-12">
		<input class="form-control" type="date" name="enddate" required>
	</div>
	</div>
	
	<label>투자받을 최대금액   </label> 
	<div class="form-row">
	<div class="col-md-12">	
		<input class="form-control" type="number" name="m_max" min="0">
	</div>
	</div>
	
	<label>투자받을 최소금액  </label> 
	<div class="form-row">
	<div class="col-md-12">	
		<input class="form-control" type="number" name="m_min" min="0">
	</div>
	</div>
	
	<label>투자받을 형태(필수) </label> 
	<div class="form-row">
	<div class="col-md-12">	
		<select name="inv_type" required>
			<option value="I">투자형</option>
			<option value="R">보상형</option>
		</select>
	</div>
	</div>
	
	<label>투자금 사용 목적 (필수) </label> 
	<div class="form-row">
	<div class="col-md-12">	
		<select name="purpose" required>
			<option value="import">영화 수입</option>
			<option value="marketing">마케팅</option>
			<option value="reshow">재개봉</option>
			<option value="newMake">영화 제작</option>
		</select>
	</div>
	</div>
	
	<!-- 파일 업로드 부분에서는 좀 생각을 해야할 것 같음. -->

	<label>프로젝트 이미지  </label> 
	<div class="form-row">
	<div class="col-md-12">
		<input class="form-control" type="file" name="imgurl" accept="image/*" required>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>프로젝트 올리기 - 2R</title>
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/jejugothic.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/formCheck.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- Bootstrap core CSS -->
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
.form-control{
width:60%;
display:inline;
margin-left:10px;
margin-right:10px;
}
.form-row{
margin-bottom:15px;
}
</style>
</head>
<body class="bg-dark">
	<div class="container" style="padding-bottom:30px;">
		<div class="card card-register mx-auto mt-5">
		<div class="card-header"><h4>리워드 입력</h4></div>
	<div class="card-body">
	<form action = "/register/Project?action=insertReward&seq_PID=<%=request.getAttribute("seq_PID")%>" onSubmit="return formCheck(this)">
	<!-- 
	project.setImgurl(request.getParameter("imgurl")); -->
	<div class="form-group">
	<div class="form-row">
	<div class="col-md-12"> 
		<label>투자금액 (필수) </label>
		<input class="form-control" type="number" name="std_invest1" required>이하<br>
		<label >리워드(필수) </label>
		<input style="margin-left:30px;" class="form-control" type="text" name="reward1" required>
	</div>
	</div>
	<div class="form-row">
	<div class="col-md-12"> 
		<label>투자금액 (필수) </label>
		<input class="form-control" type="number" name="std_invest2" required>이하<br>
		<label >리워드(필수) </label>
		<input style="margin-left:30px;" class="form-control" type="text" name="reward2" required>
	</div>
	</div>
	<div class="form-row">
	<div class="col-md-12"> 
		<label >투자금액 </label>
		<input style="margin-left:56px;" class="form-control" type="number" name="std_invest3" >이하<br>
		<label>리워드 </label>
		<input style="margin-left:72px;"class="form-control" type="text" name="reward43">
	</div>
	</div>
	<div class="form-row">
	<div class="col-md-12"> 
		<label>투자금액 </label>
		<input style="margin-left:56px;" class="form-control" type="number" name="std_invest4" >이하<br>
		<label>리워드 </label>
		<input style="margin-left:72px;" class="form-control" type="text" name="reward4">
	</div>
	</div>
	<div class="form-row">
	<div class="col-md-12"> 
		<label >투자금액 </label>
		<input style="margin-left:56px;" class="form-control" type="number" name="std_invest5" >이하<br>
		<label>리워드 </label>
		<input style="margin-left:72px;" class="form-control" type="text" name="reward5">
	</div>
	</div>
	<div style="margin-left:73.5%;margin-top:30px;">
	<input class="btn btn-primary" type="submit" value="저장"> <input class="btn btn-primary" type="reset" value="다시쓰기">
	</div>
	</div>
</form>
</div>
</div>
</div>
</body>
</html>
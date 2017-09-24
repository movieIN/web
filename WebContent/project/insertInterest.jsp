<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/formCheck.js"></script>
<title>프로젝트 올리기 - 2I</title>
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
		<div class="card-header"><h4>이자율 입력</h4></div>
	<div class="card-body">
	<form action = "/register/Project?action=insertInterest&seq_PID=<%=request.getAttribute("seq_PID")%>" onSubmit="return formCheck(this)">
	<!-- 
	project.setImgurl(request.getParameter("imgurl")); -->
	<div class="form-group">
	<div class="form-row">
	<div class="col-md-12"> 
	<label>관객수 (필수)  </label>
		<input class="form-control" type="number" name="audience1" required>이하<br>
	<label>이자율 (필수)  </label> 
		<input class="form-control" type="number" name="interest1" step="any" required />%
	</div>
	</div>
	<div class="form-row">
	<div class="col-md-12"> 
	<label>관객수 (필수) </label>
		<input class="form-control" type="number" name="audience2" required>이하<br>
	<label>이자율 (필수) </label> 
		<input class="form-control" type="number" name="interest2" step="any" required />%
	</div>
	</div>
	<div class="form-row">
	<div class="col-md-12"> 
	<label>관객수  </label>
		<input style="margin-left:56px;" class="form-control" type="number" name="audience3" >이하<br>
	<label>이자율  </label> 
		<input style="margin-left:56px;" class="form-control" type="number" name="interest3" step="any"  />%
	</div>
	</div>
	<div class="form-row">
	<div class="col-md-12"> 
	<label>관객수 </label>
		<input style="margin-left:56px;" class="form-control" type="number" name="audience4" >이하<br>
	<label>이자율  </label> 
		<input style="margin-left:56px;" class="form-control" type="number" name="interest4" step="any"  />%
	</div>
	</div>
	<div class="form-row">
	<div class="col-md-12"> 
	<label>관객수 </label>
		<input style="margin-left:56px;" class="form-control" type="number" name="audience5" >이하<br>
	<label>이자율  </label> 
		<input style="margin-left:56px;" class="form-control" type="number" name="interest5" step="any"  />%
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
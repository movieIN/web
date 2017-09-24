<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>로그인</title>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script src="reference2/vendor/popper/popper.min.js"></script>
	<script src="reference2/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/jejugothic.css" />
    <link href="reference2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="reference2/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="reference2/css/sb-admin.css" rel="stylesheet">
	
	<!-- <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="reference2/css/sb-admin.css" rel="stylesheet"> -->
    <style>
    body {font-family: 'Jeju Gothic', sans-serif; }
    </style>
</head>
<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
        <div class="card-header">
          	로그인
        </div>
        <div class="card-body">
		<form method="post" action="./Member?action=login">
				<div class="form-group">
              <label for="id">아이디</label>
              <input class="form-control" type="text" id="id" name="id" maxLength="20" placeholder="아이디를 입력해주세요" required>
            </div>
				<div class="form-group">
              <label for="id">비밀번호</label>
              <input class="form-control" type="password" id="pw" name="pw" maxLength="15" placeholder="비밀번호를 입력해주세요" required>
            </div>
             <div class="form-group">
              <div class="form-check">
                <label class="form-check-label">
                  <input type="checkbox" class="form-check-input">
                  Remember Password
                </label>
              </div>
            </div>
			<input class="btn btn-primary btn-block" type="submit" value="로그인">
		</form>
		<div class="text-center">
            <div class="d-block small mt-3"><a href="register.jsp">회원가입</a> /
            <a href="forgot-password.html">비밀번호 찾기</a>
            </div>
            
          </div>
		</div>
	</div>
	</div>
	<% 
		String messageContent = null;
		if(session.getAttribute("messageContent") != null){
			messageContent = (String)session.getAttribute("messageContent");
		}
		String messageType = null;
		if(session.getAttribute("messageType") != null){
			messageType = (String)session.getAttribute("messageType");
		}
		if(messageContent != null){
	%>
	<div class="modal fage" id="loginCheckModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content <% if(messageType.equals("오류메시지")) out.println("panel-warning"); else out.println("panel-success");%>">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							<%= messageType %>
						</h4>
					</div>
					<div class="modal-body">
						<%= messageContent %>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#loginCheckModal').modal("show");
	</script>
	<% 	
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>
</body>
</html>
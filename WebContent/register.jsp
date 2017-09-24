<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원가입</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/jejugothic.css" />
<link href="reference2/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="reference2/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="reference2/css/sb-admin.css" rel="stylesheet">


<script type="text/javascript">
<!-- 아이디 중복 체크 ajax -->
	function registerCheckFunction() {
		var id = $('#id').val();
		$.ajax({
			type : 'POST',
			url : './Member?action=registerCheck',
			data : {
				id : id
			},
			success : function(result) {
				if (result == 1) {
					$('#checkMessage').html('사용할 수 있는 아이디입니다.');
					$('#checkType')
							.attr('class', 'modal-content panel-success');
					$('#idChecked').attr('value', 'idCheckOK');
				} else {
					$('#checkMessage').html('사용할 수 없는 아이디입니다.');
					$('#checkType')
							.attr('class', 'modal-content panel-warning');
				}
				$('#checkModal').modal("show");
			}
		})
	}
	/* 패스워드 일치 함수 */
	function passwordCheckFunction() {
		var pw1 = $('#pw1').val();
		var pw2 = $('#pw2').val();
		if (pw1 != pw2) {
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		} else {
			$('#passwordCheckMessage').html('');
		}
	}

	/* 이메일 셀렉트 */
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
<script type="text/javascript">
	/* function idChecked(){ idChecked 키워드 사용불가 */
	function check() {
		var idCheck = $('#idChecked').val();
		console.log(idCheck);
		if (idCheck != "idCheckOK") {
			$('#idCheckMessage').html('아이디 중복확인을 해주세요.');
			$('#idCheckType').attr('class', 'modal-content panel-warning');
			$('#idCheckedModal').modal("show");
			return false;
		} else {
			return true;
		}
	}
</script>
<style type="text/css">
body {font-family: 'Jeju Gothic', sans-serif; }
label {
margin-top: 8px;
margin-bottom: 2px;
}
</style>
</head>
<body class="bg-dark">
	<div class="container">
		<div class="card card-register mx-auto mt-5">
			<div class="card-header">회원가입</div>
			<div class="card-body">
				<form method="post" action="./Member?action=register"
					onsubmit="return check();">
					<!-- 제출시 중복체크 여부 확인 함수 호출 -->
					<div class="form-group">
						<label for="id">아이디</label>
						<div class="form-row">
							<div class="col-xs-9 col-sm-9 col-md-9">
								 <input type="text"
									class="form-control" type="text" id="id" name="id"
									maxLength="20" placeholder="아이디를 입력해주세요(10자 이하)" required>
							</div>
							<div class="col-xs-3 col-sm-3 col-md-3">
								<button class="btn btn-primary"
									onclick="registerCheckFunction();" type="button">중복체크</button>
									</div>
							</div>
							<label for="pw">비밀번호</label>
							<div class="form-row">
							<div class="col-md-12">
								 <input class="form-control"
									type="password" onblur="passwordCheckFunction();" id="pw1"
									name="pw1" maxLength="15" placeholder="비밀번호를 입력해주세요" required>
							</div>
							</div>
							<label for="pw">비밀번호 확인</label>
							<div class="form-row">
							<div class="col-md-12">
								 <input class="form-control"
									type="password" onkeyup="passwordCheckFunction();" id="pw2"
									name="pw2" maxLength="15" placeholder="비밀번호를 다시 입력해주세요"
									required>
								<h5 style="color: red; font-size:0.9rem; margin-left:5px; margin-top:5px;" id="passwordCheckMessage"></h5>
							</div>
							</div>
							<label for="name">이름</label>
							<div class="form-row">
							<div class="col-md-12">
								 <input class="form-control"
									type="text" id="name" name="name" maxLength="20"
									placeholder="이름을 입력해주세요" required>
							</div>
							</div>
							<label for="pnum">휴대폰 번호</label>
							<div class="form-row">
							<div class="col-md-12">
								 <input class="form-control" 
									type="text" id="pnum" name="pnum" maxLength="13"
									placeholder="휴대폰 번호를 입력해주세요" required>
							</div>
							</div>
							<label for="pnum">이메일</label>
							<div class="form-row">
							<div class="col-md-3">
								 <input class="form-control"
									 type="text" id="email_1" name="email_1"
									maxLength="20" required></div><div class="col-md-1" style="float:left"><h4 style="color:gray; padding-top:5px;">@</h4></div>
									<div class="col-md-4"><input style="height:36px;"
									type="text" id="email_2" name="email_2" disabled
									value="gmail.com" required></div>
									<div class="col-md-4"><select style="width:172px; height:33px;" id="email_3"
									name="email_3">
									<option value="gmail.com" selected>gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="self">직접입력</option>
								</select>
								</div> 
							</div>
							</div>
							<input type="hidden" id="idChecked" name="idChecked"> 
							<input class="btn btn-primary" type="submit" value="회원가입" style="margin-left:85%;">
							</form>
						</div>
					</div>
			</div>



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
				<div
					class="modal-content <%if (messageType.equals("오류메시지"))
					out.println("panel-warning");
				else
					out.println("panel-success");%>">
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
						<!-- 클릭불가능, 이동도 안됨! 왜?ㅠㅠㅜ  -->
						<button class="btn btn-primary"
							onclick="location.href='index.jsp'">메인으로</button>
						<button class="btn btn-primary"
							onclick="location.href='login.jsp'">로그인</button>
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
	<!-- 아이디 중복 체크 modal -->
	<div class="modal fage" id="checkModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div id="checkType" class="modal-content panel-info">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">확인 메시지</h4>
					</div>
					<div class="modal-body" id="checkMessage"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- id 중복체크 여부 확인 modal -->
	<div class="modal fage" id="idCheckedModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div id="idCheckType" class="modal-content panel-info">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">확인 메시지</h4>
					</div>
					<div class="modal-body" id="idCheckMessage"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
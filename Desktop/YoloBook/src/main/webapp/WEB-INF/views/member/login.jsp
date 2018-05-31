<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<style>
	.a{
	background-color: gray;
	width: 500px;
	}
</style>
</head>
<body>
	<center>
		<div class=a>
			&nbsp;
			<div class=a>
				<h1>로그인</h1>
			</div>
			&nbsp;
		</div>
		<br>
		<form action="/program/login" method="post"	onsubmit="infoCheck(); return false;">
			아 이 디 <input type="text" class="LoginInfo" name="id" id="id" required /><br>
			비밀번호 <input type="password" class="LoginInfo" name="pw" id="pw" required /><br>
			<div class="btnLogin">
				<input type="submit" value="로그인" class="btnLogin" id="login" />
			</div>
			<div class="btnJoin">
				<input type="button" value="회원가입" class="btnJoin" onclick="location.href='/program/join'" />
			</div>
		</form>
	</center>
</body>

<script src="resources/jquery-3.2.1.min.js"></script>
<script>
	function infoCheck() {
		$.ajax({
			async:true,
			url : "/program/idcheck",
			type : "POST",
			data : {"id":$("#id").val()},
			success : function(idcheck) {
				if (!idcheck) {
					alert("회원가입후 이용바랍니다.");
					document.getElementById("id").value = "";
					document.getElementById("pw").value = "";
					location.href="join"; // 없는 id기 때문에 nullpointException발생 => 회원가입창으로 강제이동
				}
				else {
					
				}
			},
			error : function(e) {
				alert(e);
			},
			complete : function() {
			}
		});
		return turn;
	}
</script>
</html>
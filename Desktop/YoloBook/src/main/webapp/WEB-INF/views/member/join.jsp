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
		<h1>회원가입</h1>
	</div>
&nbsp;
</div>
	<form action="/program/join" method="post" onsubmit="return joinCheck(this)">
		아이디<input type="text" class="LJInfo" name="id" id="id" maxlength="15"required /><input type="button" value="중복확인" id="IdCheck"><br>
		비밀번호<input type="password" class="LJInfo" name="pw" required /><br>
		이름<input type="text" class="LJInfo" name="username" required /><br>
		이메일<input type="text" class="LJInfo" name="email" required /><br>
		핸드폰<input type="text" class="LJInfo" name="phone" required /><br>
		<div class="join_btnJoin"><input class="join_btnJoin" type="submit" value="회원가입" /></div>
		<div class="join_btnCancel"><input class="join_btnCancel" type="button" value="취소" onclick="location.href='/program/login'" /></div>
	</form>
</body>

<script src="resources/jquery-3.2.1.min.js"></script>
<script>
	$("#IdCheck").on('click', function(){
		$.ajax({
			async:true,
			url:"/program/idcheck",
			type:"POST",
			data: {"id":$("#id").val()},
			success:function(idcheck){
				if(!idcheck){
					alert("사용가능한 아이디입니다.");
				} 
				else{
					alert("이미 사용 중인 아이디입니다.");
					document.getElementById("id").value = "";
				}
			},				
			error:function(e){
				alert(e);
			},
			complete:function(){
			}
		});
	});
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>프로그램 수정</title>
<style>
	div{
	background-color: gray;
	width: 500px;
	}
</style>
</head>
<body>
<center>
<div> 
&nbsp;
	<div>
		<h1>회원정보 수정</h1>
	</div>
&nbsp;
</div>
<br>
<form action="mupdate" method="post">
	아이디: <input type=text name=id><br>
	암호:  <input type= password name=pw><br>
	유저명: <input type=text name=username><br>
	이메일:  <input type= text name=email><br>
	연락처: <input type=text name=phone><br>
	<input type=submit value=수정>	
</form>
</center>
</body>
</html>

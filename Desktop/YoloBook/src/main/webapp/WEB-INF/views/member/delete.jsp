<%@page import="yolo.book.program.ProgramVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title> 회원 삭제 </title>
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
		<h1>회원 삭제</h1>
	</div>
&nbsp;
</div>
<br>
	<form action=mdelete method="post">
		아이디 : <input type="text" name="id"><br>
		암호 : <input type="password" name="pw"><br>
		<input type=submit value=버튼><br>
	</form>
</center>
</body>
</html>

	<!-- <h1><a href="insert">메뉴 돌아가기</a></h1>	 -->
<%--<jsp:forward page="../main.jsp"></jsp:forward>--%>
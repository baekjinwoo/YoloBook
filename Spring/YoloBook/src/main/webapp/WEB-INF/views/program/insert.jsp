<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title> 프로그램 추가 </title>
<style>
	div{
	background-color: gray;
	width: 450px;
	}
</style>
</head>
<body>
<center>
<div> 
&nbsp;
	<div>
		<h1>프로그램 추가페이지</h1>
	</div>
&nbsp;
</div>
<br>
	<form action="insert" method="post">
<table border="1">
		<tr><td>프로그램명:</td>		<td><input type="text" name=pname placeholder="프로그램명을 입력하시오" size="60"></td></tr>
		<tr><td>일자:</td><td>		<input type=text name=day placeholder="날자를 입력하시오" title="xx월 xx일" size="60"></td></tr>
		<tr><td>시작시간:</td><td>		<input type=text name=starttime placeholder="시작시간을 입력하시오" title="xx시 xx분" size="60"></td></tr>
		<tr><td>종료시간:</td><td>		<input type=text name=endtime placeholder="종료시간을 입력하시오" title="xx시 xx분" size="60"></td></tr>
		<tr><td>가격:</td><td>		<input type=text name=price placeholder="가격을 입력하시오" title="xxxxx원" size="60"></td></tr>
		<tr><td>제한인원:</td><td>		<input type=text name=limit placeholder="인원수를 입력하시오" title="xxx명" size="60"></td></tr>
</table>	
		<input type="submit" value=입력>
	</form>
</center>
</body>
</html>
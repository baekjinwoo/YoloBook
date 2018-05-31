<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title> 프로그램 추가페이지  </title>
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
		<h1>프로그램 추가페이지</h1>
	</div>
&nbsp;
</div>
<br>
	<form action="pinsert" method="post">
<table border="1">
		<tr><td>프로그램명:</td>		<td><input type="text" name=pname placeholder="ex)자바특강 나이샤~" size="60"></td></tr>
		<tr><td>일자:</td><td>		<input type=text name=day placeholder="YYYY/MM/DD" pattern="^[0-9]{8}$" size="60"></td></tr>
		<tr><td>시작시간:</td><td>		<input type=text name=starttime placeholder="hh:mm" pattern="^[0-9]{2}:[0-9]{2}$" size="60"></td></tr>
		<tr><td>종료시간:</td><td>		<input type=text name=endtime placeholder="hh:mm"  pattern="^[0-9]{2}:[0-9]{2}$" size="60"></td></tr>
		<tr><td>가격:</td><td>		<input type=text name=price placeholder="ex) 10000원"  size="60"></td></tr>
		<tr><td>제한인원:</td><td>		<input type=text name=limit placeholder="ex) 3" size="60"></td></tr>
</table>	
		<input type="submit" value=입력>
	</form>
</center>
</body>
</html>
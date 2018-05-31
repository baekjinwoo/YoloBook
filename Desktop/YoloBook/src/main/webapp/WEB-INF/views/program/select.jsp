<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title> 프로그램 정보List </title>
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
		<h1>프로그램 정보List</h1>
	</div>
&nbsp;
</div>
<br>
<table border='2'>
	<th>선택</th>
	<th>프로그램 번호 </th>
	<th>프로그램명 </th>
	<th>시작시간 </th>
	<th>종료시간 </th>
	<th>날짜 </th>
	<th>가격 </th>
	<th>인원제한 </th>
	
	<c:forEach var="vo" items="${menulist }"> 
		<tr>
		<td><input type=checkbox name=numberinfo></td>
		<td>${vo.pnumber}</td> 
		<td>${vo.pname }</td>
		<td>${vo.starttime }</td>
		<td>${vo.endtime }</td>
		<td>${vo.day }</td>
		<td>${vo.price }</td>
		<td>${vo.limit }</td>
		</tr>
	</c:forEach>
</table>
	<input type=button value='프로그램 수정' onclick="location.href='pupdate'">
	<input type=button value='프로그램 삭제' onclick="location.href='pdelete'">
</center>
</body>
</html>

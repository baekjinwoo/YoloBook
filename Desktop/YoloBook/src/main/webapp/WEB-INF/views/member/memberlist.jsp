<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
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
		<h1>회원목록</h1>
	</div>
&nbsp;
</div>
<br>

<form action="/program/memberlist" method="post">
		<table border="3">
		<tr><td> 아이디 </td> <td> 이메일 </td> <td> 전화번호 </td> <td> 사용자 이름 </td></tr>
			<c:forEach items="${memberlist }" var="vo">
				<tr><td> ${vo.id }</td> <td>${vo.email }</td> <td>${vo.phone }</td> <td>${vo.username }</td>
				</tr>
			</c:forEach>
		</table>
	</form>
		<input type=button value='회원 삭제' onclick="location.href='mdelete'">
		<input type=button value='회원 수정' onclick="location.href='mupdate'">
</center>
</body>

</html>
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
		<h1>프로그램 수정</h1>
	</div>
&nbsp;
</div>
<br>
<!-- day수정하려면 YYYY/MM/DD HH/MM/SS로 나오니까 trim해야한다 -->
<form action="pupdate" method="post">
	프로그램 번호: <input type=text name=pnumber1><br>
	변경할 시작시간:  <input type= text name=time1><br>
	변경할 종료시간:  <input type= text name=time2><br>
	가격 : <input type=text name=price1><br>
	<input type=submit value=수정>	
</form>
</center>
</body>
</html>
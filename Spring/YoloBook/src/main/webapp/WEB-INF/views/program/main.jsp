<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title> 관리자 메인 창</title>
<style>
	div{
	background-color: gray;
	width: 500px;
	}
</style>
<script>
$(document).ready(function(){
	$('#select').on('click',function(){ location.href='product/productlist.jsp';})
	$('#insert').on('click',function(){ location.href='cart/cartremove.jsp';})
	$('#update').on('click',function(){ location.href='cart/cartremove.jsp';})
	$('#delete').on('click',function(){ location.href='cart/cartremove.jsp';})
});
</script>
</head>

<body>
<center>
<div> 
&nbsp;
	<div>
		<h1>관리자 메인 창</h1>
	</div>
&nbsp;
</div>
<input type=button value=조회  id="select"><br>
<input type=button value=추가 id="insert"><br>
<input type=button value=수정 id="update"><br>
<input type=button value=삭제 id="delete"><br>
</body>
</html>
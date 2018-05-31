<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title> 프로그램 정보List </title>
<script src="resources/jquery-3.2.1.min.js"></script>
<style>
	div{
	background-color: gray;
	width: 500px;
	}
</style>
<script>

var pnumber = "";

$(document).ready(function() {
	
	$("#pbtn").val(pnumber);
	
	$("input[type=checkbox]").on('click', function() {
		alert(this.checked);
		if(this.checked == true){
			pnumber = $(this).val();
		} else{
			pnumber = "";
		}
		$("#pbtn").val(pnumber);
	})
	
	$("#delbtn").on('click', function() {
		$(location).attr('href', "http://pdelete?number=" + pnumber);
	})
});  


</script>


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
		<td><input type=checkbox id="numberinfo" value="${vo.pnumber}"></td>
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
<script>

/* function selectDelRow(){
	var chk=document.getElementsByName("del_unit[]");
	var checkRow='';
	var checkCnt=
} */


</script>



	<input type=button value='프로그램 수정' onclick="location.href='pupdate'">
	

	<input type=button id="delbtn" value='프로그램 삭제'>
			<!-- number=\"&{pnumber}\"'"> -->
	<!-- <input type=button id="pbtn" value="pnumber=">
	 -->
	<form action='pdelete'>
		<input type=submit id="pbtn" name="number" value="">
	</form>

</center>
</body>
</html>

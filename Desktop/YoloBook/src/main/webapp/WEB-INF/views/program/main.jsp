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
</head>

<body>

<%-- <%=request.getContextPath() %> --%>
<%-- ${request.contextPath} --%>

<center>
<div> 
&nbsp;
	<div>
		<h1>관리자 메인 창</h1>
	</div>
&nbsp;
</div>
<br>
<!-- <input type=button value=회원정보 onclick="location.href='memberlist'"> -->
<!-- <input type=button value='프로그램 추가' onclick="location.href='pinsert'"> -->
<!-- <input type=button value='프로그램 정보' onclick="location.href='pselect'"> -->
<input type=button value=회원정보 onclick="changeIfrm(1)">
<input type=button value='프로그램 추가' onclick="changeIfrm(2)">
<input type=button value='프로그램 정보' onclick="changeIfrm(3)"><br>
	<!-- <iframe name="ifrm" id="ifrm" width="90%"  style="height: 100%"  scrolling="auto"></iframe>  iframe은 height를 최대치로 할 수 없어서 아래의 코드를 사용한다-->
	<iframe name="ifrm" id="ifrm" onload="calcHeight();" frameborder="0" scrolling="yes" style="overflow-x:hidden; overflow:auto; width:100%; min-height:500px;"></iframe>
</center>
</body>

<!-- jsp화면을 가져오기 위해서는, ajax가 아니고 include를 사용해야한다.  -->
<script src="resources/jquery-3.2.1.min.js"></script>
<script>
function changeIfrm(idx) {
	var ifrm = document.getElementById("ifrm");
	if(idx == 1) {
	ifrm.contentWindow.document.location.href = "memberlist";
	} else if(idx == 2) {
	ifrm.contentWindow.location.href = "pinsert";
	}
	else if(idx == 3) {
	ifrm.contentWindow.location.href = "pselect";
	}
}
</script>
</html>
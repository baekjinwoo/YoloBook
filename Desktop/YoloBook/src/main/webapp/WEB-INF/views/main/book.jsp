<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
/* td,tr{
border : 1px solid blue;} */
.container {
 position:absolute; 
 top:20%; left:30%; 
 width:100px; 
 height:200px; 
 text-align: center;

 }
 .book-result{
 left:50%; 
 }
 .result-right{
 text-align: right;
 }


</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Startup Framework Inspired Pricing Table</title>

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="resources/Startup/assets/css/bootstrap.min.css">

<!-- Main Style -->
<link rel="stylesheet" type="text/css"
	href="resources/Startup/assets/css/main.css">

<!--Icon Fonts-->
<link rel="stylesheet" media="screen"
	href="resources/Startup/assets/fonts/font-awesome/font-awesome.min.css" />

</head>

<body>
	<!-- Pricing Table Section -->
	<section id="pricing-table">
		<div class="container">
			<div class="row">
				<div class="pricing">
					<div class="col-md-4 col-sm-12 col-xs-12">
						<div class="pricing-table">
							<div class="pricing-header">
								<p class="pricing-title">예약이 완료되었습니다.</p>
								<p class="pricing-rate">
									<sup>$</sup> 0 <span>/Mo.</span>
								</p>
								<a href="#" class="btn btn-custom">And Get Free Month</a>
								<table class = "book-result">
                                  <tr><td>프로그램번호 </td><td class="result-right"> ${programvo.pnumber}</td></tr>
                                  <tr><td>프로그램명  </td><td class="result-right"> ${programvo.pname}</td></tr>
                                  <tr><td>시작시간  </td><td class="result-right"> ${programvo.starttime}</td></tr>
                                  <tr><td>종료시간  </td><td class="result-right"> ${programvo.endtime}</td></tr>
                                  <tr><td>날짜  </td><td class="result-right"> ${programvo.day}</td></tr>
                                  <tr><td>가격  </td><td class="result-right"> ${programvo.price}</td></tr>
                                  <tr><td>정원  </td><td class="result-right"> ${programvo.limit}</td></tr>
                                 </table>
								
								<form action="/program/calendar" method="post">
                                <input type="submit" value="예약 페이지 가기">
                                </form>
							</div>							
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- Pricing Table Section End -->
</body>
</html>

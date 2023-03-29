<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		section {
			width:1000px;
			min-height:500px;
			margin:auto;
			margin-top:50px;
		}
		.commute_info {
			width:800px;
			margin:auto;
			border-collapse:collapse;
		}
		.commute_info th {
			height:30px;
			text-align:center;
		}
		.commute_info td {
			border:1px solid black;
			height:23px;
			text-align:center;
		}
		.commute_info tr td:first-child {
			width:100px;
		}
		.commute_info tr td:nth-child(2),
		.commute_info tr td:nth-child(3),
		.commute_info tr td:nth-child(4) {
			width:200px;
		}
		.commute_info tr td:last-child {
			width:100px;
		}
	</style>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		$(function(){
			$.datepicker.setDefaults({
				monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				showMonthAfterYear: true,
				yearSuffix: '년'
				
			});
			$("#datepicker").datepicker({
				dateFormat:"yy-mm-dd",
				showOn:"button",
				buttonImage:"/cal.jpg",
				buttonImageOnly:true,
				changeMonth:true
			});
		});
	</script>
</head>
<body>
	<section>
	<span><input type="text" id="datepicker" name="date" size="8" readonly></span>
		<table class="commute_info">
			<caption><h3>출퇴근기록(<label for="datepicker">날짜변경</label>)</h3></caption>
			<tr>
				<th>사원번호</th>
				<th>사원이름</th>
				<th>출근시간</th>
				<th>퇴근시간</th>
				<th>상태</th>
			</tr>
			<c:forEach items="${list}" var="cvo">
			<c:if test="${cvo.state==0}"><c:set value="정상" var="state"/></c:if>
			<c:if test="${cvo.state==1}"><c:set value="지각" var="state"/></c:if>
			<c:if test="${cvo.state==2}"><c:set value="조퇴" var="state"/></c:if>
			<c:if test="${cvo.state==3}"><c:set value="지각/조퇴" var="state"/></c:if>
			<c:if test="${cvo.state==4}"><c:set value="결근" var="state"/></c:if>
			<c:if test="${cvo.state==5}"><c:set value="휴가" var="state"/></c:if>
			<tr>
				<td>${cvo.empId}</td>
				<td>${cvo.name}</td>
				<td>${cvo.towork}</td>
				<td>${cvo.tohome}</td>
				<td>${state}</td>
			</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>
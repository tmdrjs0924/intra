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
			width:800px;
			min-height:500px;
			margin:auto;
			margin-top:50px;
		}
		.commute_btn {
			width:800px;
			height:30px;
			text-align:right;
		}
		.commute_btn button {
			width:100px;
			height:30px;
			font-size:15px;
			font-weight:600;
		}
		.member_info,
		.commute_info {
			width:800px;
			margin:auto;
			margin-bottom:30px;
			border-collapse:collapse;
		}
		.member_info td,
		.commute_info td {
			border:1px solid black;
			height:23px;
		}
		.member_info tr td:nth-child(2n-1),
		.commute_info tr td:nth-child(2n-1) {
			width:100px;
			text-indent:5px;
		}
		.member_info tr td:nth-child(2n),
		.commute_info tr td:nth-child(2n) {
			width:300px;
			text-indent:5px;
		}
	</style>
</head>
<body>
	<section>
		<div class="commute_btn">
			<c:if test="${chk==1}">
				<button type="button" onclick="location='../member/towork'">출근</button>
			</c:if>
			<c:if test="${chk==2}">
				<button type="button" onclick="location='../member/tohome'">퇴근</button>
			</c:if>
			<c:if test="${chk==3}">
				수고!
			</c:if>
		</div>
		
		<table class="member_info">
			<caption><h3>회원정보</h3></caption>
			<tr>
				<td>부서</td>
				<td>${mvo.depart_name}</td>
				<td>사원번호</td>
				<td>${mvo.empId}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${mvo.name}</td>
				<td>연락처</td>
				<td>${mvo.phone}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="3">${mvo.address}, ${mvo.address_etc}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${mvo.email}</td>
				<td>입사일</td>
				<td>${mvo.joining}</td>
			</tr>
		</table>
		
		<table class="commute_info">
			<caption><h3>출퇴근시간</h3></caption>
			<tr>
				<td>출근시간</td>
				<td>${cvo.towork}</td>
				<td>퇴근시간</td>
				<td>${cvo.tohome}</td>
			</tr>
		</table>
		
		
	</section>
</body>
</html>
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
			padding-top:100px;
			text-align:center;
		}
		input[type=text],
		input[type=password] {
			width:400px;
			height:40px;
			font-size:16px;
			margin-bottom:5px;
			outline:none;
			text-indent:3px;
		}
		input[type=submit],
		input[type=button] {
			width:201px;
			height:44px;
			background:white;
			border:1px solid black;
			font-size:16px;
			font-weight:600;
		}
		.depart {
			width:408px;
			height:44px;
			font-size:16px;
			margin-bottom:5px;
			text-indent:3px;
		}
		.level {
			width:408px;
			height:44px;
			font-size:16px;
			margin-bottom:5px;
			text-indent:3px;
		}
	</style>
</head>
<body>
	<section>
		<div><h3>사원추가</h3></div>
		<form method="post" action="member_input_ok">
			<div><input type="text" name="userid" placeholder="아이디"></div>
			<div><input type="password" name="pwd" placeholder="비밀번호"></div>
			<div><input type="text" name="name" placeholder="이름"></div>
			<div><input type="text" name="empId" value="${code}" readonly></div>
			<div>
				<select name="depart" class="depart">
					<c:forEach items="${list}" var="dvo">
						<option value="${dvo.code}">${dvo.name}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<select name="level" class="level">
					<option value="20">사원</option>
					<option value="40">하급관리자</option>
					<option value="60">중급관리자</option>
					<option value="80">상급관리자</option>
				</select>
			</div>
			<div>
				<input type="submit" value="추가">
				<input type="button" value="이전" onclick="location='../main/main'">
			</div>
		</form>
	</section>
</body>
</html>
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
			height:400px;
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
		input[type=submit] {
			width:408px;
			height:44px;
			background:white;
			border:1px solid black;
			font-size:16px;
			font-weight:600;
		}
	</style>
	<script>
		<c:if test="${chk==1}">
			alert("로그인 후 이용해주세요.");
		</c:if>
	</script>
</head>
<body>
	<section>
		<div><h3>로그인</h3></div>
		<form method="post" action="login">
			<div><input type="text" name="userid" placeholder="아이디" value="admin"></div>
			<div><input type="password" name="pwd" placeholder="비밀번호" value="123"></div>
			<div><input type="submit" value="로그인"></div>
		</form>
	</section>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		body {
			margin:0px;
		}
		a {
			text-decoration:none;
			color:black;
		}
		a:hover {
			color:blue;
		}
		.intro {
			width:1000px;
			height:50px;
			line-height:50px;
			margin:auto;
			text-align:center;
			font-size:20px;
		}
		header {
			width:1000px;
			height:50px;
			line-height:30px;
			margin:auto;
			text-align:right;
			font-size:14px;
		}
		nav {
			width:1000px;
			height:50px;
			margin:auto;
			font-size:15px;
		}
		nav .menus {
			display:flex;
			justify-content:center;
			align-items:center;
		}
		nav .menu {
			width:150px;
			height:30px;
			line-height:30px;
			text-align:center;
			border:1px solid black;
		}
		footer {
			width:1000px;
			height:100px;
			margin:auto;
			margin-top:100px;
			text-align:center;
		}
	</style>
	<sitemesh:write property="head"/>
</head>
<body>
	<div class="intro"> 이달의 우수사원 - ㅇㅇㅇ - </div>

	<!-- 로그인 -->
	<header>
		<c:if test="${name==null}">
			<a href="../member/login"> 로그인 </a>
		</c:if>
		<c:if test="${name!=null}">
			<a href="../member/logout"> 로그아웃 </a>
			 │ 
			<a href="../member/mypage"> 내 정보 </a>
		</c:if>
		<c:if test="${level>=60}">
			 │ 
			<a href="../member/member_input"> 사원추가 </a>
		</c:if>
		<c:if test="${level>=100}">
			 │ 
			<a href="../member/member_commute"> 출퇴기록 </a>
		</c:if>
	</header>
	
	<!-- 메뉴 -->
	<nav>
		<div class="menus">
			<a href="../main/main" class="menu"> 메인 </a>
			<div class="menu"> 부서조회 </div>
			<div class="menu"> 근태관리 </div>
			<div class="menu"> 급여관리 </div>
			<div class="menu"> 각종서류 </div>
		</div>
	</nav>
	
	
	<!-- 내용 -->
	<sitemesh:write property="body"/>
	
	<!-- 기타정보 -->
	<footer>
		<div class="info"> 회사정보 </div>
	</footer>
</body>
</html>
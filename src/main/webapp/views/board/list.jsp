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
			height:600px;
			margin:auto;
		}
		table {
			border-collapse:collapse;
		}
		table th {
			border-bottom:2px solid black;
			height:30px;
		}
		table td {
			border-top:1px solid black;
			height:26px;
			font-size:15px;
		}
		table tr:last-child td {
			border-top:2px solid black;
			text-align:right;
		}
		table td:first-child {
			width:700px;
			text-align:left;
		}
		table td:nth-child(2) {
			width:100px;
			text-align:center;
		}
		table td:nth-child(3) {
			width:100px;
			text-align:center;
		}
		table td:last-child {
			width:100px;
			text-align:center;
		}
		#title {
			cursor:pointer;
		}
	</style>
	<script>
		<c:if test="${chk==1}">alert("권한이 없습니다");</c:if>
	</script>
</head>
<body>
	<section>
		<table width="800" align="center">
			<caption> <h3> 부서 게시판 </h3> </caption>
			<tr>
				<th> 제 목 </th>
				<th> 작성자 </th>
				<th> 조회수 </th>
				<th> 작성일 </th>
			</tr>
			<c:forEach items="${list}" var="bvo">
			<tr>
				<td id="title" onclick="location='readnum?id=${bvo.id}'"> ${bvo.title} </td>
				<td> ${bvo.name} </td>
				<td> ${bvo.readnum} </td>
				<td> ${bvo.date} </td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="4"><button type="button" onclick="location='write'"> 글쓰기 </button></td>
			</tr>
		</table>
	</section>
</body>
</html>
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
			margin-top:100px;
		}
		section input[type=button] {
			width:60px;
			height:25px;
			outline:none;
		}
		section table {
			border-collapse:collapse;
			border-top:2px solid black;
			border-bottom:2px solid black;
		}
		section table td {
			border-top:1px solid black;
			border-bottom:1px solid black;
			height:22px;
		}
		section #title {
			font-size:20px;
			text-align:center;
		}
		section #head td {
			font-size:14px;
		}
		section #content {
			width:700px;
			height:200px;
			resize:none;
			border:none;
			outline:none;
			padding:5px 0;
		}
	</style>
</head>
<body>
	<section>
		<table align="center">
			<tr>
				<td colspan="4" id="title"> ${bvo.title} </td>
			</tr>
			<tr id="head">
				<td width="100"> ${bvo.name} </td>
				<td width="420"></td>
				<td width="80"> 조회 ${bvo.readnum} </td>
				<td width="100"> ${bvo.date} </td>
			</tr>
			<tr>
				<td colspan="4"><textarea id="content" readonly> ${bvo.content} </textarea></td>
			</tr>
			<tr align="right">
				<td colspan="4">
					<input type="button" value="목록" onclick="location='list'">
					<c:if test="${bvo.empId==empId}">
						<input type="button" value="수정" onclick="location='update?id=${bvo.id}'">
						<input type="button" value="삭제" onclick="location='delete_ok?id=${bvo.id}'">
					</c:if>
					<c:if test="${bvo.empId!=empId}">
						<input type="button" value="수정" onclick="alert('권한이 없습니다')">
						<input type="button" value="삭제" onclick="alert('권한이 없습니다')">
					</c:if>
				</td>
			</tr>
		</table>
	</section>
</body>
</html>
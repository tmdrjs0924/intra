<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			margin-top:150px;
		}
		section table {
			width:500px;
			text-align:center;
		}
		section input[type=text] {
			width:398px;
			height:20px;
			outline:none;
		}
		section input[type=submit],
		section input[type=button] {
			width:60px;
			height:25px;
			outline:none;
		}
		section textarea {
			width:400px;
			height:150px;
			resize:none;
			outline:none;
		}
		section select {
			width:120px;
			height:25px;
			outline:none;
		}
	</style>
	<script>
		window.onload=function(){
			document.getElementById("level").value=${bvo.level};
		}
	</script>
</head>
<body>
	<section>
		<form method="post" action="update_ok">
			<input type="hidden" name="id" value="${bvo.id}">
			<table align="center">
				<tr>
					<td width="100"> 제 목 </td>
					<td width="400"> <input type="text" name="title" value="${bvo.title}"> </td>
				</tr>
				<tr>
					<td> 내 용 </td>
					<td> <textarea name="content">${bvo.content}</textarea> </td>
				</tr>
				<tr>
					<td> 읽기권한 </td>
					<td align="left"> 
						<select name="level" id="level">
							<option> 레벨선택 </option>
							<option value="80"> 상급관리자 </option>
							<option value="60"> 중급관리자 </option>
							<option value="40"> 하급관리자 </option>
							<option value="20"> 평직원 </option>
						</select>
					</td>
				</tr>
				<tr align="right">
					<td colspan="2">
						<input type="submit" value="수정">
						<input type="button" value="취소" onclick="location='content?id=${bvo.id}'">
					</td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>
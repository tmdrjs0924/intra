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
			width:350px;
			margin:auto;
			margin-top:15px;
		}
		#mform {
			width:350px;
			margin:auto;
		}
		select {
			width:172px;
			height:22px;
			margin-bottom:4px;
		}
		input[type=text] {
			width:343px;
			height:18px;
			outline:none;
			margin-bottom:4px;
		}
		textarea {
			width:343px;
			height:100px;
			outline:none;
			resize:none;
			padding:3px;
		}
		#btn {
			text-align:center;
		}
		input[type=submit] {
			width:170px;
			height:28px;
			background:white;
			border:1px solid black;
			margin-right:3px;
		}
		input[type=button] {
			width:170px;
			height:28px;
			background:white;
			border:1px solid black;
		}
	</style>
	<script>
		function getName(depart) {
			var chk=new XMLHttpRequest();
			chk.open("get", "getName?depart="+depart);
			chk.send();
			chk.onload=function(){
				var data=JSON.parse(chk.responseText);
				var str="";
				for(mem in data){
					str=str+"<option value='"+data[mem].empId+"'>"+data[mem].name+"</option>";
				}
				document.mform.receiver.innerHTML=str;
			}
		}
	</script>
</head>
<body>
	<section>
		<div id="mform">
			<form name="mform">
			<input type="hidden" name="sender" value="${sender}">
			<div>
				<select name="depart" onchange="getName(this.value)">
					<option>선택</option>
					<c:forEach items="${list}" var="dvo">
					<option value="${dvo.code}"> ${dvo.name} </option>
					</c:forEach>
				</select>
				<select name="receiver">
					
				</select>
			</div>
			<div><input type="text" name="title" placeholder="제목"></div>
			<div><textarea name="content" placeholder="내용"></textarea></div>
			<div id="btn">
				<input type="submit" value="보내기">
				<input type="button" value="취소" onclick="window.close()">
			</div>
			</form>
		</div>
	</section>
</body>
</html>